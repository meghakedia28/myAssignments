<!---check if logout or not--->
<cfif structKeyExists(URL,'logOut')>
	<cfset createObject("component",'assign_10.components.authentication').doLogOut()/>
</cfif>
<!---form processing--->
<cfif structkeyExists(form,'submitLogin')>
	<cfset authentication = createobject("component",'assign_10.components.authentication') />
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
    <link rel="stylesheet" href="../css/LogInStyle.css">
</head>
  <body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>

			<cfform class="login-form" name="loginForm" id="loginForm" preservedata="true" >
				<cfif structKeyExists(URL,'noaccess')>
						<p class="error" id="error">You need to login first.</p>
				</cfif>
					<cfif structKeyExists(variables, 'aErrorMessages') AND NOT ArrayIsEmpty(aErrorMessages) >
						<cfoutput>
							<cfloop array="#aErrorMessages#" index="message">
								<p class="error" id="error">#message#</p>
							</cfloop>
						</cfoutput>
					</cfif>
					<cfif structKeyExists(variables,'isUserLoggedIn') AND isUserLoggedIn EQ false>
						<p class="error" id="error">User not found. Please register before login.</p>
					</cfif>
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
				<div class="control-group">
				<cfinput type="text" class="login-field" id="email" name="email" placeholder="Enter your emailId">
				<label class="login-field-icon fui-user" for="email"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field" id="password" name="password" placeholder="Enter the password" >
				<label class="login-field-icon fui-lock" for="password"></label>
				</div>
				<button class="btn btn-primary btn-large btn-block" id="submitLogin" name="submitLogin" type= "submit">Login</button>
				</cfif>
			</cfform>
		</div>
	</div>
</body>
</html>
