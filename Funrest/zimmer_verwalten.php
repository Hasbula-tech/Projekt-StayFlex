<?php
include 'db.php';

// Zimmer aktualisieren
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update'])) {
    $zimmerID = $_POST['zimmerID'];
    $kategorie = $_POST['kategorie'];
    $preis = $_POST['preis'];
    $typ = $_POST['typ'];
    $anzahl = $_POST['anzahl'];

    $stmt = $conn->prepare("UPDATE Zimmer SET Kategorie=?, Preis=?, Typ=?, Anzahl=? WHERE ZimmerID=?");
    $stmt->bind_param("sdsii", $kategorie, $preis, $typ, $anzahl, $zimmerID);
    $stmt->execute();
}

// Zimmer löschen
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['delete'])) {
    $zimmerID = $_POST['zimmerID'];
    $conn->query("DELETE FROM Zimmer WHERE ZimmerID = $zimmerID");
}

// Zimmer abfragen
$result = $conn->query("SELECT * FROM Zimmer");
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>Zimmer verwalten</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<header>
        <h1>Willkommen im FUNREST Hotel</h1>
        <?php include 'nav.php'; ?>
    </header>

    <main>
        <section class="zimmer-liste">
            <h2>Alle Zimmer</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Kategorie</th>
                        <th>Typ</th>
                        <th>Preis (€)</th>
                        <th>Anzahl</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <form method="POST">
                                <td><?php echo $row['ZimmerID']; ?></td>
                                <td><input type="text" name="kategorie" value="<?php echo htmlspecialchars($row['Kategorie']); ?>"></td>
                                <td>
                                    <select name="typ">
                                        <option value="einzelzimmer" <?= $row['Typ'] == 'einzelzimmer' ? 'selected' : '' ?>>Einzelzimmer</option>
                                        <option value="doppelzimmer" <?= $row['Typ'] == 'doppelzimmer' ? 'selected' : '' ?>>Doppelzimmer</option>
                                    </select>
                                </td>
                                <td><input type="number" step="0.01" name="preis" value="<?php echo $row['Preis']; ?>"></td>
                                <td><input type="number" name="anzahl" value="<?php echo $row['Anzahl']; ?>"></td>
                                <td>
                                    <input type="hidden" name="zimmerID" value="<?php echo $row['ZimmerID']; ?>">
                                    <button type="submit" name="update" class="save-button">Speichern</button>
                                    <button type="submit" name="delete" class="delete-button" onclick="return confirm('Wirklich löschen?')">Löschen</button>
                                </td>
                            </form>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 FUNREST Hotel</p>
    </footer>
</script>
</body>
</html>
