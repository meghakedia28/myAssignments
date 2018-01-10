<cfcomponent output="false">
	<cffunction name="getQuizList" output="false" access="public" returntype="Query">
		<cfargument name="Id" required="true" type="numeric">
		<cfquery name="quizList">
			SELECT * FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfreturn  quizList>
	</cffunction>
	<cffunction name="getQuestionList" output="false" access="public" returntype="query" >
		<cfargument name="Id" required="true" type="numeric">
		<cfquery name="questionList">
			SELECT [quizQuestion].[quizId], [questionBank].[questionId], [questionBank].[question],
			 [questionBank].[option1], [questionBank].[option2], [questionBank].[option3], [questionBank].[option4]
			 FROM [quizQuestion] JOIN [questionBank] ON [quizQuestion].[questionId] = [questionBank].[questionId]
			WHERE [quizQuestion].[quizId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint"  >
		</cfquery>
		<cfreturn questionList>
	</cffunction>
</cfcomponent>