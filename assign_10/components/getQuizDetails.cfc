<cfcomponent output="false">
	<cffunction name="quizDetails" access="public" returntype="query" >
		<cfargument name = "currentTime" type="string" required="true">
		<cfquery name="testDetails">
			select TOP(1) CONVERT(VARCHAR(10), quiz.startDateTime, 110), CONVERT(VARCHAR(10), GETDATE(), 110), [quiz].[quizId], [quiz].[startDateTime], [quiz].[endDateTime], [quiz].[name] as quizName, [user].[firstName],
 				[user].[lastName], [subject].[name] as subjectName
 				FROM [quiz] INNER JOIN [user] ON [quiz].[userId] = [user].[userId]
				INNER JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
				INNER JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
				WHERE quiz.endDateTime >= <cfqueryparam value="#arguments.currentTime#" > order by [quiz].[startDateTime];

		</cfquery>
		<cfreturn testDetails>
	</cffunction>
</cfcomponent>