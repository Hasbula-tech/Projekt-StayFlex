<?php
session_start();
include 'db.php';

// Freigegebene Bewertungen abrufen
$sql = "SELECT name, rating, kommentar FROM bewertungen WHERE is_approved = TRUE ORDER BY created_at DESC";
$result = $conn->query($sql);
?>


<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bewertungen - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<header>
        <h1>Willkommen im FUNREST Hotel</h1>
        <?php include 'nav.php'; ?>
    </header>
    
    <main>

    <section class="bewertungen-container">

        <section class="home-bewertungen">
                <h2>Das sagen unsere Gäste</h2>
                <div class="home-bewertungen-wrapper">
                <div class="home-bewertungen-slider">
                        <?php if ($result->num_rows > 0): ?>
                            <?php while ($row = $result->fetch_assoc()): ?>
                                <div class="home-bewertungen-item">
                                    <p><strong><?php echo htmlspecialchars($row['name']); ?></strong> 
                                        <?php echo str_repeat("⭐", $row['rating']); ?>
                                    </p>
                                    <p>„<?php echo htmlspecialchars($row['kommentar']); ?>“</p>
                                </div>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <p>Es gibt noch keine Bewertungen.</p>
                        <?php endif; ?>
                    </div>
                </div>
        </section>
    </section>
        
        <section class="bewertung-abgeben">
            <h2>Teilen Sie Ihre Erfahrung</h2>
            <form action="bewertung_speichern_logik.php" method="POST" class="form-container">
                <label for="name">Ihr Name:</label>
                <input type="text" id="name" name="name" required placeholder="Ihr Name">
                
                <label for="rating">Ihre Bewertung:</label>
                <select id="rating" name="rating" class="select-style">
                    <option value="5">⭐⭐⭐⭐⭐ (5 Sterne)</option>
                    <option value="4">⭐⭐⭐⭐☆ (4 Sterne)</option>
                    <option value="3">⭐⭐⭐☆☆ (3 Sterne)</option>
                    <option value="2">⭐⭐☆☆☆ (2 Sterne)</option>
                    <option value="1">⭐☆☆☆☆ (1 Stern)</option>
                </select>
                
                <label for="kommentar">Ihr Kommentar:</label>
                <textarea id="kommentar" name="kommentar" required placeholder="Teilen Sie Ihre Erfahrung mit uns..." rows="4"></textarea>
                
                <button type="submit" class="button">Bewertung abgeben</button>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>

    <script src="script.js" defer></script>

</body>
</html>

<?php $conn->close(); ?>
