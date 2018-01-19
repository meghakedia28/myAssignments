<!DOCTYPE html>
<html lang="en" >
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<title>Login Form</title>
    <link rel="stylesheet" href="../css/LogInStyle.css">
</head>
<body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Quiz Center<br />Login</h1>
			</div>
			<cfform class="login-form" name="loginForm" id="loginForm" preservedata="true" >
					<!---enter userId --->
					<div class="control-group">
						<label class="login-field-icon fui-user" for="email"></label>
						<h5>Enter the Email Id on which the resed link will be send:</h5>
						<cfinput type="text" class="login-field" id="email" name="email" placeholder="Email Id">
					</div>
					<button class="btn btn-primary btn-large btn-block" id="submitLogin" name="submitLogin" type= "submit">Send</button>
				</cfform>
			</div>
		</div>
	</body>
</html>
