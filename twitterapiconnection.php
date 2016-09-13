<?php
session_start();
require_once('TwitterAPIExchange.php');
include 'config.php';

$tweetdescription=$_REQUEST['complaintdescription'];
$complaintlocation=$_REQUEST['location'];
$department=$_REQUEST['department'];
$username=$_SESSION['username'];

$selectQuery="select Dept_ID from department where Dept_Name='$department'";
$resultsSet=mysql_query($selectQuery);
$row=mysql_fetch_assoc($resultsSet);
$deptid=$row['Dept_ID'];
$hashtag='#'.$department;

$insertQuery="INSERT INTO complaint (Description, Location,Resolution_Status,HashTag,Dept_ID,User_Name) VALUES('$tweetdescription','$complaintlocation', 'Open','$hashtag','$deptid','$username')";
mysql_query($insertQuery);

$settings = array(
	'oauth_access_token' => "Access Token",
    'oauth_access_token_secret' => "access_token_secret",
    'consumer_key' => "consumer_key",
    'consumer_secret' => "consumer_secret"
);
//$twitter = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET);
//url for getting list of followers
//$url = 'https://api.twitter.com/1.1/followers/list.json';
//$getfield = '?username=YOUR_USENAME&skip_status=1';
//url for getting all the tweets related to a particular hashtag
//$url = 'https://api.twitter.com/1.1/search/tweets.json';
//$getfield = '?q=%23usopen&result_type=recent';
//url to pass location details to twitter api
//$url = 'https://api.twitter.com/1.1/geo/reverse_geocode.json';
//$getfield = '?lat=37.76893497&long=-122.42284884';
//url to pass location details along with the tweet to twitter api
$url = 'https://api.twitter.com/1.1/statuses/update.json';
$requestMethod = 'POST';
$postfields = array(
    'status' => $tweetdescription ); 
$twitter = new TwitterAPIExchange($settings);
$twitter->setPostfields($postfields)
             ->buildOauth($url, $requestMethod)
             ->performRequest(); 
if($twitter)
{
	echo "Tweeted Successfully";
	header("Location:user.php");
}
?>