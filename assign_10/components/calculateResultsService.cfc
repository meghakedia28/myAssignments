<cfcomponent output = "false">
		<cffunction name="getDetails">
			<cfquery name="getUserAnswer">
				SELECT [userAnswer] FROM [score] JOIN [quizQuestion]
				ON [score].[quizQuestionId] = [quizQuestion].[quizQuestionId]
				WHERE [score].[userId] = "#sessionn.stLoggedInUser#" AND
				[quizQuestion].[quizId] = "#session.stQuizStarts.quizId#"
			</cfquery>
		</cffunction>
</cfcomponent>