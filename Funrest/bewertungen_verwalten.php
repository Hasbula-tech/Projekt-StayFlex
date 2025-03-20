<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include 'db.php';

// Admin-Check: Nur Admins dürfen diese Seite sehen
if (!isset($_SESSION['user_id']) || !isset($_SESSION['isAdmin']) || $_SESSION['isAdmin'] != 1) {
    header("Location: login.php");
    exit;
}

// Falls eine Bewertung genehmigt wurde
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['approve_id'])) {
    $id = intval($_POST['approve_id']);
    $stmt = $conn->prepare("UPDATE bewertungen SET is_approved = TRUE WHERE id = ?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        header("Location: bewertungen_verwalten.php"); // Seite neuladen nach Genehmigung
        exit;
    }
    $stmt->close();
}

// Nicht genehmigte Bewertungen abrufen
$sql = "SELECT id, name, rating, kommentar FROM bewertungen WHERE is_approved = FALSE ORDER BY created_at DESC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bewertungen verwalten - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Willkommen im FUNREST Hotel</h1>
        <?php include 'nav.php'; ?>
    </header>
    
    <main>
        <section class="bewertungen-liste">
            <h2>Ausstehende Bewertungen</h2>
            <table class="table-modern">
                <thead>
                    <tr>
                        <th>Bewertungs-ID</th>
                        <th>Kunde</th>
                        <th>Bewertung</th>
                        <th>Sterne</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result->num_rows > 0): ?>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo $row['id']; ?></td>
                                <td><?php echo htmlspecialchars($row['name']); ?></td>
                                <td><?php echo htmlspecialchars($row['kommentar']); ?></td>
                                <td><?php echo str_repeat("⭐", $row['rating']); ?></td>
                                <td>
                                    <form action="bewertungen_verwalten.php" method="post">
                                        <input type="hidden" name="approve_id" value="<?php echo $row['id']; ?>">
                                        <button type="submit" class="approve-button">Freigeben</button>
                                    </form>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5">Keine ausstehenden Bewertungen.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>
</body>
</html>

<?php
$conn->close();
?>
