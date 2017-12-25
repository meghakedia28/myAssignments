<cfcomponent output="false">

	<cffunction name="subjectCheck" access="remote" returnformat="JSON" returntype="string">
		<cfargument name="subject" required="true" type="string" >
		<cfquery name="subjectCount" >
			SELECT [subject].[subjectId] FROM [subject]
			WHERE [subject].[name] = <cfqueryparam value="#arguments.subject#" cfsqltype="cf_sql_varchar" >
		</cfquery>
		<cfif subjectCount.RecordCount NEQ 0>
			<cfreturn 'this subject already exists'>
		<cfelse>
			<cfreturn 'this subject is new and will be added once you click DONE'>
		</cfif>
	</cffunction>
	<cffunction name="userCheck" access="remote" returntype="string" returnformat="JSON" >
		<cfargument name="email" required="true" type="string" >
		<cfquery name="emailCheck">
			SELECT [user].[userId] FROM [user]
			WHERE [user].[emailid] = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" >
		</cfquery>  
		<cfif emailCheck.RecordCount NEQ 0>
			<cfreturn 'User already exists'>
		<cfelse>
			<cfreturn 'Welcome new user'>
		</cfif>
	</cffunction>
</cfcomponent>