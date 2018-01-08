<cfcomponent output="false">
	<cffunction name="getQuizList" output="false" access="public" returntype="Query">
		<cfargument name="Id" required="true" type="numeric">
		<cfquery name="quizList">
			SELECT * FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfreturn  quizList>
	</cffunction>
</cfcomponent>