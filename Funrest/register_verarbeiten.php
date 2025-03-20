<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm-password'];

    // Überprüfen, ob Passwörter übereinstimmen
    if ($password !== $confirm_password) {
        die("Fehler: Die Passwörter stimmen nicht überein.");
    }

    // Prüfen, ob die E-Mail bereits existiert
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        die("Fehler: Diese E-Mail ist bereits registriert.");
    }
    $stmt->close();

    // Passwort hashen
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Nutzer in die Datenbank einfügen (Standardmäßig kein Admin)
    $stmt = $conn->prepare("INSERT INTO users (username, email, password, isAdmin) VALUES (?, ?, ?, 0)");
    $stmt->bind_param("sss", $username, $email, $hashed_password);

    if ($stmt->execute()) {
        echo "Registrierung erfolgreich! <a href='login.php'>Hier einloggen</a>";
    } else {
        echo "Fehler bei der Registrierung.";
    }

    $stmt->close();
}

$conn->close();
?>
