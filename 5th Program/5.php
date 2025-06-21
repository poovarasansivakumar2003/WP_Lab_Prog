<?php
$host = 'localhost';
$dbname = 'test';
$username = 'root';
$password = '';
$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT name, age FROM info1";
$result = $conn->query($sql);
echo "<!DOCTYPE html>
<html>
<head><title>Database Records</title></head>
<body>
<h2>Contents of 'info' Table</h2>
<table border='1'>
<tr><th>Name</th><th>Age</th></tr>";
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) {
 echo "<tr><td>" . htmlspecialchars($row['name']) . "</td><td>" .
htmlspecialchars($row['age']) . "</td></tr>";
 }
} else {
 echo "<tr><td colspan='2'>No records found</td></tr>";
}
echo "</table></body></html>";
$conn->close();
?>