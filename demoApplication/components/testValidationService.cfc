<!---
NAME : testValidationService.cfc
CREATED BY : megha Kedia
USE: use to validate or authenticate before starting the test--->

<cfcomponent output = "false" >
	<!---checkTestTime : use to validate if the test should start or not, if yes then creates session for the test--->
	<cffunction name = "checkTestTime" output = "false" access = "remote" returntype = "boolean" returnformat = "JSON">
		<cfset var currentTime = (DateFormat(now(),'yyyy-mm-dd') & ' ' & TimeFormat(now(),'HH:nn:ss')) />
		<cfset var object = createObject("component",'demoApplication.components.getQuizDetails') />
		<cfset var testDetails = object.currentQuizDetails(currentTime)>
		<cfset var startTime = testDetails.startDateTime />
		<cfset var endTime = testDetails.endDateTime />
		<cftry>
 			<cftransaction>
				<cfquery name = "checkTestOver">
					SELECT [scoreDetails].[scoreId] FROM [scoreDetails] JOIN [quiz]
					ON [scoreDetails].[quizId] = [quiz].[quizId]
					WHERE [scoreDetails].[userId] = <cfqueryparam value = "#session.stLoggedInUser.userId#"
						cfsqltype = "cf_sql_bigint"> AND
						[quiz].[quizId] = <cfqueryparam value = "#testDetails.quizId#" cfsqltype = "cf_sql_bigint">
				</cfquery>
				<cfif !((local.currentTime GTE local.startTime)
						AND (local.currentTime LTE local.endTime) AND (checkTestOver.RecordCount EQ 0)) >
					<cfreturn false>
				<cfelse>
					<cflock scope = "session" timeout = "30" >
						<cfif checkTestOver.recordCount EQ 0>
							<cfset session.stQuizStarts = {'quizId' = testDetails.quizId ,
								'startTime' = testDetails.startDateTime, 'endTime' = testDetails.endDateTime } />
						</cfif>
					</cflock>
					<cfreturn true>
				</cfif>
			 </cftransaction>
 			<cfreturn true>
 		<cfcatch type = "any">
 			<cfreturn false>
 		</cfcatch>
 		</cftry>
	</cffunction>
</cfcomponent>