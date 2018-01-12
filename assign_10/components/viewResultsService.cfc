<cfcomponent output="false">
	<cffunction name="userResult" output="false" access="public" returntype="query">
		<cfargument name="Id" required="true" type="numeric">
		<cfquery name="getResults">
			SELECT [quiz].[quizId], [quiz].[name], [quiz].[startDateTime], [scoreDetails].[score], [user].[firstName], [user].[lastName]
			FROM [quiz] JOIN [scoreDetails] ON
			[quiz].[quizId] = [scoreDetails].[quizId]
			JOIN [user] ON [user].[userId] = [scoreDetails].[userId]
			WHERE [scoreDetails].[userId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint">
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn getResults>
	</cffunction>
	<cffunction name="getRanks" output="false" access="public" returntype="Numeric">
		<cfargument name="quizID" required="true" type="numeric">
		<cfargument name="Id" required="true" type="numeric">
		<cfquery name = "getRanks">
			SELECT *,RANK () OVER
			(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
			FROM [scoreDetails]
		</cfquery>
		<cfquery dbtype="query" name="getSingleRank" >
			SELECT RANK FROM getRanks WHERE userId = <cfqueryparam value = "#arguments.Id#" cfsqltype="cf_sql_bigint" />
			AND quizId = <cfqueryparam value = "#arguments.quizID#" cfsqltype="cf_sql_bigint" >
		</cfquery>
		<cfreturn #getSingleRank.RANK#>
	</cffunction>
</cfcomponent>