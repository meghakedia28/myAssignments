<cfcomponent output="false">
	<cffunction name="quizDetails" access="public" returntype="query" >
		<cfargument name = "currentTime" type="string" required="true">
		<cfquery name="testDetails">
			SELECT TOP(1) [quiz].[quizId], [quiz].[startDateTime], [quiz].[endDateTime], [quiz].[name] as quizName, [user].[firstName],
 				[user].[lastName], [subject].[name] as subjectName
 				FROM [quiz] INNER JOIN [user] ON [quiz].[userId] = [user].[userId]
				INNER JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
				INNER JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
				WHERE [quiz].[endDateTime] >= <cfqueryparam value="#arguments.currentTime#" > order by [quiz].[startDateTime];
		</cfquery>
		<cfreturn testDetails>
	</cffunction>
	<cffunction name="getScore" access="public" returntype="query">
		<cfargument name = "userId" required="true" type="numeric" >
		<cfargument name="quizId" required="true" type="numeric">
			<cfquery name="testScore">
					SELECT [scoreDetails].[score] FROM [scoreDetails] JOIN [quiz]
					ON [scoreDetails].[quizId] = [quiz].[quizId]
					WHERE [scoreDetails].[userId] = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_bigint"> AND
					[quiz].[quizId] = <cfqueryparam value="#arguments.quizId#" cfsqltype="cf_sql_bigint">
			</cfquery>
			<cfreturn testScore>
	</cffunction>
</cfcomponent>