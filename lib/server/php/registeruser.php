<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '/home8/hubbuddi/public_html/271513/cyberform/php/PHPMailer/Exception.php';
require '/home8/hubbuddi/public_html/271513/cyberform/php/PHPMailer/PHPMailer.php';
require '/home8/hubbuddi/public_html/271513/cyberform/php/PHPMailer/SMTP.php';

if (!isset($_POST)) {
    $response = array('status' => 'Failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$first_name = $_POST['firstName'];
$last_name = $_POST['lastName'];
$age = NULL;
$gender = NULL;
$location = NULL;
$education = NULL;
$email = $_POST['email'];
$password = $_POST['password'];
$passsha1 = sha1($password);
$otp = rand(100000,999999);

$sqlregister = "INSERT INTO tbl_user(first_name,last_name,age,gender,location,education,email,password,otp) VALUES ('$first_name','$last_name','$age','$gender','$location','$education','$email','$passsha1','$otp')";

if ($conn->query($sqlregister) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    sendEmail($last_name,$email,$otp);
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

function sendEmail($last_name,$email,$otp){
    $mail = new PHPMailer(true);
    $mail->SMTPDebug = 0; //Disable verbose debug output
    $mail->isSMTP(); //Send using SMTP
    $mail->Host= 'mail.hubbuddies.com'; //Set the SMTP server to send through
    $mail->SMTPAuth= true; //Enable SMTP authentication
    $mail->Username= 'cyberform@hubbuddies.com'; //SMTP username
    $mail->Password= 'D,yatVz;^y2='; //SMTP password
    $mail->SMTPSecure= 'tls';         
    $mail->Port= 587;
    
    $from = "cyberform@hubbuddies.com";
    $to = $email;
    $subject = "Account Verification";
    $message = "Hi $last_name,<br><br>
    
	            Welcome to Cyberform! Your account has been successfully created!<br><br>
	            
                Your username is the email you registered with: $email. 
                Please <a href='https://hubbuddies.com/271513/cyberform/php/verifyaccount.php?email=".$email."&key=".$otp."'>
                Click Here</a> to verify your account.<br><br><br><br><br><br><br><br><br><br><br><br>
                
                
                
                
                
                You have been sent this email because an account was created on Cyberform with the email address <u>$email</u><br>
                If you have received it in error, please ignore this email.";
    
    $mail->setFrom($from,"Cyberform");
    $mail->addAddress($to);//Add a recipient
    
    //Content
    $mail->isHTML(true);//Set email format to HTML
    $mail->Subject = $subject;
    $mail->Body    = $message;
    $mail->send();
}
?>