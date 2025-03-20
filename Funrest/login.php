
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FUNREST Hotel</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<header>
        <h1>Willkommen im FUNREST Hotel</h1>
        <?php include 'nav.php'; ?>
    </header>
    
    <main>
        <section class="login-formular">
            <h2>Willkommen zurück!</h2>
            <form action="login_logik.php" method="POST" class="form-container">
                <label for="email">E-Mail:</label>
                <input type="email" id="email" name="email" required placeholder="beispiel@email.com">
                
                <label for="password">Passwort:</label>
                <input type="password" id="password" name="password" required placeholder="••••••••">
                
                <button type="submit" class="button">Einloggen</button>
            </form>
            <p>Noch kein Konto? <a href="register.php">Jetzt registrieren</a></p>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 FUNREST Hotel | Alle Rechte vorbehalten</p>
    </footer>
</body>
</html>