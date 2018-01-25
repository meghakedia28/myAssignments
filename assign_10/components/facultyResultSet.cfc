<cfcomponent output = "false">
	<cffunction name = "generateResultSet" access="public" returntype="query">
		<cfargument name="facultyId" required="true" type="numeric">
		<cfquery name="getResultSet">
			SELECT [quiz].[name], [quiz].[startDateTime], [quiz].[endDateTime], [quiz].[quizId],
				[user].[firstName], [user].[lastName], [scoreDetails].[score], [scoreDetails].[userId], RANK () OVER
				(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
				FROM [scoreDetails] JOIN [quiz] ON [quiz].[quizId] = [scoreDetails].[quizId] JOIN [user]
				ON [user].[userId] = [scoreDetails].[userId]
				Where [quiz].[userId] = <cfqueryparam value = "#arguments.facultyId#" cfsqltype = "cf_sql_bigint" />
				ORDER BY [quiz].[startDateTime] DESC, RANK, [user].[firstName];
		</cfquery>
		<cfreturn getResultSet>
	</cffunction>
	<cffunction name = "individualStudentResultSet" access="public" returntype="query">
		<cfargument name="studentId" required="true" type="numeric">
		<cfargument name="facultyId" required="true" type="numeric">
		<cfset ResultSet = generateResultSet(#arguments.facultyId#) >
		<cfquery  dbtype="query" name="getIndividualStudentResultSet">
			SELECT name, firstName, lastName, startDateTime, score, quizId, RANK FROM ResultSet
				WHERE userId = <cfqueryparam value="#arguments.studentId#" cfsqltype="cf_sql_bigint" />;
		</cfquery>
		<cfreturn getIndividualStudentResultSet>
	</cffunction>
	<cffunction name="listOfQuiz" access="public" returntype="query">
		<cfargument name="facultyId" required="true" type="numeric">
		<cfquery name="getquizList">
			SELECT [quiz].[name], [quiz].[quizId]
			FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam value="#arguments.facultyId#" cfsqltype="cf_sql_bigint">
			AND [quiz].[endDateTime] <= <cfqueryparam value="#DateFormat(now(),'yyyy/mm/dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#" >
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn getquizList>
	</cffunction>
	<cffunction name="filterOnQuiz" access="remote" returntype="any" returnformat="JSON">
		<cfargument name="arrayOfQuizId" required="true" type="string">
		<cfset ResultSet = generateResultSet(#session.stLoggedInUser.userId#) >
		<cfset var.quizIds = #listToArray(arguments.arrayOfQuizId, "&quizId=", false)#>
		<cfquery dbtype="query" name="getQuizList">
 			SELECT * FROM ResultSet
 			WHERE ResultSet.quizId IN
			('0'<cfloop array="#var.quizIds#" index="i">
				,'#i#'
			</cfloop>)
		</cfquery>
		<cfreturn  serializeJSON(getQuizList, "struct")>
	</cffunction>
</cfcomponent>