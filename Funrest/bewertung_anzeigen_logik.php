<?php
include 'db.php';

// Prüfen, ob "pending=true" übergeben wurde (für Admin-Bereich)
$showPending = isset($_GET['pending']) && $_GET['pending'] == 'true';

if ($showPending) {
    echo "<p>DEBUG: Admin-Modus aktiv (zeige nicht freigegebene Bewertungen)</p>";
    $sql = "SELECT id, name, rating, kommentar FROM bewertungen WHERE is_approved = FALSE ORDER BY created_at DESC";
} else {
    echo "<p>DEBUG: Benutzer-Modus aktiv (zeige freigegebene Bewertungen)</p>";
    $sql = "SELECT name, rating, kommentar FROM bewertungen WHERE is_approved = TRUE ORDER BY created_at DESC";
}

$result = $conn->query($sql);

if ($result === false) {
    die("Fehler in der SQL-Abfrage: " . $conn->error);
}

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='bewertung'>";
        echo "<p><strong>" . htmlspecialchars($row['name']) . "</strong> " . str_repeat("⭐", $row['rating']) . "</p>";
        echo "<p>„" . htmlspecialchars($row['kommentar']) . "“</p>";

        if ($showPending) {
            // Admin: Freigabe-Button
            echo "<form action='admin.php' method='post' class='approve-form'>";
            echo "<input type='hidden' name='approve_id' value='" . $row['id'] . "'>";
            echo "<button type='submit' class='approve-button'>Freigeben</button>";
            echo "</form>";
        }
        echo "</div>";
    }
} else {
    echo "<p>DEBUG: Keine passenden Bewertungen gefunden.</p>";
}

$conn->close();
?>
