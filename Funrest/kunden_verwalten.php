<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kunden verwalten - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Kunden verwalten</h1>
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
        <section class="kunden-liste">
            <h2>Alle Kunden</h2>
            <table>
                <thead>
                    <tr>
                        <th>Kunden-ID</th>
                        <th>Name</th>
                        <th>E-Mail</th>
                        <th>Stammgast</th>
                        <th>Aktionen</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hier werden Kundendaten mit PHP geladen -->
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel</p>
    </footer>
</body>
</html>
