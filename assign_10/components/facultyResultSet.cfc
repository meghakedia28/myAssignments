<cfcomponent output = "false">
	<cffunction name = "generateResultSet" access="public" returntype="query">
		<cfquery name="getResultSet">
			SELECT [quiz].[name], [quiz].[startDateTime], [quiz].[endDateTime], [quiz].[quizId],
				[user].[firstName], [user].[lastName], [scoreDetails].[score], [scoreDetails].[userId], RANK () OVER
				(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
				FROM [scoreDetails] JOIN [quiz] ON [quiz].[quizId] = [scoreDetails].[quizId] JOIN [user]
				ON [user].[userId] = [scoreDetails].[userId]
				Where [quiz].[userId] = <cfqueryparam value = "#session.stLoggedInUser.userId#" cfsqltype = "cf_sql_bigint" />
				ORDER BY [quiz].[startDateTime] DESC, RANK, [user].[firstName];
		</cfquery>
		<cfreturn getResultSet>
	</cffunction>
	<cffunction name = "individualResultSet" access="public" returntype="query">
		<cfset ResultSet = generateResultSet() >
		<cfquery  dbtype="query" name="getIndividualResultSet">
			SELECT name, firstName, lastName, startDateTime, score, quizId, RANK FROM ResultSet
				Where userId = <cfqueryparam value="#URL.Id#" cfsqltype="cf_sql_bigint" />;
		</cfquery>
		<cfreturn getIndividualResultSet>
	</cffunction>
</cfcomponent>