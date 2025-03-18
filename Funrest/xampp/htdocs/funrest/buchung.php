<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zimmer buchen - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Zimmer buchen</h1>
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
        <section class="buchung-formular">
            <h2>Buchen Sie Ihr Zimmer</h2>
            <form action="buchung_verarbeiten.php" method="POST" class="form-container">
                <label for="name">Ihr Name:</label>
                <input type="text" id="name" name="name" required placeholder="Max Mustermann">
                
                <label for="email">Ihre E-Mail:</label>
                <input type="email" id="email" name="email" required placeholder="beispiel@email.com">
                
                <label for="zimmerTyp">Zimmerkategorie:</label>
                <select id="zimmerTyp" name="zimmerTyp" class="select-style">
                    <option value="luxus">Luxus</option>
                    <option value="standard">Standard</option>
                    <option value="premium">Premium</option>
                </select>
                
                <label for="zimmerAnzahl">Zimmeranzahl:</label>
                <select id="zimmerAnzahl" name="zimmerAnzahl" class="select-style">
                    <option value="einzelzimmer">Einzelzimmer</option>
                    <option value="doppelzimmer">Doppelzimmer</option>
                </select>
                
                <label for="anreise">Anreisedatum:</label>
                <input type="date" id="anreise" name="anreise" required>
                
                <label for="abreise">Abreisedatum:</label>
                <input type="date" id="abreise" name="abreise" required>
                
                <button type="submit" class="button">Buchen</button>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>
</body>
</html>
