<cfcomponent output="false">
	<cffunction name="userResult" output="false" access="public" returntype="query">
		<cfquery name="getResults">
			SELECT [quiz].[quizId], [quiz].[name], [quiz].[startDateTime], [scoreDetails].[score]
			FROM [quiz] JOIN [scoreDetails] ON
			[quiz].[quizId] = [scoreDetails].[quizId]
			WHERE [scoreDetails].[userId] = <cfqueryparam value="#session.stLoggedInUser.userId#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfreturn getResults>
	</cffunction>
	<cffunction name="getRanks" output="false" access="public" returntype="Numeric">
		<cfargument name="quizID" required="true" type="numeric">
		<cfquery name = "getRanks">
			SELECT *,RANK () OVER
			(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
			FROM [scoreDetails]
		</cfquery>
		<cfquery dbtype="query" name="getSingleRank" >
			SELECT RANK FROM getRanks WHERE userId = <cfqueryparam value = "#session.stLoggedInUser.userId#" cfsqltype="cf_sql_bigint" />
			AND quizId = <cfqueryparam value = "#arguments.quizID#" cfsqltype="cf_sql_bigint" >
		</cfquery>
		<cfreturn #getSingleRank.RANK#>
	</cffunction>
</cfcomponent>