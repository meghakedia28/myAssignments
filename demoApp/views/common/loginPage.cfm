<!---check if logout or not--->
<!---form processing--->
<!DOCTYPE html>
<html lang = "en" >
<head>
	<meta name = "viewport" content = "width = device-width, initial-scale = 1">
  	<title>Login Form</title>
	<cfoutput>
	<link rel = "stylesheet" href = "#base#/freeTemplateFile/css/logInStyle.css">
	</cfoutput>
</head>
	<body>
		<div class = "login">
			<div class = "login-screen">
				<div class = "app-title">
					<h1>Quiz Center<br />Login</h1>
				</div>
				<cfform class = "login-form" name = "loginForm" id = "loginForm" preservedata = "true" >
					<cfif structKeyExists(url,"noaccess")>
						<p class = "error" id = "error">You need to login first.</p>
					</cfif>
					<!---check if any error message--->
					<cfif structKeyExists(prc, "aErrorMessages") AND NOT ArrayIsEmpty(prc.aErrorMessages) >
						<cfoutput>
							<cfloop array = "#prc.aErrorMessages#" index = "message">
								<p class = "error" id = "error">#message#</p>
							</cfloop>
						</cfoutput>
					</cfif>
						<!---check if the user is logged in--->
					<cfif structKeyExists(prc,"isUserLoggedIn") AND prc.isUserLoggedIn EQ false>
						<p class = "error" id = "error">The User Id and the Password did not match.
							 Please try again or contact the administrator at : "megha.kedia28@gmail.com".</p>
					</cfif>
					<!---redirect to the page according to their roles--->
					<cfif structKeyExists(session,"stLoggedInUser")>
						<cfif session.stLoggedInUser.roleId EQ 1>
							<cfscript>
								setNextEvent(event = "admin.home");
							</cfscript>
						</cfif>
						<cfif session.stLoggedInUser.roleId EQ 2>
							<cfscript>
								setNextEvent(event = "faculty.home");
							</cfscript>
						</cfif>
						<cfif session.stLoggedInUser.roleId EQ 3>
							<cfscript>
								setNextEvent(event = "student.home");
							</cfscript>
						</cfif>
					<cfelse>
						<!---enter userId and password--->
						<div class = "control-group">
							<label class = "login-field-icon fui-user" for = "email"></label>
							<cfinput type = "text" class = "login-field" id = "email" name = "email" placeholder = "User Id">
						</div>
						<div class = "control-group">
							<label class = "login-field-icon fui-lock" for = "password"></label>
							<input type = "password" class = "login-field" id = "password" name = "password" placeholder = "Password" >
						</div>
						<div>
							<cfoutput>
								<a href = "#event.buildLink( 'common.forgetPassword' )#">forgotten password?</a>
							</cfoutput>
						</div>
						<button class = "btn btn-primary btn-large btn-block" id = "submitLogin" name = "submitLogin" type = "submit">Login</button>
					</cfif>
				</cfform>
			</div>
		</div>
	</body>
</html>
