<cfcomponent output="false">
	<cffunction name="quizQuestions" access="public" returntype="query" > 
		<cfargument name="quizId" required="true" type="numeric" > 
		<cfquery name="testQuestion">
			select [quizQuestion].[quizQuestionId], [questionBank].[question], [questionBank].[option1], [questionBank].[option2],
			 [questionBank].[option3], [questionBank].[option4]
			 FROM [questionBank] INNER JOIN [quizQuestion]
			 ON [quizQuestion].[quizQuestionId] = [questionBank].[questionId]
			 WHERE [quizQuestion].[quizId] = #arguments.quizId# order by [questionBank].[questionId];
		</cfquery>
		<cfreturn testQuestion>
	</cffunction>
</cfcomponent>