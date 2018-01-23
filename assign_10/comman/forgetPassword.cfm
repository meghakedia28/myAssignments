<!DOCTYPE html>
<html lang="en" >
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="../js/jquery-1.11.1.min.js"></script>
	<title>Login Form</title>
    <link rel="stylesheet" href="../css/LogInStyle.css">
	<link rel="stylesheet" href="../css/error.css">
	<script src="../js/forgetPassword.js"></script>
</head>
<body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Quiz Center</h1>
			</div>
			<cfform class="login-form" name="forgetPassword_form" id="forgetPassword_form" preservedata="true" >
					<!---enter userId --->
					<div class="control-group">
						<h3>Find your account:</h3>
						<label class="login-field-icon fui-user" for="email"></label>
						<h5>Enter the Email Id on which the password reset link will be send:</h5>
						<div class="error" id="error_email" name = "error_email" ></div>
						<cfinput type="text" class="login-field" id="email" name="email" placeholder="Email Id">
					</div>
					<button class="btn btn-primary btn-large btn-block" id="submitLogin" name="submitLogin" type= "submit">Search</button>
				</cfform>
			</div>
		</div>
	</body>
</html>
