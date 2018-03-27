<!DOCTYPE html>
<html lang = "en" >
<head>
	<meta name = "viewport" content = "width = device-width, initial-scale = 1">
	<title>Login Form</title>
    <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
	<link rel = "stylesheet" href = "../freeTemplateFile/css/logInStyle.css">
	<link rel = "stylesheet" href = "../includes/css/error.css">
</head>
<body>
	<div class = "login">
		<div class = "login-screen">
			<div class = "app-title">
				<h1>Quiz Center</h1>
			</div>
			<cfform class = "login-form" name = "forgetPasswordForm" id = "forgetPasswordForm" preservedata = "true" >
					<!---enter userId --->
					<div class = "control-group">
						<h3>Find your account:</h3>
						<label class = "login-field-icon fui-user" for = "email"></label>
						<h5>Enter the Email Id to search for the account and send the password reset link:</h5>
						<div class = "error" id = "error_email" name = "error_email" ></div>
						<cfinput type = "text" class = "login-field" id = "email" name = "email" placeholder = "Email Id">
					</div>
					<button class = "btn btn-primary btn-large btn-block" id = "submitLogin" name = "submitLogin" type =  "submit">Search</button>
				</cfform>
			</div>
		</div>
	</body>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src = "../../includes/js/forgetPassword.js"></script>
	<script type = "text/javascript" src = "../../includes/js/common.js"></script>
	<script src = "../../includes/js/wordEmailNumberValidation.js"></script>
</html>
