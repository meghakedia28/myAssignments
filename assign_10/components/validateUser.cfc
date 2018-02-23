<cfcomponent output="false"> <!---this component is used when validating the emailid entered to reset password in forgetPassword.cfm--->
	<cfset stStatus = {status = {} , message = {}} >
	<cffunction name="validateEmail" access="public" returntype="struct" >
		<cfargument name="emailId" type="string" required="true" >
		<cfif arguments.emailId EQ ''>
			<cfset stStatus.status = "error" />
			<cfset stStatus.message = "You can't leave this empty." />
			<cfreturn stStatus>
		<cfelseif !(isValid("eMail", arguments.emailId)) >
			<cfset stStatus.status = "error" />
			<cfset stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn stStatus>
		<cfelse>
			<cfquery name="userExists" >
				SELECT [user].[userId] FROM [user]
				WHERE [user].[emailid] = <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar" >
				AND [user].[active] = 1
			</cfquery>
			<cfif userExists.recordCount NEQ 0>
				<cfset stStatus.status = "success" />
				<cfset stStatus.message =  "User exists" />
				<cfreturn stStatus>
			<cfelse>
				<cfset stStatus.status = "error" />
					<cfset stStatus.message = "Your search didn't return any result, Please try again with correct information." />
					<cfreturn stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<cffunction name="validateAndSendMailController" access="remote" returntype="struct" returnformat="JSON" >
		<cfargument name="emailId" required="true" type="string">
			<cftransaction>
				<cfset var validate = validateEmail(arguments.emailId) />
				<cfif local.validate.status EQ "success">
					<cfquery name="updateReset">
						UPDATE [user] SET [user].[reset] = [user].[reset] + 1
						WHERE [user].[emailid] = <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">
					</cfquery>
					<cfquery name="getsaltReset">
						SELECT [user].[salt], [user].[reset], [user].[firstName] FROM [user]
						WHERE [user].[emailid] = <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">
					</cfquery>
					<cfset sendMail = createObject("component",'assign_10.components.mailService').forgetPassword(arguments.emailId, getsaltReset.firstName, getsaltReset.salt, getsaltReset.reset) />
					<cfreturn local.validate >
				<cfelse>
					<cfreturn local.validate>
				</cfif>
			</cftransaction>
	</cffunction>
</cfcomponent>