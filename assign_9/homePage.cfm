<cfif NOT isUserLoggedIn()>
	<cflocation url = "https://localhost/assign_9/loginPage.cfm?noaccess">
</cfif>

<!DOCTYPE html>
	<html>
		<head>
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			
				<link rel="stylesheet" href="css/homePage.css">
		</head>
		<body>
			<ul class="topnav">
				<li><a class="active" href="#home">Home</a></li>
				<li><a href="#news">News</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="right"><a href="https://localhost/assign_9/loginPage.cfm?logOut">LogOut</a></li>
			</ul>
			<p>
				<cfif structKeyExists(session,'stLoggedInUser')>
					<cfoutput>
						welcome #session.stLoggedInUser.userFirstName# #session.stLoggedInUser.userLastName# 
					</cfoutput> </p>	
				<cfelse>
					<cflocation url = "https://localhost/assign_9/loginPage.cfm?noaccess">
				</cfif>
		</body>
	</html>