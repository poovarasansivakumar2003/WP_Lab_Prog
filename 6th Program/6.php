<?php
$host = 'localhost';
$dbname = 'test';
$username = 'root';
$password = '';
$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
}
$name = $_POST['name'] ?? '';
$age = $_POST['age'] ?? '';
if (!empty($name) && !empty($age)) {
 $stmt = $conn->prepare("INSERT INTO info1 (name, age) VALUES (?, ?)");
 $stmt->bind_param("si", $name, $age);
 $stmt->execute();
 $stmt->close();
}
$result = $conn->query("SELECT name, age FROM info1");
echo "<!DOCTYPE html>
<html>
<head><title>Info Table</title></head>
<body>
<h2>Database Records</h2>
<table border='1'>
<tr><th>Name</th><th>Age</th></tr>";
while ($row = $result->fetch_assoc()) {
 echo "<tr><td>" . htmlspecialchars($row['name']) . "</td><td>" .
htmlspecialchars($row['age']) . "</td></tr>";
}
echo "</table>
</body>
</html>";
$conn->close();
?>