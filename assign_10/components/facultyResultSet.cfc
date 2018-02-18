<cfcomponent output = "false">
	<cffunction name = "fetchResultSet" access="public" returntype="query">
		<cfargument name="userId" required="true" type="numeric">
		<cfquery name="resultSet">
			SELECT [quiz].[name], [quiz].[startDateTime], [quiz].[endDateTime], [quiz].[quizId],
				[user].[firstName], [user].[lastName], [scoreDetails].[score], [scoreDetails].[userId], RANK () OVER
				(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
				FROM [scoreDetails] JOIN [quiz] ON [quiz].[quizId] = [scoreDetails].[quizId] JOIN [user]
				ON [user].[userId] = [scoreDetails].[userId]
				Where [quiz].[userId] = <cfqueryparam value = "#arguments.userId#" cfsqltype = "cf_sql_bigint" />
				ORDER BY [quiz].[startDateTime] DESC, RANK, [user].[firstName];
		</cfquery>
		<cfreturn resultSet>
	</cffunction>
	<cffunction name = "getResultSet" access="remote" returntype="Struct" returnformat="JSON">
		<cfargument name="userId" required="true" type="numeric">
		<cfset var dataArray=ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var resultSet = fetchResultSet(arguments.userId) />
		<cfset var i = 1>
		<cfloop query="#resultSet#">
			<cfset dataArray[i][1] = encodeForHTML(resultSet.name) />
			<cfset dataArray[i][2] = DateFormat(resultSet.startDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(resultSet.startDateTime,'HH:nn:ss') />
			<cfset dataArray[i][3] = DateFormat(resultSet.endDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(resultSet.endDateTime,'HH:nn:ss') />
			<cfset dataArray[i][4] = encodeForHTML(resultSet.firstName) &' '& encodeForHTML(resultSet.lastName) />
			<cfset dataArray[i][5] = "<a href=''>#resultSet.score# %</a>" />
			<cfset dataArray[i][6] = encodeForHTML(resultSet.RANK) />
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>
	<cffunction name = "individualStudentResultSet" access="public" returntype="query">
		<cfargument name="studentId" required="true" type="numeric">
		<cfargument name="userId" required="true" type="numeric">
		<cfset var ResultSet = fetchResultSet(#arguments.userId#) >
		<cfquery  dbtype="query" name="getIndividualStudentResultSet">
			SELECT name, firstName, lastName, startDateTime, score, quizId, RANK FROM local.ResultSet
				WHERE userId = <cfqueryparam value="#arguments.studentId#" cfsqltype="cf_sql_bigint" />;
		</cfquery>
		<cfreturn getIndividualStudentResultSet>
	</cffunction>
	<cffunction name="fetchListOfQuiz" access="public" returntype="query">
		<cfargument name="userId" required="true" type="numeric">
		<cfquery name="getquizList">
			SELECT [quiz].[name], [quiz].[quizId]
			FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_bigint">
			AND [quiz].[endDateTime] <= <cfqueryparam value="#DateFormat(now(),'yyyy/mm/dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#" >
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn getquizList>
	</cffunction>
	<cffunction name="getListOfQuiz" access="remote" returntype="Struct" returnformat="JSON">
		<cfargument name="userId" required="true" type="numeric">
		<cfset var dataArray=ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var resultSet = fetchListOfQuiz(arguments.userId) />
		<cfset var i = 1>
		<cfloop query="#resultSet#">
			<cfset dataArray[i][1] = "<input type='checkbox' name='quizId' id ='quizId' value='#resultSet.quizId#'></input>" />
			<cfset dataArray[i][2] = encodeForHTML(resultSet.name) />
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>
	<cffunction name="filterOnQuiz" access="remote" returntype="Struct" returnformat="JSON">
		<cfargument name="listOfQuizId" required="true" type="string">
		<cfargument name="userId" required="true" type="numeric">
		<cfset var quizIds = #listToArray(arguments.listOfQuizId, ",", false)#>
		<cfset var dataArray=ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var data = fetchResultSet(arguments.userId) />
		<cfset var i = 1>
		<cfquery dbtype="query" name="getQuizList">
 			SELECT * FROM data
 			WHERE data.quizId IN
			('0'<cfloop array="#local.quizIds#" index="id">
				,'#id#'
			</cfloop>)
		</cfquery>
		<cfloop query="#getQuizList#">
			<cfset dataArray[i][1] = encodeForHTML(getQuizList.name) />
 			<cfset dataArray[i][2] = DateFormat(getQuizList.startDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(getQuizList.startDateTime,'HH:nn:ss') />
 			<cfset dataArray[i][3] = DateFormat(getQuizList.endDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(getQuizList.endDateTime,'HH:nn:ss') />
 			<cfset dataArray[i][4] = encodeForHTML(getQuizList.firstName) &' '& encodeForHTML(getQuizList.lastName) />
 			<cfset dataArray[i][5] = "<a href=''>#getQuizList.score# %</a>" />
 			<cfset dataArray[i][6] = encodeForHTML(getQuizList.RANK) />
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>
</cfcomponent>