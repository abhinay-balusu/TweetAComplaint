<?php
error_reporting(0);
$connection = mysql_connect('host', 'username', 'password');
mysql_select_db('tweet_a_complaint');

if (!$connection) {
    die('Could not connect: ' . mysql_error());
}
?>