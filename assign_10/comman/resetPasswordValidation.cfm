<!DOCTYPE html>
<html >
	<head>
		<meta charset="UTF-8">
		<title>Registration success</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	</head>
	<body>
		<cfif structKeyExists(form,'submit')>
			<cfset password = validPassword()>
			<cfset confirmPassword = checkPassword()>
			<cfif confirmPassword AND password>
				<cfset insert = insertPassword()>
					<cfif insert>
						<script>swal("Good job!", "You have succesfully registered", "success");</script>
						<h2>NOW, you can login from <a href="loginPage.cfm">HERE</a>.</h2>
					<cfelse>
						<script>swal("Error!", "An Error occured, Please try again", "error")</script>
					</cfif>
			<cfelse>
				<script>swal("Error!", "An Error occured, Please try again", "error")</script>
			</cfif>
		</cfif>
	</body>
</html>
	<!---password--->
<cffunction name="validPassword" output="false" returntype="boolean" >
	<cfset var password = #form.password#/>
	<cfif password EQ ''>
		<cfreturn false>
	<cfelseif !(len(password) GTE 8 AND len(password) LTE 30 AND refind('[A-Z]',password) AND refind('[a-z]',password) AND
	 refind('[0-9]',password) AND refind('[!@##$&*]',password))>
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
	<!---confirm Password--->
<cffunction name="checkPassword" output="false" returntype="boolean" >
	<cfset confirmPassword = #form.confirmPassword#>
	<cfif !((confirmPassword NEQ '') AND (#form.password# EQ confirmpassword))>
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<cffunction name = "insertPassword" output="false" return type="boolean">
	<cfset var password = Hash(form.password & URL.id, "SHA-512") />
	<cftransaction>
		<cfquery name ="updatePassword">
			UPDATE [user]
			SET hashPassword = '#password#'
			WHERE [user].[salt] = '#URL.id#'
		</cfquery>
		<cfquery name="updateActive">
			UPDATE [user]
			SET active = 1
			WHERE [user].[salt] = '#URL.id#'
		</cfquery>
		<cfreturn true>
	</cftransaction>
		<cfreturn false>
</cffunction>