<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin-Dashboard - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Admin-Dashboard</h1>
        <nav>
            <ul>
                <li><a href="home.php">Home</a></li>
                <li><a href="buchung.php">Zimmer buchen</a></li>
                <li><a href="login.php">Login</a></li>
                <li><a href="bewertungen.php">Bewertungen</a></li>
                <li><a href="admin.php">Admin</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section class="admin-dashboard">
            <h2>Willkommen, Admin!</h2>
            <p>Verwalten Sie Buchungen, Kunden und Zimmer.</p>
            
            <div class="admin-panel">
                <div class="admin-card">
                    <a href="buchungen_verwalten.php" class="admin-link">
                        <h3>Buchungen verwalten</h3>
                        <p>Sehen und bearbeiten Sie alle aktuellen Buchungen.</p>
                    </a>
                </div>
                <div class="admin-card">
                    <a href="kunden_verwalten.php" class="admin-link">
                        <h3>Kunden verwalten</h3>
                        <p>Bearbeiten und verwalten Sie Kundendaten.</p>
                    </a>
                </div>
                <div class="admin-card">
                    <a href="zimmer_verwalten.php" class="admin-link">
                        <h3>Zimmer verwalten</h3>
                        <p>Verwalten Sie Zimmerkategorien und Verfügbarkeiten.</p>
                    </a>
                </div>
                <div class="admin-card">
                    <a href="bewertungen_verwalten.php" class="admin-link">
                        <h3>Bewertungen prüfen</h3>
                        <p>Lesen und verwalten Sie Gästebewertungen.</p>
                    </a>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>
</body>
</html>
