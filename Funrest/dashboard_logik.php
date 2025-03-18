<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    die("Zugriff verweigert. Bitte <a href='login.html'>einloggen</a>.");
}
?>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <h2>Willkommen, <?php echo $_SESSION['username']; ?>!</h2>
    <p>Du bist eingeloggt.</p>
    <a href="logout.php">Logout</a>
</body>
</html>
