<?php
if (!isset($_POST)) {
    $response = array('status' => 'Failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$email=$_POST['email'];

$sqlloadresult="SELECT * FROM tbl_result WHERE user_email = '$email'";
$result = $conn->query($sqlloadresult);

if ($result->num_rows > 0) {
    $results["results"] = array();
    while ($row = $result -> fetch_assoc()) {
        $resultlist = array();
        $resultlist[user_id] = $row['user_id'];
        $resultlist[user_email] = $row['user_email'];
        $resultlist[question_correct] = $row['question_correct'];
        $resultlist[question_incorrect] = $row['question_incorrect'];
        $resultlist[question_notattempt] = $row['question_notattempt'];
        $resultlist[survey_score] = $row['survey_score'];
        $resultlist[survey_rating] = $row['survey_rating'];
        $resultlist[survey_desc] = $row['survey_desc'];
        $resultlist[survey_date] = $row['survey_date'];
        array_push($results["results"],$resultlist);
    }
    $response = array('status' => 'success', 'data' => $results);
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