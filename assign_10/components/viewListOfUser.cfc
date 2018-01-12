<cfcomponent output="false">
	<cffunction access="public" name="getFacultyList" output="false" returntype="query">
		<cfquery name="facultyList">
			SELECT [active], [firstName], [lastName], [emailid], [contactNumber], [name] as subject
			FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
			JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
			WHERE [user].[roleId] = 2;
		</cfquery>
		<cfreturn facultyList>
	</cffunction>
	<cffunction access="public" name="getStudentList" output="false" returntype="query">
		<cfquery name="studentList">
			SELECT [active], [firstName], [lastName], [emailid], [contactNumber] FROM [user]
			WHERE [user].[roleId] = 3;
		</cfquery>
		<cfreturn studentList>
	</cffunction>
</cfcomponent>