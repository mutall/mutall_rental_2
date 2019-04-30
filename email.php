<?php
/**
 * This example shows settings to use when sending via Google's Gmail servers.
 * This uses traditional id & password authentication - look at the gmail_xoauth.phps
 * example to see how to use XOAUTH2.
 * The IMAP section shows how to save this message to the 'Sent Mail' folder using IMAP commands.
 */
//Include the phpmailer lfiles
require_once "../library/PHPMailer-master/src/PHPMailer.php";
require_once "../library/PHPMailer-master/src/Exception.php";
require_once "../library/PHPMailer-master/src/SMTP.php";

//
//Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
//
//Create a new PHPMailer instance
$mail = new PHPMailer;
//
//Tell PHPMailer to use SMTP
$mail->isSMTP();
//
//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug = 2;
//
//Set the hostname of the mail server
$mail->Host = 'smtp.gmail.com';
//
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6
// 
//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;
//
//Set the encryption system to use - ssl (deprecated) or tls
$mail->SMTPSecure = 'tls';
//
//Whether to use SMTP authentication
$mail->SMTPAuth = true;
//
//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = "peterkmuraya@gmail.com";
//
//Password to use for SMTP authentication
$mail->Password = "mutall_2015";
//
//Set who the message is to be sent from. The system picks the name but ovverides
//the username with the one specifoed avove; so, it dpes not matter what you
//type but it has to be a valid email address
$mail->setFrom('peterkmuraya@gmail.com', 'Peter Muraya');
//
//Set an alternative reply-to address
//$mail->addReplyTo('replyto@example.com', 'First Last');
//
//Set who the message is to be sent to. I should be able to see this email from
//my inbox under sent emails
$mail->addAddress('mutallcompany@gmail.com', 'Mutall');
//
//Set the subject line
$mail->Subject = 'PHPMailer GMail SMTP test';
//
//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
$mail->msgHTML(file_get_contents('contents.html'), __DIR__);
//
//Replace the plain text body with one created manually
//$mail->AltBody = 'This is a plain-text message body';
//
//Attach an image file
//$mail->addAttachment('images/phpmailer_mini.png');
//
//send the message, check for errors
if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
    echo "Message sent!";
}
