<cfcomponent output="false">
	<cffunction name="quizQuestions" access="public" returntype="query" >
		<cfargument name="quizId" required="true" type="numeric" >
		<cfquery name="testQuestion">
			select [quizQuestion].[quizQuestionId], [questionBank].[question], [questionBank].[option1], [questionBank].[option2],
			 [questionBank].[option3], [questionBank].[option4]
			 FROM [questionBank] INNER JOIN [quizQuestion]
			 ON [quizQuestion].[questionId] = [questionBank].[questionId]
			 WHERE [quizQuestion].[quizId] =<cfqueryparam value="#arguments.quizId#" cfsqltype="cf_sql_bigint"> order by [questionBank].[questionId];
		</cfquery>
		<cfreturn testQuestion>
	</cffunction>
</cfcomponent>