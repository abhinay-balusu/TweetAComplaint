<?php
session_start();
include "config.php";
$username=$_SESSION['username'];
if($_REQUEST['status'] && ($_REQUEST['status']=='getcomplaintsfromdb'))
{
	$selectQuery = "select * from complaint";
	$resultsSet=mysql_query($selectQuery);
	if($rows=mysql_num_rows($resultsSet))
	{
		while($row=mysql_fetch_assoc($resultsSet))
		{
			echo "<div class='complaint-box' id=".$row['Complaint_ID'].">";
			echo "<b>";
				echo $row['User_Name'];
			echo "</b>";
			echo "</br>";
			echo "<p>";
				echo $row['Description'];
			echo "</p>";
			echo "</div>";
		}
	}
}
if($_REQUEST['status'] && ($_REQUEST['status']=='getcomplaintsbyuserfromdb'))
{
	$selectQuery = "select * from complaint where User_Name='$username'";
	$resultsSet=mysql_query($selectQuery);
	if($rows=mysql_num_rows($resultsSet))
	{
		while($row=mysql_fetch_assoc($resultsSet))
		{
			echo "<div class='complaint-box' id=".$row['Complaint_ID'].'_'.$row['User_Name'].">";
			echo "<b>";
				echo $row['User_Name'];
			echo "</b>";
			echo "</br>";
			echo "<p>";
				echo $row['Description'];
			echo "</p>";
			echo "</div>";
		}
	}
}
if($_REQUEST['status'] && ($_REQUEST['status']=='getadmincomplaintsfromdb'))
{
	$selectQuery = "select * from complaint where Dept_ID=(select Dept_ID from department where Dept_Name=(select User_Type from user_profile where User_Name='$username'))";
	$resultsSet=mysql_query($selectQuery);
	if($rows=mysql_num_rows($resultsSet))
	{
		while($row=mysql_fetch_assoc($resultsSet))
		{
			echo "<div class='complaint-box' id=".$row['Complaint_ID'].">";
			echo "<b>";
				echo $row['User_Name'];
			echo "</b>";
			echo "</br>";
			echo "<p>";
				echo $row['Description'];
			echo "</p>";
			echo "<button>";
			echo "Resolve Complaint";
			echo "</button>";
			echo "</div>";
		}
	}
}
?>