<!-------------------------------------------------------------------------------------------------------------
FileName    : commonLayout.cfm
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : layout of login page, admin pottal,
			  faculty portal and students portal.

-------------------------------------------------------------------------------------------------------------->

<cfset base = "https://172.16.9.18/demoApp">
<cfif NOT(structKeyExists(session,'stLoggedInUser'))>
	<cfoutput>#renderView()#</cfoutput>
<cfelse>
<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset = "UTF-8">
		<meta http-equiv = "X-UA-Compatible" content = "IE = edge">
		<meta name = "viewport" content = "width = device-width, initial-scale = 1.0,maximum-scale = 1">
		<title>St. Joseph's High School</title>
		<!-- Loading third party fonts -->
		<cfoutput>
		<link href = "#base#/freeTemplateFiles/fonts/font-awesome.min.css" rel = "stylesheet" type = "text/css">
		<!-- Loading main css file -->
		<link rel = "stylesheet" href = "#base#/freeTemplateFiles/css/style.css">
		<!--[if lt IE 9]>
		<script src = "js/ie-support/html5.js"></script>
		<script src = "js/ie-support/respond.js"></script>
		<![endif]-->
			<noscript>
			   <META HTTP-EQUIV = "Refresh" CONTENT = "0;URL = #base#/common/noScript.cfm">
			</noscript>
		</cfoutput>
	</head>
	<body>
		<div id = "site-content">
			<header class = "site-header">
				<div class = "primary-header">
					<div class = "container">
						<cfoutput>
							<a href = "#event.buildLink( 'common.home' )#" id = "branding">
								<img src = "#base#/freeTemplateFiles/images/logo.png" alt = "Lincoln high School">
								<h1 class = "site-title">St. Joseph's High School</h1>
							</a>
						</cfoutput>
						<cfif session.stLoggedInUser.roleId EQ 1>
							<div class = "main-navigation">
								<button type = "button" class = "menu-toggle"><i class = "fa fa-bars"></i></button>
								<ul class = "menu">
								<cfoutput>
									<li class = "menu-item"><a href = "#event.buildLink( 'common.home' )#">Home</a></li>
									<li class = "menu-item dropbtn"><a href = "##">Faculties</a>
										<ul class = "dropdown-content">
										   	 <li class = "dropdown"><a href = "#event.buildLink( 'admin.addFaculties' )#">
											   	 Add faculty</a> </li>
										     <li class = "dropdown"><a href = "#event.buildLink('admin.viewFaculties' )#">
											     Faculty list</a> </li>
										 </ul>
									</li>
									<li class = "menu-item dropbtn"><a href = "##">Students</a>
										<ul class = "dropdown-content">
										   	 <li class = "dropdown"><a href = "#event.buildLink( 'admin.addStudents' )#">
											   	 Add Students</a> </li>
										     <li class = "dropdown"><a href = "#event.buildLink( 'admin.viewStudents' )#">
											     Student list</a> </li>
										 </ul>
									</li>
									<li class = "menu-item"><a href = "#event.buildLink( 'common.loginPage?logout' )#">
										LogOut</a></li>
								</cfoutput>
								</ul> <!-- .menu -->
							</div> <!-- .main-navigation -->
						<cfelseif session.stLoggedInUser.roleId EQ 2>
							<div class = "main-navigation">
								<button type = "button" class = "menu-toggle"><i class = "fa fa-bars"></i></button>
								<ul class = "menu">
								<cfoutput>
									<li class = "menu-item"><a href = "#event.buildLink( 'common.home' )#">Home</a></li>
									<li class = "menu-item dropbtn"><a href = "##">Questions</a>
										<ul class = "dropdown-content">
											<li class = "dropdown"><a href = "#event.buildLink( 'faculty.addQuestions')#">
												Add Questions</a> </li>
										   	<li class = "dropdown"><a href = "#event.buildLink( 'faculty.questionBank')#">
											   	View Questions</a> </li>
										 </ul>
									</li>
									<li class = "menu-item"><a href = "#event.buildLink( 'faculty.setQuiz' )#">
										Set a quiz</a></li>
									<li class = "menu-item"><a href = "#event.buildLink( 'faculty.viewQuiz' )#">
										View quiz</a></li>
									<li class = "menu-item"><a href = "#event.buildLink( 'faculty.results' )#">
										Results</a></li>
									<li class = "menu-item"><a href = "#event.buildLink( 'faculty.studentsProfile' )#">
										Student's Profile</a></li>
									<li class = "menu-item"><a href = "#event.buildLink( 'common.loginPage?logout' )#">
										LogOut</a></li>
								</cfoutput>
								</ul> <!-- .menu -->
							</div> <!-- .main-navigation -->
						<cfelseif session.stLoggedInUser.roleId EQ 3>
							<div class = "main-navigation">
								<button type = "button" class = "menu-toggle"><i class = "fa fa-bars"></i></button>
								<ul class = "menu">
									<cfoutput>
										<li class = "menu-item"><a href = "#event.buildLink( 'common.home' )#">
											Home</a></li>
										<li class = "menu-item"><a href = "#event.buildLink( 'student.tests' )#">
											Tests</a></li>
										<li class = "menu-item"><a href = "#event.buildLink( 'student.results' )#">
											Results</a></li>
										<li class = "menu-item"><a href = "#event.buildLink( 'common.loginPage?logout')#">
											LogOut</a></li>
									</cfoutput>
								</ul> <!-- .menu -->
							</div> <!-- .main-navigation -->
						</cfif>
						<div class = "mobile-navigation"></div>
					</div><!--container-->
					<div class = "container">
						<h6 class = "user">
						<br/>Hi, <cfoutput>#session.stLoggedInUser.userFirstName#
										   #session.stLoggedInUser.userLastName#
										   (#session.stLoggedInUser.userRole#)
										   <br />
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
									<cfoutput>
										<img src = "#base#/freeTemplateFiles/images/student-sm-1.jpg" alt = ""
											class = "avatar">
									</cfoutput>
									<span class = "fn">Sarah Branson</span>
									<span class = "average">Average: 4,9</span>
								</a></li>
								<li><a href = "#">
									<cfoutput>
										<img src = "#base#/freeTemplateFiles/images/student-sm-1.jpg" alt = ""
											class = "avatar">
									</cfoutput>
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
-		</footer>
	</body>
</html>
</cfif>