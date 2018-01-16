<cfcomponent output="false">
	<cffunction name="getUserDetails" access="public" output="false" returntype="Query">
		<cfargument name="Id" required="true" type="string" >
		<cfquery name="userDetails">
			SELECT [active], [firstName], [lastName] FROM [user]
			WHERE [salt] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_varchar" >
		</cfquery>
		<cfreturn userDetails >
	</cffunction>
</cfcomponent>