<?php
session_start();
include 'db.php';

// Sicherheitsprüfung
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["success" => false, "message" => "Nicht eingeloggt"]);
    exit();
}

$user_id = $_SESSION['user_id'];

// Nutzerdaten abrufen
$sql_user = "SELECT u.email, g.Name, g.Adresse, g.Geschlecht 
             FROM users u 
             JOIN gast g ON u.id = g.UserID 
             WHERE u.id = ?";
$stmt = $conn->prepare($sql_user);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(["success" => false, "message" => "Keine Benutzerdaten gefunden."]);
    exit();
}

$userData = $result->fetch_assoc();
$email = $userData['email'];
$name = $userData['Name'];
$adresse = $userData['Adresse'];
$geschlecht = $userData['Geschlecht'];

// Formular-Daten
$zimmerkategorie = trim($_POST['zimmerTyp']);
$zimmerTyp = trim($_POST['zimmerAnzahl']);
$anreise = $_POST['anreise'];
$abreise = $_POST['abreise'];

// Validierung
if (empty($zimmerkategorie) || empty($zimmerTyp) || empty($anreise) || empty($abreise)) {
    echo json_encode(["success" => false, "message" => "Bitte alle Felder ausfüllen!"]);
    exit();
}

// 🏨 Anzahl Zimmer in dieser Kategorie/Typ
$sql_anzahl = "SELECT Anzahl FROM Zimmer WHERE Kategorie = ? AND Typ = ? LIMIT 1";
$stmt = $conn->prepare($sql_anzahl);
$stmt->bind_param("ss", $zimmerkategorie, $zimmerTyp);
$stmt->execute();
$result = $stmt->get_result();
$maxZimmer = ($result->num_rows > 0) ? $result->fetch_assoc()['Anzahl'] : 0;

if ($maxZimmer == 0) {
    echo json_encode(["success" => false, "message" => "Keine Zimmer in dieser Kategorie verfügbar"]);
    exit();
}

// 🔍 Belegte Zimmer zählen
$sql_belegt = "
    SELECT COUNT(DISTINCT Zimmer.ZimmerID) AS belegte
    FROM Buchung 
    JOIN Zimmer ON Buchung.ZimmerID = Zimmer.ZimmerID
    WHERE Zimmer.Kategorie = ? 
      AND Zimmer.Typ = ? 
      AND (
          (CheckIn <= ? AND CheckOut > ?)  
          OR (CheckIn < ? AND CheckOut >= ?) 
          OR (CheckIn >= ? AND CheckOut <= ?)
      )";


$stmt = $conn->prepare($sql_belegt);
$stmt->bind_param("ssssssss", 
    $zimmerkategorie, $zimmerTyp, 
    $abreise, $anreise,  
    $anreise, $abreise,  
    $anreise, $abreise
);
$stmt->execute();
$result = $stmt->get_result();
$belegteZimmer = ($result->num_rows > 0) ? $result->fetch_assoc()['belegte'] : 0;

if ($belegteZimmer >= $maxZimmer) {
    echo json_encode(["success" => false, "message" => "Kein verfügbares Zimmer in diesem Zeitraum verfügbar."]);
    exit();
}


// ✅ Freies Zimmer finden
$sql_zimmer = "
    SELECT z.ZimmerID, z.Preis, z.Anzahl,
        (
            SELECT COUNT(*) 
            FROM Buchung b
            WHERE b.ZimmerID = z.ZimmerID
              AND (
                (b.CheckIn <= ? AND b.CheckOut > ?) OR
                (b.CheckIn < ? AND b.CheckOut >= ?) OR
                (b.CheckIn >= ? AND b.CheckOut <= ?)
              )
        ) AS belegte
    FROM Zimmer z
    WHERE z.Kategorie = ? AND z.Typ = ?
    HAVING belegte < z.Anzahl
    LIMIT 1
";




    $stmt = $conn->prepare($sql_zimmer);
    $stmt->bind_param("ssssssss", 
        $abreise, $anreise,  
        $anreise, $abreise,  
        $anreise, $abreise,  
        $zimmerkategorie, $zimmerTyp
    );
    
    
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $buchungsdatum = date("Y-m-d");
    $zimmer = $result->fetch_assoc();
    $zimmer_id = $zimmer['ZimmerID'];
    $preis_pro_tag = $zimmer['Preis'];

    $start = new DateTime($anreise);
    $end = new DateTime($abreise);
    $tage = $start->diff($end)->days;

    $gesamtpreis = $preis_pro_tag * $tage;

    $sql_max = "SELECT MAX(CAST(SUBSTRING(Rechnungsnummer, 3) AS UNSIGNED)) AS max_num FROM Buchung";
    $result_max = $conn->query($sql_max);
    $row_max = $result_max->fetch_assoc();
    $next_num = $row_max['max_num'] ? $row_max['max_num'] + 1 : 1;

    $rechnungsnummer = 'R-' . str_pad($next_num, 4, '0', STR_PAD_LEFT);
    // z.B. R-0042-20250321-837

    $kundennummer = 'K-' . str_pad($user_id, 4, '0', STR_PAD_LEFT);
    // z.B. K-0042

    // Buchung speichern
    $sql_buchung = "INSERT INTO Buchung (UserID, ZimmerID, Buchungsdatum, CheckIn, CheckOut, Kosten, Rechnungsnummer, Kundennummer) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt_buchung = $conn->prepare($sql_buchung);
    $stmt_buchung->bind_param("iissssss", $user_id, $zimmer_id, $buchungsdatum, $anreise, $abreise, $gesamtpreis, $rechnungsnummer, $kundennummer);

    $stmt_buchung->execute();

    // PDF-Daten zurückgeben
    header('Content-Type: application/json');
    echo json_encode([
        "success" => true,
        "name" => $name,
        "adresse" => $adresse,
        "geschlecht" => $geschlecht,
        "zimmer" => $zimmerkategorie,
        "buchungszeitraum" => "$anreise bis $abreise",
        "anreise" => $anreise,
        "abreise" => $abreise,
        "kosten" => (float) $gesamtpreis,
        "email" => $email,
        "userid" => $user_id,
        "rechnungsnummer" => $rechnungsnummer,
        "kundennummer" => $kundennummer
    ]);
    exit();
} else {
    echo json_encode(["success" => false, "message" => "Kein verfügbares Zimmer gefunden."]);
}

$conn->close();
?>
