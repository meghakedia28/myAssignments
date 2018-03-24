<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset = "UTF-8">
		<meta http-equiv = "X-UA-Compatible" content = "IE = edge">
		<meta name = "viewport" content = "width = device-width, initial-scale = 1.0,maximum-scale = 1">

		<title>St. Joseph's High School</title>
		<!-- Loading third party fonts -->
		<link href = "../../freeTemplateFiles/fonts/font-awesome.min.css" rel = "stylesheet" type = "text/css">
		<!-- Loading main css file -->
		<link rel = "stylesheet" href = "../../freeTemplateFile/css/style.css">
		<!--[if lt IE 9]>
		<script src = "js/ie-support/html5.js"></script>
		<script src = "js/ie-support/respond.js"></script>
		<![endif]-->
		<noscript>
		   <META HTTP-EQUIV = "Refresh" CONTENT = "0;URL = /demoApp/noScript.cfm">
		</noscript>
	</head>
	<body>
		<div id = "site-content">
			<header class = "site-header">
				<div class = "primary-header">
					<div class = "container">
						<a href = "home.cfm" id = "branding">
							<img src = "../../freeTemplateFiles/images/logo.png" alt = "Lincoln high School">
							<h1 class = "site-title">St. Joseph's High School</h1>
						</a> <!-- #branding -->
						<div class = "main-navigation">
							<button type = "button" class = "menu-toggle"><i class = "fa fa-bars"></i></button>
							<ul class = "menu">
							<cfoutput>
								<li class = "menu-item"><a href = "#event.buildLink( 'faculty.home' )#">Home</a></li>
								<li class = "menu-item dropbtn"><a href = "##">Questions</a>
									<ul class = "dropdown-content">
										<li class = "dropdown"><a href = "#event.buildLink( 'faculty.addQuestions' )#">Add Questions</a> </li>
									   	<li class = "dropdown"><a href = "#event.buildLink( 'faculty.questionBank' )#">View Questions</a> </li>
									 </ul>
								</li>
								<li class = "menu-item"><a href = "#event.buildLink( 'faculty.setQuiz' )#">Set a quiz</a></li>
								<li class = "menu-item"><a href = "#event.buildLink( 'faculty.viewQuiz' )#">View quiz</a></li>
								<li class = "menu-item"><a href = "#event.buildLink( 'faculty.results' )#">Results</a></li>
								<li class = "menu-item"><a href = "#event.buildLink( 'faculty.studentsProfile' )#">Student's Profile</a></li>
								<li class = "menu-item"><a href = "#event.buildLink( 'common.loginPage?logout' )#">LogOut</a></li>
							</cfoutput>
							</ul> <!-- .menu -->
						</div> <!-- .main-navigation -->
						<div class = "mobile-navigation"></div>
					</div><!--container-->
					<div class = "container">
						<h6 class = "user">
							<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
							<cfif NOT(sessionExists)>
								<cfscript>
									setNextEvent(event = "common.loginPage?noaccess");
								</cfscript>
							<cfelseif session.stLoggedInUser.roleId NEQ 2>
								<cfscript>
									setNextEvent(event = "common.loginPage?noaccess");
								</cfscript>
							</cfif>
						<br/>Hi, <cfoutput>#session.stLoggedInUser.userFirstName# #session.stLoggedInUser.userLastName# (faculty)<br />
								Email Id : #session.stLoggedInUser.userEmailId# </cfoutput></h6>
					</div>
				</div> <!-- .primary-header -->
	<!---end of header---->
	<cfoutput>#renderView()#</cfoutput>
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
										<img src = "../../freeTemplateFiles/images/student-sm-1.jpg" alt = "" class = "avatar">
										<span class = "fn">Sarah Branson</span>
										<span class = "average">Average: 4,9</span>
									</a></li>
								<li><a href = "#">
										<img src = "../../freeTemplateFiles/images/student-sm-2.jpg" alt = "" class = "avatar">
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
	</body>
</html>
