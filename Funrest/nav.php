<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<nav>
    <ul>
        <li><a href="home.php">Home</a></li>
        <li><a href="buchung.php">Zimmer buchen</a></li>
        <li><a href="bewertungen.php">Bewertungen</a></li>


        <?php if (isset($_SESSION['user_id'])): ?> 
            <li><a href="profile_logik.php">Mein Profil</a></li>
            <li><a href="logout.php">Logout</a></li>

            <?php if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1): ?>
                <li><a href="admin.php">Admin</a></li>
            <?php endif; ?>
            
        <?php else: ?>
            <li><a href="login.php">Login</a></li>
        <?php endif; ?>
    </ul>
</nav>
