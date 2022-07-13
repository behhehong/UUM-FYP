<?php

if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$userid = $_POST['userid'];
$email = $_POST['email'];
$correct = $_POST['correct'];
$incorrect = $_POST['incorrect'];
$notattempt = $_POST['notattempt'];
$score = $_POST['score'];
$rating = $_POST['rating'];
$comment = $_POST['comment'];

$sqlinsert = "INSERT INTO `tbl_result`(`user_id`, `user_email`, `question_correct`, `question_incorrect`, `question_notattempt`, `survey_score`, `survey_rating`, `survey_desc`) VALUES ('$userid','$email','$correct','$incorrect','$notattempt','$score','$rating','$comment')";
        
if($conn->query($sqlinsert) === TRUE){
    $response = array('status' => 'success', 'data' => null);
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