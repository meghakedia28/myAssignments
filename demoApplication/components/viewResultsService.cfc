<!---
NAME : viewResultsService.cfc
CREATED BY : megha Kedia
USE: used to get the results for a perticular student and their ranks --->

<cfcomponent output = "false">
	<!---userResult : used to get the result of a perticular student for all the tests--->
	<cffunction name = "userResult" output = "false" access = "public" returntype = "query">
		<cfargument name = "Id" required = "true" type = "numeric">
		<cfquery name = "getResults">
			SELECT [quiz].[quizId], [quiz].[name], [quiz].[startDateTime],
			[scoreDetails].[score], [user].[firstName], [user].[lastName]
			FROM [quiz] JOIN [scoreDetails] ON
			[quiz].[quizId] = [scoreDetails].[quizId]
			JOIN [user] ON [user].[userId] = [scoreDetails].[userId]
			WHERE [scoreDetails].[userId] = <cfqueryparam value = "#arguments.Id#" cfsqltype = "cf_sql_bigint">
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn getResults>
	</cffunction>
	<!---getRanks : used to get the rank of a student for all the test--->
	<cffunction name = "getRanks" output = "false" access = "public" returntype = "numeric">
		<cfargument name = "quizId" required = "true" type = "numeric">
		<cfargument name = "Id" required = "true" type = "numeric">
		<cftry>
			<cfquery name = "fetchRanks">
				SELECT *,RANK () OVER
				(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
				FROM [scoreDetails]
			</cfquery>
			<cfquery dbtype = "query" name = "getSingleRank" >
				SELECT RANK FROM fetchRanks WHERE userId = <cfqueryparam value = "#arguments.Id#" cfsqltype = "cf_sql_bigint" />
				AND quizId = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint" >
			</cfquery>
		<cfcatch type = "database">
			<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
			<cfreturn 0>
		</cfcatch>
		<cfcatch type = "any">
			<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfreturn 0>
		</cfcatch>
		</cftry>
		<cfreturn #getSingleRank.RANK#>
	</cffunction>
</cfcomponent>