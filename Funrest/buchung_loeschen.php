<?php
// Datenbankverbindung herstellen
include 'db.php';
// Buchung löschen, wenn ID vorhanden ist
if (isset($_GET['id'])) {
    $buchung_id = intval($_GET['id']);

    $sql = "DELETE FROM Buchung WHERE BuchungID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $buchung_id);

    if ($stmt->execute()) {
        echo "<script>alert('Buchung erfolgreich gelöscht!'); window.location.href='buchungen_verwalten.php';</script>";
    } else {
        echo "<script>alert('Fehler beim Löschen der Buchung.'); window.location.href='buchungen_verwalten.php';</script>";
    }
} else {
    echo "<script>alert('Ungültige Anfrage.'); window.location.href='buchungen_verwalten.php';</script>";
}

// Verbindung schließen
$conn->close();
?>
