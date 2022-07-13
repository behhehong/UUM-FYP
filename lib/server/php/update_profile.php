<?php

if (!isset($_POST)) {
    $response = array('status' => 'Failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$email = $_POST['email'];
$user_Id = $_POST['user_Id'];
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$age = $_POST['age'];
$gender = $_POST['gender'];
$location = $_POST['location'];
$education = $_POST['education'];

$sql = "SELECT * FROM tbl_user WHERE email = '$email' AND user_Id='$user_Id'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $sqlupdateprofile="UPDATE tbl_user SET first_name = '$first_name', last_name = '$last_name', age = '$age', gender = '$gender', location = '$location', education = '$education' WHERE user_Id='$user_Id'";
    if ($conn->query($sqlupdateprofile) === TRUE) {
        $response = array('status' => 'success', 'data' => null);
        sendJsonResponse($response);

    }else{
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
    }
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>