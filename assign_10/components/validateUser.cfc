<cfcomponent output="false">
	<cffunction name="validateEmail" access="remote" returnformat="JSON" returntype="struct" >
		<cfargument name="emailId" type="string" required="true" >
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.emailId EQ ''>
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "You can't leave this empty." />
			<cfreturn var.stStatus>
		<cfelseif !(isValid("eMail", emailId)) >
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn var.stStatus>
		<cfelse>
			<cfquery name="userExists" >
				SELECT [user].[userId] FROM [user]
				WHERE [user].[emailid] = <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar" >
			</cfquery>
			<cfif userExists.recordCount NEQ 0>
				<cfset var.stStatus.status = "success" />
				<cfset var.stStatus.message =  "User exists" />
				<cfreturn var.stStatus>
			<cfelse>
				<cfset var.stStatus.status = "error" />
					<cfset var.stStatus.message = "Your search didn't return any result, Please try again with other information" />
					<cfreturn var.stStatus >
			</cfif>
		</cfif>
	</cffunction>
</cfcomponent>