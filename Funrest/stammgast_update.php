<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $userID = intval($_POST['userid']);
    $stammgast = isset($_POST['stammgast']) ? 1 : 0;

    $stmt = $conn->prepare("UPDATE gast SET StammUser = ? WHERE UserID = ?");
    $stmt->bind_param("ii", $stammgast, $userID);
    $stmt->execute();
    $stmt->close();
}

header("Location: kunden_verwalten.php"); // oder wie deine Adminseite heißt
exit;
