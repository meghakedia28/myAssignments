
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<link rel = "stylesheet" type="text/css" href="../css/resetPassword.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<script src="../js/resetPassword.js"></script>
</head>
<body>
	<cfquery name="userSet">
	SELECT [active] FROM [user]
	WHERE [salt] = <cfqueryparam value="#URL.id#" cfsqltype="cf_sql_varchar" >
	</cfquery>
		<div class = "container">
			<div class="wrapper">
				<cfif userSet.RecordCount EQ 1>
					<cfif userSet.active NEQ 0>
						<h2> It seems that you have already set the password.<br>
						You can login from <a href="../comman/loginPage.cfm">HERE</a>.</h2>
					<cfelse>
						<cfform action="resetPasswordValidation.cfm?id=#URL.id#" method="post" name="resetForm" id="resetForm" class="form-signin">
						    <h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
							  <hr class="colorgraph"><br>
							  <cfinput type="password" class="form-control" id="password" name="password" placeholder="Password" required="true" autofocus="" />
							 	 <div class="error-msg" id="error_password"></div>
							  <cfinput type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Re-type Password" required="true"/>
							 	 <div class="error-msg" id="error_confirmPassword"></div>
							  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Set" type="Submit">Login</button>
						</cfform>
					</cfif>
				<cfelse>
					<h2>You have requested a wrong Link. Please try again.</h2>
				</cfif>
			</div>
		</div>
	</body>
</html>
