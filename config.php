<?php
error_reporting(0);
$connection = mysql_connect('127.12.123.2:3306', 'adminS1S5VEn', 'Z6X7lnKccakM');
mysql_select_db('tweet_a_complaint');

if (!$connection) {
    die('Could not connect: ' . mysql_error());
}
?>