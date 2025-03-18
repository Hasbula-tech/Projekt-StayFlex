<?php
// Datenbankverbindung herstellen
$servername = "localhost";
$username = "root"; // Dein MySQL-User
$password = "admin"; // Falls du ein Passwort hast, hier eintragen
$dbname = "funrest"; // Deine Datenbank

$conn = new mysqli($servername, $username, $password, $dbname, 3306);

// Fehlerprüfung
if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}

// Daten aus dem Formular holen
$name = trim($_POST['name']);
$email = trim($_POST['email']);
$zimmerkategorie = trim($_POST['zimmerTyp']); // Luxus, Standard, Premium
$zimmerTyp = trim($_POST['zimmerAnzahl']); // Einzelzimmer oder Doppelzimmer
$anreise = $_POST['anreise'];
$abreise = $_POST['abreise'];

// Validierung
if (empty($name) || empty($email) || empty($zimmerkategorie) || empty($zimmerTyp) || empty($anreise) || empty($abreise)) {
    echo "<script>alert('Bitte alle Felder ausfüllen!'); window.location.href='buchung.php';</script>";
    exit();
}

// User-ID herausfinden oder neuen User erstellen
$sql_user = "SELECT UserID FROM User WHERE Name=? AND Adresse=?";
$stmt = $conn->prepare($sql_user);
$stmt->bind_param("ss", $name, $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    $user_id = $user['UserID'];
} else {
    // Falls User nicht existiert, neuen User anlegen
    $sql_insert_user = "INSERT INTO User (Name, Adresse) VALUES (?, ?)";
    $stmt = $conn->prepare($sql_insert_user);
    $stmt->bind_param("ss", $name, $email);
    $stmt->execute();
    $user_id = $conn->insert_id;
}

// Zimmer anhand Kategorie & Typ abrufen
$sql_zimmer = "SELECT ZimmerID, Preis FROM Zimmer WHERE Kategorie=? AND Typ=? AND Verfuegbarkeit=1 LIMIT 1";
$stmt = $conn->prepare($sql_zimmer);
$stmt->bind_param("ss", $zimmerkategorie, $zimmerTyp);
$stmt->execute();
$result = $stmt->get_result();

// Prüfen, ob ein Zimmer verfügbar ist
if ($result->num_rows > 0) {
    $buchungsdatum = date("Y-m-d"); // aktuelles Datum
    $zimmer = $result->fetch_assoc();
    $zimmer_id = $zimmer['ZimmerID'];
    $preis = $zimmer['Preis'];

    // Buchung speichern
    $sql_buchung = "INSERT INTO Buchung (UserID, ZimmerID, Buchungsdatum, CheckIn, CheckOut, Kosten) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt_buchung = $conn->prepare($sql_buchung);
    $stmt_buchung->bind_param("iisssd", $user_id, $zimmer_id, $buchungsdatum, $anreise, $abreise, $preis);
    $stmt_buchung->execute();

    // Zimmer als belegt markieren
    $sql_update = "UPDATE Zimmer SET Verfuegbarkeit=0 WHERE ZimmerID=?";
    $stmt_update = $conn->prepare($sql_update);
    $stmt_update->bind_param("i", $zimmer_id);
    $stmt_update->execute();

    echo "<script>alert('Buchung erfolgreich!'); window.location.href='buchung.php';</script>";
} else {
    echo "<script>alert('Kein verfügbares Zimmer in dieser Kategorie gefunden.'); window.location.href='buchung.php';</script>";
}

// Verbindung schließen
$conn->close();
?>
