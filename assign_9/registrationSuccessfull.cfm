<!DOCTYPE html>
<html >
	<head>
		<meta charset="UTF-8">
		<title>Registration success</title>
		<link rel="stylesheet" href="css/registrationSuccessfull.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
	</head>
	<body>
		
		<cfif isDefined('url.registered')>
			<p>You have already registered. Try to register with a different Email id or click on <a href="loginPage.cfm">login</a> to continue.</p>
		<cfelse>
			<script>swal("Good job!", "You have succesfully registered", "success");</script>
			<p> Great Job! You are a part of our family now.</p>
			  <a href= "loginPage.cfm"><p>Click here to Login</p></a>
		</cfif>	  
	</body>
</html>