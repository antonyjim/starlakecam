<!DOCTYPE HTML>
<!-- THIS IS THE SAMPLE PAGE, UPDATED BY ANTHONY J -->
<html lang="en">
	<head>
		
		<meta charset="utf-8" />
		<link rel="shortcut icon" href="http://slpa.info/favicon.ico" type="image/x-icon">
		<title>SAMPLE</title>
		<!-- CSS LINKS -->
			<link rel="stylesheet" type="text/css" href="style.css">
		<!-- END CSS LINKS -->
		
</head>

<body>
	
	<!--TOP MENU -->
	<div id="heading">
		
		<img src="index_files/StarLakeStar.png" alt="Logo" width="10%" height="10%"/>
		
		<a href="index.html"> 
				<img src="index_files/logo.png">
		</a>

	</div>
	
	<!-- NAV MENU -->
	<div class="menu">
		<ul>
					<li>
						<a class="button" href="index.html">Home</a>
					</li>
					<li>
						<a class="button" href="aboutSLPA.html">About the SLPA</a>
					</li>
					<li>
						<a class="button" href="about_website.html">About this Site</a>
					</li>
					<li>
						<a class="button" href="recent_meetings.html">Recent Meetings</a>
					</li>
					<li>
						<a class="button" href="SLHandbook.html">Star Lake Handbook</a>
					</li>
					<li>
						<a class="button" href="photo.html">Photo Gallery</a>
					</li>
					<li>
						<a class="button" href="Rules_of_lake.html">Rules of the Lake</a>
					</li>
					<li>
						<a class="button" href="favorite.html">Links</a>
					</li>
					<li>
						<a class="button" href="feedback.html">Feedback</a>
					</li>
		</ul>			
	</div>
	
	<div class="para">

<h1>Thank you for submitting your feedback!</h1>
<p>Please click one of the links on the left hand side of the page to return to the website.</p>

<?php $name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];
$formcontent="From: $name \n Message: $message";
$recipient = "7753407762@vtext.com";
$subject = "Contact Form";
$mailheader = "From: $email \r\n";
mail($recipient, $subject, $formcontent, $mailheader) or die("Error!");
?>

	</div>
	
	<!--FOOTER -->
	<div class="clr"></div>
	<div id="footer">
		<ul>
			<li>
				<a href="index.html">Home</a>
			</li>
			<li>
				About the SLPA
			</li>	
			<li>
				<a href="about_website.html">About this Site</a>
			</li>	
			<li>
				<a href="recent_meetings.html">Recent Meetings</a>
			</li>	
			<li>
				<a href="SLHandbook.html">Star Lake Handbook</a>	
			</li>	
			<li>
				<a href="photo.html">Photo Gallery</a>
			</li>	
			<li>
				<a href="Rules_of_lake.html">Rules of the Lake</a>
			</li>	
			<li>
				<a href="favorite.html">Links</a>
			</li>	
			<li>
				<a href="feeback.html">Feedback</a>				
			</li>
		</ul>	
		
		<p align="center"><i><small>Site last updated
		<!--webbot bot="Timestamp" s-type="EDITED" s-format="%m/%d/%y" startspan -->11/18/17<!--webbot bot="Timestamp" i-checksum="13303" endspan -->&nbsp;&nbsp; 
		Copyright 2007 by the Star Lake Protective Association. All rights 
		reserved by respective owners.</small></i></p>
	<p><i><b>All photos </b>on this page and elsewhere on this site, unless otherwise noted, were taken by and belong to Bo 
	Ritchings, who maintains all proprietary rights to said photos.&nbsp; They
	<b>may not</b>be used legally by anyone for any purpose, unless express permission is granted by the owner.</i>
	</div>
		
	
</body>
	
</html>
