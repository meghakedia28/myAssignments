<cfif thistag.executionMode EQ 'start'>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

		<title>St. Joseph's High School</title>
		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Arvo:400,700|" rel="stylesheet" type="text/css">
		<link href="../fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<!-- Loading main css file -->
		<link rel="stylesheet" href="../css/style.css">

		<script src="../js/jquery-1.11.1.min.js"></script>
		<script src="../js/plugins.js"></script>
		<script src="../js/app.js"></script>
	</head>
	<body>
		<div id="site-content">
			<header class="site-header">
				<div class="container">
				<a href="home.cfm" id="branding">
					<img src="../images/logo.png" alt="Lincoln high School">
					<h1 class="site-title">St. Joseph's High School</h1>
				</a> <!-- #branding -->
				</div>
	<!---end of header---->
<cfelse>
	<!---start of footer--->
		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="widget">
							<h3 class="widget-title">Contact us</h3>
							<address>Lincoln High School <br>745 Jewel Ave Street <br>Fress Meadows, NY 1136</address>

							<a href="mailto:info@lincolnhighschool.com">info@lincolnhighschool.com</a> <br>
							<a href="tel:48942652394324">(489) 42652394324</a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="widget">
							<h3 class="widget-title">Social media</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<div class="social-links circle">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-google-plus"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="widget">
							<h3 class="widget-title">Featured students</h3>
							<ul class="student-list">
								<li><a href="#">
										<img src="../dummy/student-sm-1.jpg" alt="" class="avatar">
										<span class="fn">Sarah Branson</span>
										<span class="average">Average: 4,9</span>
									</a></li>
								<li><a href="#">
										<img src="../dummy/student-sm-2.jpg" alt="" class="avatar">
										<span class="fn">Dorothy Smith</span>
										<span class="average">Average: 4,9</span>
									</a></li>
							</ul>
						</div>
					</div><!--colmd3-->
					<div class="col-md-3">
						<div class="widget">
							<h3 class="widget-title">Newsletter</h3>
							<p>Aspernatur, rerum. Impedit, deleniti suscipit</p>
							<form action="#" class="subscribe">
								<input type="email" placeholder="Email Address...">
								<input type="submit" class="light" value="Subscribe">
							</form>
						</div>
					</div><!--colmd3-->
				</div>

				<div class="copy">Copyright 2014 Lincoln High School. All rights reserved.</div>
			</div>
		</footer>
	</body>
</html>
</cfif>