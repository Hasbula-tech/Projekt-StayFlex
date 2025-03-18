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
        <h1>Bewertungen verwalten</h1>
        <nav>
            <ul>
                <li><a href="home.php">Home</a></li>
                <li><a href="buchung.php">Zimmer buchen</a></li>
                <li><a href="login.php">Login</a></li>
                <li><a href="admin.php">Admin</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section class="bewertungen-liste">
            <h2>Alle Bewertungen</h2>
            <table class="table-modern">
                <thead>
                    <tr>
                        <th>Bewertungs-ID</th>
                        <th>Kunde</th>
                        <th>Bewertung</th>
                        <th>Sterne</th>
                        <th>Status</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hier werden Bewertungsdaten mit PHP geladen -->
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>
</body>
</html>
