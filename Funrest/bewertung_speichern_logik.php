<?php
session_start();
include 'db.php';

if (!isset($_SESSION['user_id'])) {
    die("Fehler: Sie müssen eingeloggt sein, um eine Bewertung abzugeben.");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_SESSION['user_id'];
    $name = $_SESSION['username']; // Name aus Session holen
    $rating = intval($_POST['rating']);
    $kommentar = trim($_POST['kommentar']);

    $stmt = $conn->prepare("CALL InsertBewertung(?, ?, ?, ?)");
    $stmt->bind_param("isis", $user_id, $name, $rating, $kommentar);

    if ($stmt->execute()) {
        echo "Bewertung erfolgreich gespeichert und muss freigegeben werden!";
    } else {
        echo "Fehler beim Speichern der Bewertung: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
