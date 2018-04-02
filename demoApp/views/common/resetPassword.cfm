<!----------------------------------------------------------------------------------------------------------
FileName    : resetPassword.cfm
Created By  : Megha Kedia
DateCreated : 13-March-2018
Description : contains the password reset form.

------------------------------------------------------------------------------------------------------------>

<!DOCTYPE html>
<html lang = "en">
<head>
	<meta charset = "utf-8">
	<meta name = "viewport" content = "width = device-width, initial-scale = 1">
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<cfoutput>
		<link rel = "stylesheet" type = "text/css" href = "#base#/freeTemplateFiles/css/resetPassword.css">
	</cfoutput>
	<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
</head>
	<body>
		<div class = "container">
			<div class = "wrapper">
				<cfif (structKeyExists(prc.data,"userExists") AND (prc.data.userExists))>
					<h4 class = "message">
						<cfif (structKeyExists(prc.data,"setting") AND (prc.data.setting))>
							After setting the password you will be redirected to the login portal.
						<cfelseif (structKeyExists(prc.data,"resetting") AND (prc.data.resetting))>
							After resetting the password you will be redirected to the login portal.
						</cfif>
					</h4>
					<cfform action = "" method = "post" name = "resetForm" id = "resetForm" class = "form-signin">
					    <h3 class = "form-signin-heading">Welcome
						    <cfoutput>#prc.data.firstName# #prc.data.lastName#</cfoutput> !</h3>
						  <hr class = "colorgraph"><br>
						  <div class="input-password">
						  	<cfinput type = "password" class = "form-control" id = "password"
						  		name = "password" placeholder = "Password" />
						 	 	<div class = "error-msg" id = "error_password"></div>
						  </div>
						  <div class="input-password">
							  <cfinput type = "password" class = "form-control" id = "confirmPassword"
							  	name = "confirmPassword" placeholder = "Re-type Password" />
							 	<div class = "error-msg" id = "error_confirmpassword"></div>
						  </div>
						  <cfinput type = "hidden" id = "id" name = "id" value = "#prc.data.id#">
						  	<div class = "error-msg" id = "error_insert"></div>
						  <button class = "btn btn-lg btn-primary btn-block"  name = "Submit"
						  	value = "Set" type = "Submit">Confirm</button>
					</cfform>
			 	<cfelse>
					<h2 class = "message">You have requested a wrong Link.</h2>
			 	</cfif>
			</div><!--wrapper-->
		</div><!--container-->
	</body>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<cfoutput>
		<script src = "#base#/includes/js/resetPassword.js"></script>
		<script src = "#base#/includes/js/common.js"></script>
	</cfoutput>
</html>
