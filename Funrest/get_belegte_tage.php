<?php
$servername = "localhost";
$username = "root";
$password = "admin";
$dbname = "funrest";

$conn = new mysqli($servername, $username, $password, $dbname, 3306);

if ($conn->connect_error) {
    die(json_encode(["error" => "Verbindung fehlgeschlagen"]));
}

// 🧾 Parameter holen
$kategorie = $_GET['kategorie'] ?? '';
$typ = $_GET['typ'] ?? '';


// 🛠️ 1. Zimmeranzahl abrufen
$anzahl_sql = "SELECT Anzahl FROM Zimmer WHERE Kategorie = ? AND Typ = ? LIMIT 1";
$anzahl_stmt = $conn->prepare($anzahl_sql);
$anzahl_stmt->bind_param("ss", $kategorie, $typ);
$anzahl_stmt->execute();
$anzahl_result = $anzahl_stmt->get_result();
$gesamtZimmer = ($anzahl_result->num_rows > 0) ? $anzahl_result->fetch_assoc()['Anzahl'] : 0;

if ($gesamtZimmer == 0) {
    echo json_encode([]); // keine Zimmer vorhanden → alles frei
    exit();
}

// 🧠 2. Belegungstage zählen
$tage_belegung = [];

$sql = "SELECT CheckIn, CheckOut FROM Buchung 
        JOIN Zimmer ON Buchung.ZimmerID = Zimmer.ZimmerID
        WHERE Zimmer.Kategorie = ? AND Zimmer.Typ = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $kategorie, $typ);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    $start = new DateTime($row['CheckIn']);
    $end = new DateTime($row['CheckOut']);
    $interval = new DateInterval('P1D');
    $period = new DatePeriod($start, $interval, $end);

    foreach ($period as $date) {
        $tag = $date->format('Y-m-d');
        $tage_belegung[$tag] = ($tage_belegung[$tag] ?? 0) + 1;
    }
}

// 🟥 3. Nur Tage zurückgeben, an denen alle Zimmer belegt sind
$voll_belegte_tage = [];

foreach ($tage_belegung as $tag => $anzahl) {
    if ($anzahl >= $gesamtZimmer) {
        $voll_belegte_tage[] = $tag;
    }
}

header('Content-Type: application/json');
echo json_encode($voll_belegte_tage);
?>
