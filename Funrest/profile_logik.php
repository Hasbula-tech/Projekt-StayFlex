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

// Gastdaten holen
$sql_gast = "SELECT Name, Adresse, Geschlecht, Geburtsdatum, StammUser
             FROM gast WHERE LoginID = ?";
$stmt_gast = $conn->prepare($sql_gast);
$stmt_gast->bind_param("i", $user_id);
$stmt_gast->execute();
$result_gast = $stmt_gast->get_result();
$gast = $result_gast->fetch_assoc();
$stmt_gast->close();

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
    

    <main style="display: flex; justify-content: center; gap: 30px; flex-wrap: wrap;">
    <!-- Login-Infos -->
    <section class="profil-container">
        <h2>Login-Informationen</h2>
        <p><strong>Benutzername:</strong> <?php echo htmlspecialchars($username); ?></p>
        <p><strong>E-Mail:</strong> <?php echo htmlspecialchars($email); ?></p>

        <h3>Aktionen</h3>
        <ul>
            <li><a href="passwort_aendern.php">Passwort ändern</a></li>
            <li><a href="logout.php">Ausloggen</a></li>
        </ul>
    </section>

    <!-- Gastdaten anzeigen -->
    <?php if ($gast): ?>
    <section class="profil-container">
        <h2>Gästeprofil</h2>
        <form action="profil_speichern.php" method="POST" class="form-container" style="background: transparent; box-shadow: none;">

<label for="name">Name:</label>
<input type="text" id="name" name="name" class="input-feld" value="<?= htmlspecialchars($gast['Name'] ?? '') ?>">

<label for="adresse">Adresse:</label>
<input type="text" id="adresse" name="adresse" class="input-feld" value="<?= htmlspecialchars($gast['Adresse'] ?? '') ?>">

<label for="geschlecht">Geschlecht:</label>
<select id="geschlecht" name="geschlecht" class="input-feld">
    <option value="">Bitte wählen</option>
    <option value="männlich" <?= ($gast['Geschlecht'] ?? '') === 'männlich' ? 'selected' : '' ?>>Männlich</option>
    <option value="weiblich" <?= ($gast['Geschlecht'] ?? '') === 'weiblich' ? 'selected' : '' ?>>Weiblich</option>
    <option value="divers" <?= ($gast['Geschlecht'] ?? '') === 'divers' ? 'selected' : '' ?>>Divers</option>
</select>

<label for="geburtsdatum">Geburtsdatum:</label>
<input type="date" id="geburtsdatum" name="geburtsdatum" class="input-feld" value="<?= htmlspecialchars($gast['Geburtsdatum'] ?? '') ?>">

<p style="margin-top: 15px;"><strong>Stammgast:</strong> <?= !empty($gast['StammUser']) ? 'Ja' : 'Nein' ?></p>

<button class="save-button" type="submit" style="margin-top: 20px;">Änderungen speichern</button>
</form>
    </section>
    <?php else: ?>
        <p style="color: white;">Keine Gästeinformationen vorhanden.</p>
    <?php endif; ?>
</main>


    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>

</body>
</html>
