<?php
$servername = "localhost";
$username = "root";
$password = "admin";
$dbname = "funrest";

$conn = new mysqli($servername, $username, $password, $dbname, 3306);

if ($conn->connect_error) {
    die(json_encode(["error" => "Verbindung fehlgeschlagen"]));
}

// 🛠️ Zimmerkategorie & Typ aus Anfrage holen
$kategorie = $_GET['kategorie'] ?? '';
$typ = $_GET['typ'] ?? '';

$sql = "SELECT CheckIn, CheckOut FROM Buchung 
        JOIN Zimmer ON Buchung.ZimmerID = Zimmer.ZimmerID
        WHERE Zimmer.Kategorie = ? AND Zimmer.Typ = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $kategorie, $typ);
$stmt->execute();
$result = $stmt->get_result();

$belegteTage = [];

while ($row = $result->fetch_assoc()) {
    $start = new DateTime($row['CheckIn']);
    $end = new DateTime($row['CheckOut']);
    $interval = new DateInterval('P1D');
    $period = new DatePeriod($start, $interval, $end);

    foreach ($period as $date) {
        $belegteTage[] = $date->format('Y-m-d');
    }
}

// JSON ausgeben
header('Content-Type: application/json');
echo json_encode($belegteTage);
?>
