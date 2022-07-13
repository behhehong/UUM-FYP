<?php
$servername = "localhost";
$username   = "hubbuddi_cyberformadmin";
$password   = "CoHEp}Y%ge0y";
$dbname     = "hubbuddi_cyberformdb";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>