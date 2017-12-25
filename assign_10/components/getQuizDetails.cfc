<cfcomponent output="false">
	<cffunction name="quizDetails" access="public" returntype="query" > 
		<cfquery name="testDetails">
			select TOP(1) [quiz].[quizId], [quiz].[startDateTime], [quiz].[endDateTime], [quiz].[name] as quizName, [user].[firstName],
 				[user].[lastName], [subject].[name] as subjectName 
 				FROM [quiz] INNER JOIN [user] ON [quiz].[userId] = [user].[userId]
				INNER JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
				INNER JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
				WHERE  ( CONVERT(VARCHAR(8), startDateTime, 1) ) >= CONVERT(VARCHAR(8), GETDATE(), 1) order by [quiz].[startDateTime];
		</cfquery>
		<cfreturn testDetails>
	</cffunction>
</cfcomponent>