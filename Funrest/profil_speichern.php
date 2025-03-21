<?php
session_start();
include 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Daten absichern
$name = trim($_POST['name']);
$adresse = trim($_POST['adresse']);
$geschlecht = $_POST['geschlecht'] ?? null;
$geburtsdatum = $_POST['geburtsdatum'] ?: null;
$StammUser = isset($_POST['stammUser']) ? 1 : 0;

// Gibt es schon einen Gast-Eintrag?
$sql_check = "SELECT UserID FROM Gast WHERE LoginID = ?";
$stmt = $conn->prepare($sql_check);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Update
    $sql = "UPDATE Gast SET Name=?, Adresse=?, Geschlecht=?, Geburtsdatum=?, StammUser=? WHERE LoginID=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssii", $name, $adresse, $geschlecht, $geburtsdatum, $StammUser, $user_id);
} else {
    // Neu einfügen
    $sql = "INSERT INTO Gast (Name, Adresse, Geschlecht, Geburtsdatum, StammUser, LoginID) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssii", $name, $adresse, $geschlecht, $geburtsdatum, $StammUser, $user_id);
}

$stmt->execute();
$stmt->close();
$conn->close();

// Zurück zum Profil
header("Location: profile_logik.php");
exit;
?>
