<?php session_start(); ?>
<nav>
    <ul>
        <li><a href="home.html">Home</a></li>
        <li><a href="buchung.html">Zimmer buchen</a></li>
        <li><a href="bewertungen.html">Bewertungen</a></li>

        <?php if (isset($_SESSION['user_id'])): ?> 
            <li><a href="logout.php">Logout</a></li>

            <?php if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1): ?>
                <li><a href="admin.html">Admin</a></li>
            <?php endif; ?>
            
        <?php else: ?>
            <li><a href="login.html">Login</a></li>
        <?php endif; ?>
    </ul>
</nav>
