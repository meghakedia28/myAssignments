<!DOCTYPE html>
<html lang = "en">
<head>
	<meta charset = "utf-8">
	<meta name = "viewport" content = "width = device-width, initial-scale = 1">
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel = "stylesheet" type = "text/css" href = "../freeTemplateFile/css/resetPassword.css">
	<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
</head>
	<body>
		<cftry>
			<cfset userSet = createObject("component","demoApplication/components/getUserDetailsService").getUserDetails(url.id)>
				<div class = "container">
					<div class = "wrapper">
					<cftry>
						<cfif userSet.RecordCount EQ 1>
							<cfif ((userSet.active EQ 0) OR ((userSet.active EQ 1) AND (userSet.reset EQ url.reset))) >
								<h4 class = "message">
									<cfif (userSet.active EQ 0)>
										After setting the password you will be redirected to the login portal.
									<cfelseif (userSet.active EQ 1)>
										After resetting the password you will be redirected to the login portal.
									</cfif>
								</h4>
								<cfform action = "" method = "post" name = "resetForm" id = "resetForm" class = "form-signin">
								    <h3 class = "form-signin-heading">Welcome <cfoutput>#userSet.firstName# #userSet.lastName#</cfoutput> !</h3>
									  <hr class = "colorgraph"><br>
									  <cfinput type = "password" class = "form-control" id = "password" name = "password" placeholder = "Password" />
									 	 <div class = "error-msg" id = "error_password"></div>
									  <cfinput type = "password" class = "form-control" id = "confirmPassword" name = "confirmPassword" placeholder = "Re-type Password" />
									 	 <div class = "error-msg" id = "error_confirmpassword"></div>
									  <cfinput type = "hidden" id = "id" name = "id" value = "#url.id#">
									  	<div class = "error-msg" id = "error_insert"></div>
									  <button class = "btn btn-lg btn-primary btn-block"  name = "Submit" value = "Set" type = "Submit">Confirm</button>
								</cfform>
							<cfelse>
								<h2 class = "message"> You have requested a wrong Link.</h2>
							</cfif>
					 	<cfelse>
							<h2 class = "message">You have requested a wrong Link.</h2>
					 	</cfif>
					 <cfcatch type = "any">
						 <cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
						 <h2 class = "message">something went wrong please try again later.</h2>
					 </cfcatch>
					 </cftry>
					</div><!--wrapper-->
				</div><!--container-->
			<cfcatch type = "any">
 				<h2 class = "message">You have requested a wrong Link.</h2>
 			</cfcatch>
 			</cftry>
	</body>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src = "../../includes/js/resetPassword.js"></script>
</html>
