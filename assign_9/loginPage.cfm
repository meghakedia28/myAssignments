<cfdump var = '2'>
<cfif structKeyExists(URL,'logOut')>	
	<cfset createObject("component",'assign_9.components.authenticationService').doLogout()/>
</cfif>
<cfif structkeyExists(form,'submitLogin')>
	<cfdump var = '2' >
	<cfset authenticationService = createobject("component",'assign_9.components.authenticationService') />
		<cfdump var = '#authenticationService#'>
	<cfset aErrorMessages =  authenticationService.validateUser(form.email,form.password)/>
		<cfdump var = '#aErrorMessages#' >
	<cfif ArrayisEmpty(aErrorMessages)>
		<cfset isUserLoggedIn =  authenticationService.doLogin(form.email, form.password)/>
		<cfdump var = 'isUserLoggedIn  #isUserLoggedIn#' >
	</cfif> 
</cfif>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login Page</title>
		<link rel="stylesheet" href="css/registrationFormUsingJQuery.css">
	</head>
	<body>
		<div class="outter-div">
				
			<div class="inner-div div-form">
				<cfform name="LogInForm" id="LogInForm" preservedata="true" >
					<div><h1>LogIn:</h1></div>
					<cfif structKeyExists(URL,'noaccess')>
						<p class="error-msg" id="error">You need to login first.</p>
					</cfif>
					<cfif structKeyExists(variables, 'aErrorMessages') AND NOT ArrayIsEmpty(aErrorMessages) >
						<cfoutput>
							<cfloop array="#aErrorMessages#" index="message">
								<p class="error-msg" id="error">#message#</p>
							</cfloop> 
						</cfoutput>
					</cfif>
					<cfif structKeyExists(variables,'isUserLoggedIn') AND isUserLoggedIn EQ false>
						<p class="error-msg" id="error">User not found. Please register before login.</p>
					</cfif>
					<cfif structKeyExists(session,'stLoggedInUser')>
						<p>
							<cfdump var = 'inside stlogged in' >
							<cfdump var = # isUserLoggedIn()# >
							<cfdump var = #session#>
							<cflocation URL="https://localhost/assign_9/homePage.cfm" />
							
						</p>
					<cfelse>
					<!----Email---->
						<div><label class="in gein margin-10" for="email">E-mail:<label class="star">*</label></label>
                    		<cfinput class="box-style" type="text" id="email" name="email" placeholder="Enter your Email ID" required="true" validateAt="onSubmit"  >						
						</div>
					<!---password--->
						<div><label class="in gein margin-10" for="password">Password:<label class="star">*</label></label>
                  	  		<cfinput class="box-style" type="password" id="password" name="password" placeholder="Password" required="true" validateAt="onSubmit" >						
						</div>
							<button class="button" id="submitLogin" name="submitLogin" type= "submit">Login</button>
					</cfif>
				</cfform>
	</body>
</html>