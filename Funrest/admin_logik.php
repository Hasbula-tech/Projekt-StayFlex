<?php
session_start();
include 'db.php';

// Prüfen, ob der Benutzer Admin ist (angenommen, Admin hat user_id = 1)
if (!isset($_SESSION['user_id']) || $_SESSION['user_id'] != 1) {
    die("Kein Zugriff! Nur Administratoren können diese Seite aufrufen.");
}

// Falls eine Bewertung freigegeben wird
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['approve_id'])) {
    $id = intval($_POST['approve_id']);
    $stmt = $conn->prepare("UPDATE bewertungen SET is_approved = TRUE WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
}

// Zur Bewertungsverwaltung weiterleiten
header("Location: bewertungen_verwalten.html");
exit;
?>
