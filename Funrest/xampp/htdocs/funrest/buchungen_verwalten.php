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

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buchungen verwalten - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Buchungen verwalten</h1>
        <nav>
            <ul>
                <li><a href="home.php">Home</a></li>
                <li><a href="buchung.php">Zimmer buchen</a></li>
                <li><a href="login.php">Login</a></li>
                <li><a href="admin.php">Admin</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section class="buchungen-liste">
            <h2>Alle Buchungen</h2>
            <table>
                <thead>
                    <tr>
                        <th>Buchungs-ID</th>
                        <th>Name</th>
                        <th>E-Mail</th>
                        <th>Zimmer</th>
                        <th>Typ</th>
                        <th>Anreise</th>
                        <th>Abreise</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $row["BuchungID"] . "</td>";
                            echo "<td>" . $row["Name"] . "</td>";
                            echo "<td>" . $row["Email"] . "</td>";
                            echo "<td>" . $row["Kategorie"] . "</td>";
                            echo "<td>" . $row["Typ"] . "</td>";
                            echo "<td>" . $row["CheckIn"] . "</td>";
                            echo "<td>" . $row["CheckOut"] . "</td>";
                            echo "<td><a href='buchung_loeschen.php?id=" . $row["BuchungID"] . "' class='delete-button'>Löschen</a></td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='8'>Keine Buchungen gefunden.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel</p>
    </footer>
</body>
</html>

<?php
// Verbindung schließen
$conn->close();
?>
