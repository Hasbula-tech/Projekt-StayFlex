<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);  // E-Mail statt Username
    $password = $_POST['password'];

    $sql = "SELECT id, username, password FROM users WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $username, $hashed_password);
        $stmt->fetch();

        if (password_verify($password, $hashed_password)) {
            // Erfolgreich eingeloggt, Session setzen
            $_SESSION['user_id'] = $id;
            $_SESSION['username'] = $username;
            echo "<script>alert('Erfolgreich eingelogggggt!'); window.location.href='home.html';</script>";;    
        } else {
            echo "Falsches Passwort.";
        }
    } else {
        echo "Benutzer mit dieser E-Mail wurde nicht gefunden.";
    }

    $stmt->close();
}

$conn->close();
?>
