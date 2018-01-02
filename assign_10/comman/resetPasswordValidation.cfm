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
	<cfelseif !(len(local.password) GTE 8 AND len(local.password) LTE 30 AND refind('[A-Z]',local.password) AND refind('[a-z]',local.password) AND
	 refind('[0-9]',local.password) AND refind('[!@##$%&*]',local.password))>
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
	<!---confirm Password--->
<cffunction name="checkPassword" output="false" returntype="boolean" >
	<cfset var confirmPassword = #form.confirmPassword#>
	<cfif !((local.confirmPassword NEQ '') AND (#form.password# EQ local.confirmPassword))>
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
			SET hashPassword = '#local.password#', active = 1
			WHERE [user].[salt] = '#URL.id#'
		</cfquery>
		<cfreturn true>
	</cftransaction>
		<cfreturn false>
</cffunction>