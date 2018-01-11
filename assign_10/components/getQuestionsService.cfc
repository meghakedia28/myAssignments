<cfcomponent output="false">
	<cffunction name="getQuestions" access="public" returntype="query">
		<cfargument name="userId" required="true" type="numeric">
		<cfquery name = "questions">
			Select questionId,question,option1,option2,option3,option4,correctAnswer
			FROM [questionBank]
			WHERE userId =<cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_bigint" />
		</cfquery>
		<cfreturn questions>
	</cffunction>
</cfcomponent>