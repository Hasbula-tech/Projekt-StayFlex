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
    <title>Home - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body class="home">
    <header>
        <h1>Willkommen im FUNREST Hotel</h1>
        <?php include 'nav.php'; ?>
    </header>
    
    <main>
        <div class="content-wrapper">
            <section class="hero">
                <h2 class="home-header">Ihr Traumhotel erwartet Sie!</h2>
                <p class="home-header">Buchen Sie jetzt Ihr Zimmer online und erleben Sie Luxus pur.</p>
                <a href="buchung.php" class="button">Jetzt buchen</a>
            </section>
            
            <section class="features">
                <h2>Unsere Highlights</h2>
                <ul>
                    <li>🏨 Luxuriöse Zimmer mit atemberaubender Aussicht</li>
                    <li>🍽 Erstklassige Restaurants und Zimmerservice</li>
                    <li>🏊‍♂️ Spa, Pool und Fitnessbereich</li>
                    <li>📍 Perfekte Lage im Herzen der Stadt</li>
                </ul>
            </section>
        </div>

        <!-- Dynamische Bewertungen aus der Datenbank -->
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
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel</p>
    </footer>

    <script src="script.js" defer></script>
</body>
</html>

<?php $conn->close(); ?>
