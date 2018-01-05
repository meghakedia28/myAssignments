<cfcomponent output="false" >
	<cffunction name = "getStudentsDetails" output="false" returntype="Query">
		<cfquery name="studentsDetails">
			SELECT [user].[userId], [user].[firstName], [user].[lastName], [user].[emailid], [user].[contactNumber]
			FROM [user] JOIN [role] ON [user].[roleId] = [role].[roleId]
			WHERE [role].[name] = 'student'
		</cfquery>
	<cfreturn studentsDetails>
	</cffunction>
	<cffunction name="getSingleStudentDetails" output="false" returntype="query">
		<cfargument name="Id" required="true" type="numeric" />
		<cfquery name="getstudent">
			SELECT [user].[firstName], [user].[lastName] FROM [user]
			WHERE [user].[userId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfreturn getstudent>
	</cffunction>
</cfcomponent>