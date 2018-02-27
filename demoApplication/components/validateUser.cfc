<!---
NAME : testValidationService.cfc
CREATED BY : megha Kedia
USE: this component is used when validating the
emailid entered to reset password in forgetPassword.cfm--->

<cfcomponent output = "false">
	<!---used to valiadte the emailId of a user--->
	<cffunction name = "validateEmail" access = "public" returntype = "struct" >
		<cfargument name = "emailId" type = "string" required = "true" >
		<cfset stStatus = {status = {} , message = {}} >
		<cfif arguments.emailId EQ ''>
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "You can't leave this empty." />
			<cfreturn local.stStatus>
		<cfelseif !(isValid("eMail", arguments.emailId)) >
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn local.stStatus>
		<cfelse>
		<cftry>
			<cfquery name = "userExists" >
				SELECT [user].[userId] FROM [user]
				WHERE [user].[emailid] = <cfqueryparam value = "#arguments.emailId#" cfsqltype = "cf_sql_varchar" >
				AND [user].[active] = 1
			</cfquery>
		<cfcatch type = "database">
			<cflog file="dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
			<cfreturn local.stStatus>
		</cfcatch>
		<cfcatch type = "any">
			<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
			<cfreturn local.stStatus>
		</cfcatch>
		</cftry>
			<cfif userExists.recordCount NEQ 0>
				<cfset local.stStatus.status = "success" />
				<cfset local.stStatus.message = "User exists" />
				<cfreturn local.stStatus>
			<cfelse>
				<cfset local.stStatus.status = "fail" />
				<cfset local.stStatus.message = "Your search didn't return any result,
					Please try again with correct information." />
				<cfreturn local.stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<!---validateAndSendMailController : after validating the status is updated and the mail is send--->
	<cffunction name = "validateAndSendMailController" access = "remote" returntype = "struct" returnformat = "JSON" >
		<cfargument name = "emailId" required = "true" type = "string">
			<cftransaction>
				<cfset var validate = validateEmail(arguments.emailId) />
				<cfif local.validate.status EQ "success">
					<cftry>
						<cfquery name = "updateReset">
							UPDATE [user] SET [user].[reset] = [user].[reset] + 1
							WHERE [user].[emailid] = <cfqueryparam value = "#arguments.emailId#" cfsqltype = "cf_sql_varchar">
						</cfquery>
						<cfquery name = "getsaltReset">
							SELECT [user].[salt], [user].[reset], [user].[firstName] FROM [user]
							WHERE [user].[emailid] = <cfqueryparam value = "#arguments.emailId#" cfsqltype = "cf_sql_varchar">
						</cfquery>
						<cfset sendMail = createObject("component",
							"demoApplication.components.mailService").forgetPassword(
							arguments.emailId, getsaltReset.firstName, getsaltReset.salt, getsaltReset.reset) />
						<cfreturn local.validate >
					<cfcatch type = "database">
						<cflog file="dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
						<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
						<cfset local.validate.status = "error" />
						<cfset local.validate.message =  "Some unexpected error has occured, Please try again later." />
						<cfreturn local.validate>
					</cfcatch>
					<cfcatch type = "any">
						<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
						<cfset local.validate.status = "error" />
						<cfset local.validate.message =  "Some unexpected error has occured, Please try again later." />
						<cfreturn local.validate>
					</cfcatch>
					</cftry>
				<cfelse>
					<cfreturn local.validate>
				</cfif>
			</cftransaction>
	</cffunction>
</cfcomponent>