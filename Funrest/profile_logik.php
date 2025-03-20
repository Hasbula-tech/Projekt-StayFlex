<?php
session_start();
include 'db.php';


// Prüfen, ob der Nutzer eingeloggt ist
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// Benutzerinformationen abrufen
$user_id = $_SESSION['user_id'];
$sql = "SELECT username, email FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($username, $email);
$stmt->fetch();
$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mein Profil - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
        <h1>Willkommen im FUNREST Hotel</h1>
        <?php include 'nav.php'; ?>
    </header>
    

    <main>
        <section class="profil-container">
            <h2>Mein Profil</h2>
            <p><strong>Benutzername:</strong> <?php echo htmlspecialchars($username); ?></p>
            <p><strong>E-Mail:</strong> <?php echo htmlspecialchars($email); ?></p>

            <h3>Aktionen</h3>
            <ul>
                <li><a href="passwort_aendern.php">Passwort ändern</a></li>
                <li><a href="logout.php">Ausloggen</a></li>
            </ul>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>

</body>
</html>
