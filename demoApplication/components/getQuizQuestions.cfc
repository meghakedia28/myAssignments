<!---
NAME : getQuizQuestions.cfc
CREATED BY : megha Kedia
USE: used to get the quiz question for the tests --->

<cfcomponent output = "false">
	<!---quizQuestions : used to get the question in a perticular quiz for viewing during test--->
	<cffunction name = "quizQuestions" access = "public" returntype = "query" >
		<cfargument name = "quizId" required = "true" type = "numeric" >
		<cfquery name = "testQuestion">
			select [quizQuestion].[quizQuestionId], [questionBank].[question], [questionBank].[option1], [questionBank].[option2],
			 [questionBank].[option3], [questionBank].[option4]
			 FROM [questionBank] INNER JOIN [quizQuestion]
			 ON [quizQuestion].[questionId] = [questionBank].[questionId]
			 WHERE [quizQuestion].[quizId] = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint"> order by [questionBank].[questionId];
		</cfquery>
		<cfreturn testQuestion>
	</cffunction>
</cfcomponent>