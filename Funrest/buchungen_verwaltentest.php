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

// Alle Buchungen aus der Datenbank abrufen
$sql = "SELECT 
            Buchung.BuchungID, 
            User.Name, 
            User.Adresse AS Email, 
            Zimmer.Kategorie, 
            Zimmer.Typ, 
            Buchung.CheckIn, 
            Buchung.CheckOut 
        FROM Buchung
        JOIN User ON Buchung.UserID = User.UserID
        JOIN Zimmer ON Buchung.ZimmerID = Zimmer.ZimmerID
        ORDER BY Buchung.CheckIn ASC";

$result = $conn->query($sql);
?>