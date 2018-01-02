<cfcomponent output="false" >
	<cffunction name = "getStudentsDetails" output="false" returntype="Query">
		<cfquery name="studentsDetails">
			SELECT [user].[userId], [user].[firstName], [user].[lastName], [user].[emailid], [user].[contactNumber]
			FROM [user] JOIN [role] ON [user].[roleId] = [role].[roleId]
			WHERE [role].[name] = 'student'
		</cfquery>
	<cfreturn studentsDetails>
	</cffunction>
</cfcomponent>