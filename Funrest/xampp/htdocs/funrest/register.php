<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrierung - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Registrierung</h1>
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
        <section class="register-formular">
            <h2>Neues Konto erstellen</h2>
            <form action="register_verarbeiten.php" method="POST" class="form-container">
                <label for="name">Ihr Name:</label>
                <input type="text" id="name" name="name" required placeholder="Max Mustermann">
                
                <label for="email">E-Mail:</label>
                <input type="email" id="email" name="email" required placeholder="beispiel@email.com">
                
                <label for="password">Passwort:</label>
                <input type="password" id="password" name="password" required placeholder="••••••••">
                
                <label for="confirm-password">Passwort bestätigen:</label>
                <input type="password" id="confirm-password" name="confirm-password" required placeholder="••••••••">
                
                <button type="submit" class="button">Registrieren</button>
            </form>
            <p>Bereits ein Konto? <a href="login.php">Hier einloggen</a></p>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>
</body>
</html>