<!---
NAME : getUserDetailsService.cfc
CREATED BY : megha Kedia
USE: get the details of user by id and roles --->

<cfcomponent output = "false">
	<!---getUserDetails : get the details of the user by its id--->
	<cffunction name = "getUserDetails" access = "public" output = "false" returntype = "Query">
		<cfargument name = "Id" required = "true" type = "string" >
		<cfquery name = "userDetails">
			SELECT [active], [firstName], [lastName], [reset] FROM [user]
			WHERE [salt] = <cfqueryparam value = "#arguments.Id#" cfsqltype = "cf_sql_varchar" >
		</cfquery>
		<cfreturn userDetails >
	</cffunction>
	<!---getStudentsDetails : get the details of all the students--->
	<cffunction name = "getStudentsDetails" output="false" returntype="query">
		<cfquery name="studentsDetails">
			SELECT [user].[userId], [user].[firstName], [user].[lastName], [user].[emailid], [user].[contactNumber]
			FROM [user] JOIN [role] ON [user].[roleId] = [role].[roleId]
			WHERE [role].[name] = 'student' and active = 1
		</cfquery>
	<cfreturn studentsDetails>
	</cffunction>
</cfcomponent>