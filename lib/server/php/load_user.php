<?php
if (!isset($_POST)) {
    $response = array('status' => 'Failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$email=$_POST['email'];

$sqlloaduser="SELECT * FROM tbl_user WHERE email = '$email'";
$result = $conn->query($sqlloaduser);

if ($result->num_rows > 0) {
    $users["users"] = array();
    while ($row = $result -> fetch_assoc()) {
        $userlist = array();
        $userlist[user_Id] = $row['user_Id'];
        $userlist[first_name] = $row['first_name'];
        $userlist[last_name] = $row['last_name'];
        $userlist[age] = $row['age'];
        $userlist[gender] = $row['gender'];
        $userlist[location] = $row['location'];
        $userlist[education] = $row['education'];
        array_push($users["users"],$userlist);
    }
    $response = array('status' => 'success', 'data' => $users);
    sendJsonResponse($response);
    
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);

}
function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>