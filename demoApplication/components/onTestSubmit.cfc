<!---
NAME : onTestSubmit.cfc
CREATED BY : megha Kedia
USE: used to perform certain operations after submitting the test by students, such as:
	calculating the score and scoring it , destroy the session variables for the perticular test--->

<cfcomponent output = "false">
	<cfset report = ''/>
	<!---insert scoreDetails into db--->
	<cffunction name = "insertScore" access = "remote" output = "false" returntype = "boolean" returnformat = "JSON">
		<cfset var score = calculateScore(url) />
		<cfif score EQ -1>
			<cfreturn false>
		<cfelse>
			<cftry>
				<cftransaction>
					<cfquery name = "checkScoreExists">
						SELECT [scoreDetails].[scoreId] FROM [scoreDetails]
							WHERE [scoreDetails].[quizId] = <cfqueryparam value = "#session.stQuizStarts.quizId#" cfsqltype = "cf_sql_bigint">
							AND [scoreDetails].[userId] = <cfqueryparam value = "#session.stLoggedInUser.userId#" cfsqltype = "cf_sql_bigint">
					</cfquery>
					<cfif checkScoreExists.recordCount EQ 0>
						<cfquery>
							INSERT INTO [scoreDetails]
								VALUES (
								<cfqueryparam value = "#session.stQuizStarts.quizId#" cfsqltype = "cf_sql_bigint">,
								<cfqueryparam value = "#session.stLoggedInUser.userId#" cfsqltype = "cf_sql_bigint">,
								<cfqueryparam value = "#report#" cfsqltype = "cf_sql_varchar">,
								<cfqueryparam value = "#score#" cfsqltype = "cf_sql_decimal" scale = "2" > );
						</cfquery>
					</cfif>
					<cfset destroySession() />
				</cftransaction>
				<cfreturn true>
			<cfcatch type = "database">
			  	<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfreturn false>
		  	</cfcatch>
 			<cfcatch type = "any">
				<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
 				<cfreturn false>
 			</cfcatch>
 			</cftry>
		</cfif>
	</cffunction>
	<!---calculate score of each user--->
	<cffunction name = "calculateScore" access = "public" output = "false" returntype = "numeric">
		<cfargument name = "data" required = "true" type = "struct">
		<cfset var score = 0 />
		<cftry>
			<cftransaction>
				<cfquery name = "getQuizQuestionId" >
					SELECT [quizQuestionId], [questionId] FROM [quizQuestion]
					WHERE [quizId] = <cfqueryparam value = "#session.stQuizStarts.quizId#" cfsqltype = "cf_sql_bigint" />
					ORDER BY [quizQuestionId];
				</cfquery>
				<cfset var totalScore = #getQuizQuestionId.RecordCount#>
				<cfloop query = "getQuizQuestionId">
					<cfset report = report & getQuizQuestionId.quizQuestionId & ',' />
					<cfquery name = "correctAnswers">
						SELECT [correctAnswer] FROM [questionBank]
						WHERE [questionId] = <cfqueryparam value = "#getQuizQuestionId.questionId#" cfsqltype = "cf_sql_bigint">
					</cfquery>
					<cfset report = report & correctAnswers.correctAnswer & ','>
					<cfif (NOT (structKeyExists(data,#getQuizQuestionId.quizQuestionId#)))>
						<cfset var userAnswer = "0" />
					<cfelse>
						<cfset userAnswer = StructFind(data,"#getQuizQuestionId.quizQuestionId#") />
						<cfset var comparison = compare(#correctAnswers.correctAnswer#, #userAnswer#) />
							<cfif (#comparison# EQ 0)>
								<cfset score = score + 1 />
							</cfif>
					</cfif>
					<cfset report = report & userAnswer & ';' >
				</cfloop>
			</cftransaction>
	  			<cfreturn PrecisionEvaluate((score/totalScore)*100.0)>
	  	<cfcatch type = "database">
		  	<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
			<cfreturn -1>
	  	</cfcatch>
	  	<cfcatch type = "any">
		  	<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfreturn -1>
	  	</cfcatch>
		</cftry>
	</cffunction>
	<!---destroy session.stQuizStarts --->
	<cffunction name = "destroySession" access = "public" output = "false">
		<cfif structKeyExists(session, 'stQuizStarts') >
			<cfset structdelete(session, 'stQuizStarts') />
		</cfif>
	</cffunction>
</cfcomponent>