<?php
session_start();
include 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Daten aus dem Formular holen
$name         = trim($_POST['name']);
$strasse      = trim($_POST['strasse']);
$hausnummer   = trim($_POST['hausnummer']);
$plz          = trim($_POST['plz']);
$ort          = trim($_POST['ort']);
$geschlecht   = $_POST['geschlecht'] ?? null;
$geburtsdatum = $_POST['geburtsdatum'] ?: null;

// Prüfen, ob schon ein Datensatz existiert
$sql_check = "SELECT StammUser FROM gast WHERE LoginID = ?";
$stmt = $conn->prepare($sql_check);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // 🛠️ Update: bestehender Eintrag → StammUser behalten
    $row = $result->fetch_assoc();
    $stammUser = $row['StammUser'];

    $sql = "UPDATE gast 
            SET Name=?, Strasse=?, Hausnummer=?, PLZ=?, Ort=?, Geschlecht=?, Geburtsdatum=?, StammUser=?
            WHERE LoginID=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssssii", $name, $strasse, $hausnummer, $plz, $ort, $geschlecht, $geburtsdatum, $stammUser, $user_id);
} else {
    // ➕ Neuer Eintrag → StammUser standardmäßig auf 0
    $sql = "INSERT INTO gast (Name, Strasse, Hausnummer, PLZ, Ort, Geschlecht, Geburtsdatum, StammUser, LoginID) 
            VALUES (?, ?, ?, ?, ?, ?, ?, 0, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssssi", $name, $strasse, $hausnummer, $plz, $ort, $geschlecht, $geburtsdatum, $user_id);
}

$stmt->execute();
$stmt->close();
$conn->close();

// Zurück zum Profil
header("Location: profile_logik.php");
exit;
?>
