<!---check if logout or not--->
<cfif structKeyExists(URL,'logOut')>
	<cfset createObject("component",'demoApplication.components.authentication').doLogOut()/>
</cfif>
<!---form processing--->
<cfif structkeyExists(form,'submitLogin')>
	<cfset authentication = createobject("component",'demoApplication.components.authentication') />
	<cfset aErrorMessages =  authentication.userValidation(form.email,form.password)/>
	<cfif ArrayisEmpty(aErrorMessages)>
		<cfset isUserLoggedIn =  authentication.doLogin(form.email, form.password)/>
	</cfif>
</cfif>
<!DOCTYPE html>
<html lang="en" >
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<title>Login Form</title>
    <link rel="stylesheet" href="../css/logInStyle.css">
</head>
<body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Quiz Center<br />Login</h1>
			</div>
			<cfform class="login-form" name="loginForm" id="loginForm" preservedata="true" >
				<cfif structKeyExists(URL,'noaccess')>
					<p class="error" id="error">You need to login first.</p>
				</cfif>
				<!---check if any error message--->
					<cfif structKeyExists(variables, 'aErrorMessages') AND NOT ArrayIsEmpty(aErrorMessages) >
						<cfoutput>
							<cfloop array="#aErrorMessages#" index="message">
								<p class="error" id="error">#message#</p>
							</cfloop>
						</cfoutput>
					</cfif>
					<!---check if the user is logged in--->
					<cfif structKeyExists(variables,'isUserLoggedIn') AND isUserLoggedIn EQ false>
						<p class="error" id="error">The User Id and the Password did not match. Please try again or contact the administrator at : "megha.kedia28@gmail.com".</p>
					</cfif>
					<!---redirect to the page accordimg their roles--->
					<cfif structKeyExists(session,'stLoggedInUser')>
						<cfif session.stLoggedInUser.roleId EQ 1>
							<cflocation URL="../admin/home.cfm" />
						</cfif>
						<cfif session.stLoggedInUser.roleId EQ 2>
							<cflocation URL="../faculty/home.cfm" />
						</cfif>
						<cfif session.stLoggedInUser.roleId EQ 3>
							<cflocation URL="../student/home.cfm" />
						</cfif>
					<cfelse>
						<!---enter userId and password--->
						<div class="control-group">
							<label class="login-field-icon fui-user" for="email"></label>
							<cfinput type="text" class="login-field" id="email" name="email" placeholder="User Id">
						</div>
						<div class="control-group">
							<label class="login-field-icon fui-lock" for="password"></label>
							<input type="password" class="login-field" id="password" name="password" placeholder="Password" >
						</div>
						<div>
							<a href="forgetPassword.cfm">forgotten password?</a>
						</div>
						<button class="btn btn-primary btn-large btn-block" id="submitLogin" name="submitLogin" type= "submit">Login</button>
					</cfif>
				</cfform>
			</div>
		</div>
	</body>
</html>
