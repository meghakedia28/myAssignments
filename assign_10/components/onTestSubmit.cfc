<cfcomponent output="false">
	<!---insert Score into db--->
	<cffunction name="insertScore" access="remote" output="false" returntype="boolean" returnformat="JSON">
		<cfset var score = #getScore(#URL#)# />
			<cftry>
				<cftransaction>
					<cfquery name="insertScore">
						INSERT INTO [score]
							VALUES (
							<cfqueryparam value = "#session.stQuizStarts.quizId#" cfsqltype="cf_sql_bigint">,
							<cfqueryparam value= "#session.stLoggedInUser.userId#" cfsqltype="cf_sql_bigint">,0,
							<cfqueryparam value = "#local.score#" cfsqltype="cf_sql_decimal" scale="2" > );
						</cfquery>
					<cfset endsession = #destroySession()# />
				</cftransaction>
				<cfreturn true>
			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
	<!---calculate score of each user--->
	<cffunction name="getScore" access="public" output="false" returntype="Numeric">
		<cfargument name="data" required="true" type="struct">
		<cfset score = 0 />
 			<cftransaction>
				<cfquery name ="getQuizQuestionId" >
					SELECT [quizQuestionId], [questionId] FROM [quizQuestion]
					WHERE [quizId] = <cfqueryparam value = "#session.stQuizStarts.quizId#" cfsqltype="cf_sql_bigint" />
					ORDER BY [quizQuestionId];
				</cfquery>
				<cfset totalScore = #getQuizQuestionId.RecordCount#>
				<cfloop query = "getQuizQuestionId">
					<cfif (NOT (structKeyExists(data,#getQuizQuestionId.quizQuestionId#)))>
						<cfset userAnswer = "0" />
					<cfelse>
						<cfset userAnswer = StructFind(data,"#getQuizQuestionId.quizQuestionId#") />
						<cfquery name="correctAnswers">
							SELECT [correctAnswer] FROM [questionBank]
							WHERE [questionId] = <cfqueryparam value="#getQuizQuestionId.questionId#" cfsqltype="cf_sql_bigint">
						</cfquery>
						<cfset comparison = compare(#correctAnswers.correctAnswer#, #userAnswer#) />
							<cfif (#comparison# EQ 0)>
								<cfset #score# = #score# + 1 />
							</cfif>
					</cfif>
				</cfloop>
			</cftransaction>
	  			<cfreturn PrecisionEvaluate((score/totalScore)*100.0)>
	</cffunction>
	<!---destroy session.stQuizStarts --->
	<cffunction name="destroySession" access="public" output="false">
		<cfif structKeyExists(session, 'stQuizStarts') >
			<cfset structdelete(session, 'stQuizStarts') />
		</cfif>
	</cffunction>
</cfcomponent>