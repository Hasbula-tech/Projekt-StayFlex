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
    <h1>Willkommen im FUNREST Hotel</h1>
    <?php include 'nav.php'; ?>
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
                <?php
                include 'db.php';

                $sql = "SELECT gast.UserID, gast.Name, users.email, gast.StammUser
                        FROM gast
                        INNER JOIN users ON gast.LoginID = users.id";

                $result = $conn->query($sql);

                while ($row = $result->fetch_assoc()):
                ?>
                <tr>
                    <td><?= $row['UserID'] ?></td>
                    <td><?= htmlspecialchars($row['Name']) ?></td>
                    <td><?= htmlspecialchars($row['email']) ?></td>
                    <td style="text-align: center;">
                        <form action="stammgast_update.php" method="POST">
                            <input type="hidden" name="userid" value="<?= $row['UserID'] ?>">
                            <input type="checkbox" name="stammgast" value="1" <?= $row['StammUser'] ? 'checked' : '' ?> onchange="this.form.submit();">
                        </form>
                    </td>
                    <td>🔧</td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </section>
</main>

<footer>
    <p>&copy; 2025 FUNREST Hotel</p>
</footer>
</body>
</html>
