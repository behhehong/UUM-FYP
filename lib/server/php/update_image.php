<?php

if (!isset($_POST)) {
    $response = array('status' => 'Failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$email = $_POST['email'];
$user_Id = $_POST['user_Id'];
$base64image = $_POST['image'];

$sqlupdateimage = "SELECT * FROM tbl_user WHERE email = '$email' AND user_Id='$user_Id'";

if ($conn->query($sqlupdateimage)-> num_rows > 0) {
    $response = array('status' => 'success', 'data' => null);
    $filename = $user_Id;
    $decoded_string = base64_decode($base64image);
    $path = '../assets/images/profilepic/' . $filename . '.jpg';
    $is_written = file_put_contents($path, $decoded_string);
    sendJsonResponse($response);

}else{
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}


function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>