﻿<cfif thistag.executionMode EQ 'start'>
<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset = "UTF-8">
		<meta http-equiv = "X-UA-Compatible" content = "IE = edge">
		<meta name = "viewport" content = "width = device-width, initial-scale = 1.0,maximum-scale = 1">

		<title>St.Joseph's High School</title>
		<!-- Loading third party fonts -->
		<link href = "../fonts/font-awesome.min.css" rel = "stylesheet" type = "text/css">
		<!-- Loading main css file -->
		<link rel = "stylesheet" href = "../css/style.css">
		<!--[if lt IE 9]>
		<script src = "js/ie-support/html5.js"></script>
		<script src = "js/ie-support/respond.js"></script>
		<![endif]-->
		<noscript>
		   <META HTTP-EQUIV = "Refresh" CONTENT = "0;URL = /demoApplication/noScript.cfm">
		</noscript>
	</head>
	<body>
		<div id = "site-content">
			<header class = "site-header">
				<div class = "primary-header">
					<div class = "container">
						<a href = "home.cfm" id = "branding">
							<img src = "../images/logo.png" alt = "Lincoln high School">
							<h1 class = "site-title">St. Joseph's High School</h1>
						</a> <!-- #branding -->

						<div class = "main-navigation">
							<button type = "button" class = "menu-toggle"><i class = "fa fa-bars"></i></button>
							<ul class = "menu">
								<li class = "menu-item"><a href = "home.cfm">Home</a></li>
								<li class = "menu-item"><a href = "tests.cfm">Tests</a></li>
								<li class = "menu-item"><a href = "results.cfm">Results</a></li>
								<li class = "menu-item"><a href = "../common/loginPage.cfm?logout">LogOut</a></li>
							</ul> <!-- .menu -->
						</div> <!-- .main-navigation -->
						<div class = "mobile-navigation"></div>
					</div><!--container-->
					<div class = "container">
						<h6 class = "user">
						<br/>Hi, <cfoutput>#session.stLoggedInUser.userFirstName# #session.stLoggedInUser.userLastName# (student)<br />
								Email Id : #session.stLoggedInUser.userEmailId# </cfoutput></h6>
					</div>
				</div> <!-- .primary-header -->

	<!---end of header---->
	<cfelse>
	<!---start of footer--->
		<footer class = "site-footer">
			<div class = "container">
				<div class = "row">
					<div class = "col-md-3">
						<div class = "widget">
							<h3 class = "widget-title">Contact us</h3>
							<address>Lincoln High School <br>745 Jewel Ave Street <br>Fress Meadows, NY 1136</address>

							<a href = "mailto:info@lincolnhighschool.com">info@lincolnhighschool.com</a> <br>
							<a href = "tel:48942652394324">(489) 42652394324</a>
						</div>
					</div>
					<div class = "col-md-3">
						<div class = "widget">
							<h3 class = "widget-title">Social media</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<div class = "social-links circle">
								<a href = "#"><i class = "fa fa-facebook"></i></a>
								<a href = "#"><i class = "fa fa-google-plus"></i></a>
								<a href = "#"><i class = "fa fa-twitter"></i></a>
								<a href = "#"><i class = "fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>
					<div class = "col-md-3">
						<div class = "widget">
							<h3 class = "widget-title">Featured students</h3>
							<ul class = "student-list">
								<li><a href = "#">
										<img src = "../dummy/student-sm-1.jpg" alt = "" class = "avatar">
										<span class = "fn">Sarah Branson</span>
										<span class = "average">Average: 4,9</span>
									</a></li>
								<li><a href = "#">
										<img src = "../dummy/student-sm-2.jpg" alt = "" class = "avatar">
										<span class = "fn">Dorothy Smith</span>
										<span class = "average">Average: 4,9</span>
									</a></li>
							</ul>
						</div>
					</div><!--colmd3-->
					<div class = "col-md-3">
						<div class = "widget">
							<h3 class = "widget-title">Newsletter</h3>
							<p>Aspernatur, rerum. Impedit, deleniti suscipit</p>
							<form action = "#" class = "subscribe">
								<input type = "email" placeholder = "Email Address...">
								<input type = "submit" class = "light" value = "Subscribe">
							</form>
						</div>
					</div><!--colmd3-->
				</div>

				<div class = "copy">Copyright 2014 Lincoln High School. All rights reserved.</div>
			</div>
		</footer>
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
		<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</body>
</html>
</cfif>