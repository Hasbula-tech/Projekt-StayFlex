<?php
$servername = "localhost"; // Falls dein Server anders heißt, hier ändern
$username = "root";
$password = "admin"; // Falls du ein Passwort hast, hier eintragen
$database = "funrest"; // Name deiner Datenbank

$conn = new mysqli($servername, $username, $password, $database, 3307);

// Verbindung prüfen
if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}
?>
