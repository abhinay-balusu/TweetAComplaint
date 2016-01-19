<?php
session_start();
include "config.php";
?>
<!DOCTYPE html>
<html>
<head>
	<link href="assets/css/bootstrap.css" rel="stylesheet" />
	<link href="assets/css/custom.css" rel="stylesheet" />
	<script src="assets/scripts/jquery-2.1.4.js"></script>
	<script src="assets/scripts/bootstrap.min.js"></script>
	<style>
		.complaint-box
		{
			padding: 50px 10px 10px 10px;
			#border: 1px solid red;
			background-color:#F8F8F8;
		}
	</style>
	<script>
		window.onload = function() {
		  getcomplaints();
		};
		function getcomplaints()
		{
			var complaintbox=document.getElementById("allcomplaints");
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				complaintbox.innerHTML=xhttp.responseText;
			}
			}
			xhttp.open("GET", "complaints.php?status=getadmincomplaintsfromdb", true);
			xhttp.send();
		}
	</script>
</head>
<body>
	<div style="padding: 15px 50px 5px 50px;float: right;font-size: 16px;">Hello Admin - <?php echo $_SESSION['username'];?> &nbsp <a href="logout.php" class="btn btn-danger square-btn-adjust">Logout</a> </div>
	</br>
	</br>
	</br>
	<div class="container">
		<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#allcomplaints">All Complaints</a></li>
		<li><a data-toggle="tab" href="#resolved">Resolved Complaints</a></li>
		<li><a data-toggle="tab" href="#pending">Pending Complaints</a></li>
		</ul>

		<div class="tab-content">
		</br>
		<div id="allcomplaints" class="tab-pane fade in active">
		  
		</div>
		<div id="resolved" class="tab-pane fade">
			<div class="complaint-box">
				<b>NAME</b>
				<p>Complaint Description</p>
			</div>
		</div>
		<div id="pending" class="tab-pane fade">
			<div class="complaint-box">
				<b>NAME</b>
				<p>Complaint Description</p>
			</div>
		</div>
	</div>
</div>
	</body>
</html>