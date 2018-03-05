<!---
NAME : enterQuiz.cfc
CREATED BY : megha Kedia
USE: use for insert questions added by faculty in db after validating it--->

<cfcomponent output = "false">
	<cfset variables.errorStruct = {elementId = {},errorId = {}}>
	<cfset variables.insertionStruct = {successfull = {},message = {}}>
	<!---validateAllFields : validate all the fields--->
	<cffunction name = "validateAllFields" output = "false" access = "public">
		<cfargument name = "quizId" required = "false" type = "numeric" default = "0">
		<cfif StructKeyExists(url,"quizName")>
			<cfset var checkQuizNameStatus = checkQuizName(url.quizName, arguments.quizId)>
			<cfif local.checkQuizNameStatus.status EQ "error" >
				<cfset variables.errorStruct.elementId.quizName = #url.quizName# >
				<cfset variables.errorStruct.errorId.error_quizname = local.checkQuizNameStatus.message >
			</cfif>
		</cfif>
		<cfif StructKeyExists(url,"startTime")>
			<cfset var checkStartTimeStatus = checkStartTime(url.startTime, arguments.quizId)>
			<cfif local.checkStartTimeStatus.status EQ "error">
				<cfset variables.errorStruct.elementId.startTime = #url.startTime# >
				<cfset variables.errorStruct.errorId.error_starttime = local.checkStartTimeStatus.message >
			</cfif>
		</cfif>
		<cfif StructKeyExists(url,"endTime")>
			<cfset checkEndTime(url.endTime)>
		</cfif>
		<cfif arguments.quizId EQ 0>
			<cfif StructKeyExists(url,"questionId")>
				<cfset checkQuestionList(url.questionId)>
			<cfelse>
				<cfset variables.errorStruct.elementId.questionId = "" >
				<cfset variables.errorStruct.errorId.error_questions = "You should select atleast one question to set the quiz">
			</cfif>
		</cfif>
	</cffunction>
	<!---insertQuizDetailsController : controls the validation of quiz and then allowing to insert the quiz details--->
	<cffunction name = "insertQuizDetailsController" access = "remote" returntype = "Struct" returnformat = "JSON">
		<cftry>
			<cfset validateAllFields() />
			<cfif StructIsEmpty(variables.errorStruct.errorId)>
				<cfset var insertion = insertQuizDetails(url,session.stLoggedInUser.userId)>
				<cfif (insertion) >
					<cfset variables.insertionStruct.successfull = "true">
					<cfset variables.insertionStruct.message = "Quiz has been successfully set">
					<cfreturn variables.insertionStruct>
				<cfelse>
					<cfset variables.insertionStruct.successfull = "false">
					<cfset variables.insertionStruct.message = "Error occured while insertion of data">
					<cfreturn variables.insertionStruct>
				</cfif>
			<cfelse>
				<cfreturn variables.errorStruct>
			</cfif>
		<cfcatch type = "any">
			<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset variables.insertionStruct.successfull = "false">
			<cfset variables.insertionStruct.message = "Error occured while insertion of data">
			<cfreturn variables.insertionStruct>
		</cfcatch>
		</cftry>
	</cffunction>
	<!---checkQuizName : validating thw quiz name--->
	<cffunction name = "checkQuizName" access = "remote" returnformat = "JSON" returntype = "struct">
		<cfargument name = "name" required = "true" type = "string" >
		<cfargument name = "quizId" required = "false" type = "numeric" default = "0">
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.name EQ ''>
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "You can't leave this empty." />
			<cfreturn local.stStatus>
		<cfelseif !(isValid("regex",name,"^[a-zA-Z0-9 ]{1,30}$" )) >
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "<p>Please enter your valid quiz name: <br/> use (a-z) OR (A-Z) OR (0-9) <br/>between 1 to 30 characters.</p>" />
			<cfreturn local.stStatus>
		<cfelse>
			<cftry>
				<cfquery name = "quizNameCount" >
					SELECT [quiz].[quizId] FROM [quiz]
					WHERE [quiz].[name] = <cfqueryparam value = "#arguments.name#" cfsqltype = "cf_sql_varchar" >
					AND [quiz].[quizId] <> <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
				</cfquery>
				<cfif quizNameCount.RecordCount NEQ 0>
					<cfset local.stStatus.status = "error" />
					<cfset local.stStatus.message = "This quiz name already exists" />
					<cfreturn local.stStatus>
				<cfelse>
					<cfset local.stStatus.status = "success" />
					<cfset local.stStatus.message = "This quiz name is new and will be added once you click DONE" />
					<cfreturn local.stStatus >
				</cfif>
			<cfcatch type = "database">
				<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfset local.stStatus.status = "fail" />
					<cfset local.stStatus.message = "Some unexpected error has occured." />
					<cfreturn local.stStatus>
			</cfcatch>
			<cfcatch type = "any">
				<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cfset local.stStatus.status = "fail" />
					<cfset local.stStatus.message = "Some unexpected error has occured." />
					<cfreturn local.stStatus>
			</cfcatch>
			</cftry>
		</cfif>
	</cffunction>
	<!---checkStartTime : valiadting the start time of a quiz--->
	<cffunction name = "checkStartTime" access = "remote" returnformat = "JSON" returntype = "struct">
		<cfargument name = "startDate" required = "true" type = "any" >
		<cfargument name = "quizId" required = "false" type = "numeric" default = "0">
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.startDate EQ ''>
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "You can't leave this empty." />
			<cfreturn local.stStatus >
		<cfelseif !(isValid("regex",startDate,"^\d{4}\/\d{2}\/\d{2} \d{2}:\d{0,2}$" )) >
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "<p>Please select a valid date time<br/> of pattern 'YYYY/MM/DD HH:MM'</p>" />
			<cfreturn local.stStatus>
		<cfelse>
			<cftry>
				<cfquery name = "quizCount" >
					SELECT [quiz].[quizId] FROM [quiz]
					WHERE ( CONVERT(VARCHAR(8), [quiz].[startDateTime], 1) ) = ( CONVERT(VARCHAR(8), <cfqueryparam value = "#arguments.startDate#" cfsqltype = "cf_sql_date" >, 1))
					AND [quiz].[quizId] <> <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
				</cfquery>
				<cfif quizCount.RecordCount NEQ 0>
					<cfset local.stStatus.status = "error" />
					<cfset local.stStatus.message = "<p>This date is already selected for a quiz.<br/> Please select another date.</p>" />
					<cfreturn local.stStatus >
				<cfelse>
					<cfif now() GTE #arguments.startDate# >
						<cfset local.stStatus.status = "error" />
						<cfset local.stStatus.message = "<p>The date selected is old.<br/>please select a future date.</p>" />
						<cfreturn local.stStatus >
					<cfelse>
						<cfset local.stStatus.status = "success" />
						<cfset local.stStatus.message = "This date is new and will be added once you click DONE" />
						<cfreturn local.stStatus >
					</cfif>
				</cfif>
			<cfcatch type = "database">
				<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfset local.stStatus.status = "fail" />
					<cfset local.stStatus.message = "Some unexpected error has occured. Please try again later." />
					<cfreturn local.stStatus>
			</cfcatch>
			<cfcatch type = "any">
				<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cfset local.stStatus.status = "fail" />
				<cfset local.stStatus.message = "Some unexpected error has occured. Please try again later." />
				<cfreturn local.stStatus>
			</cfcatch>
			</cftry>
		</cfif>
	</cffunction>
	<!---checkEndTime : validating the end time of a quiz--->
	<cffunction name = "checkEndTime" output = "false" access = "public" returntype = "void" >
		<cfargument name = "element" required = "true" type = "string" >
		<cfargument name = "quizId" required = "false" type = "numeric" default = "0">
		<cfif arguments.element EQ ''>
			<cfset variables.errorStruct.elementId.endTime = element>
			<cfset variables.errorStruct.errorId.error_endtime = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---checkQuestionList : to check if any questions was selected for a quiz or not--->
	<cffunction name = "checkQuestionList" output = "false" access = "public" returntype = "void" >
		<cfargument name = "element" required = "true" type = "string">
		<cfif arguments.element EQ ''>
			<cfset variables.errorStruct.elementId.questions = element>
			<cfset variables.errorStruct.errorId.error_questions = "You have to select the questions to set the quiz.">
		</cfif>
	</cffunction>
	<!---insertQuizDetails : insert quiz details--->
	<cffunction name = "insertQuizDetails" access = "remote" output = "false" returntype = "boolean" >
		<cfargument name = "data" required = "true" type = "struct">
		<cfargument name = "id" required = "true" type = "numeric" >
		<cftry>
 			<cftransaction>
				<cfquery>
					INSERT INTO [quiz]
						VALUES (
						<cfqueryparam value = "#data.quizName#" cfsqltype = "cf_sql_varchar" >,
						<cfqueryparam value = "#data.startTime#" cfsqltype = "cf_sql_datetime" >,
						<cfqueryparam value = "#data.startTime#" cfsqltype = "cf_sql_datetime" >,
						<cfqueryparam value = "#id#" cfsqltype = "cf_sql_bigint" >)
				</cfquery>
				<cfquery name = "getQuizId">
					SELECT [quiz].[quizId] FROM [quiz]
						WHERE [name] = <cfqueryparam value = "#data.quizName#" cfsqltype = "cf_sql_varchar" >
				</cfquery>
				<cfif getQuizId.RecordCount EQ 1>
					<cfquery name = "getEndDateTime">
						SELECT [endDateTime] FROM [QUIZ]
							WHERE [name] = <cfqueryparam value = "#data.quizName#" cfsqltype = "cf_sql_varchar" >
					</cfquery>
					<cfquery name = "addEndDateTime" >
						SELECT DATEADD (n, #data.endTime#,'#getEndDateTime.endDateTime#') 'RESULT'
					</cfquery>
					<cfquery>
						UPDATE [quiz]
							SET [endDateTime] = <cfqueryparam value = #addEndDateTime.RESULT# cfsqltype = "cf_sql_datetime" >
							WHERE [quizId] = <cfqueryparam value = "#getQuizId.quizId#" cfsqltype = "cf_sql_bigint">
					</cfquery>
					<cfloop list = "#data.questionId#" delimiters = "," index = "ind">
						<cfquery>
							INSERT INTO [quizQuestion]
								VALUES (
								<cfqueryparam value = "#ind#" cfsqltype = "cf_sql_numeric" >,
								<cfqueryparam value = "#getQuizId.quizId#" cfsqltype = "cf_sql_bigint">)
						</cfquery>
					</cfloop>
				<cfelse >
					<cfreturn false>
				</cfif>
					<cfreturn true>
 			</cftransaction>
 			<cfcatch type = "database">
				<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfreturn false>
			</cfcatch>
			<cfcatch type = "any">
				<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cfreturn false>
			</cfcatch>
 		</cftry>
	</cffunction>
	<!---updateQuiz : used to update the quiz details that is edited by the faculty--->
	<cffunction name = "updateQuiz" access = "remote" returntype = "struct" returnformat = "JSON">
		<cfargument name = "quizId" required = "true" type = "numeric">
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfset validateallfields(arguments.quizId)>
		<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cftry>
				<cftransaction>
					<cfquery name = "addDateTime">
						SELECT DATEADD (n, #url.endTime#,'#url.startTime#') 'RESULT'
					</cfquery>
					<cfquery>
						UPDATE [quiz]
							SET [quiz].[name] = <cfqueryparam value = "#url.quizName#" cfsqltype = "cf_sql_varchar">,
							[quiz].[startDateTime] = <cfqueryparam value = "#url.startTime#" cfsqltype = "cf_sql_datetime">,
							[quiz].[endDateTime] = <cfqueryparam value = "#addDateTime.RESULT#" cfsqltype = "cf_sql_datetime">
							WHERE [quiz].[quizId] = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
							AND [quiz].[userId] = <cfqueryparam value = "#arguments.userId#" cfsqltype = "cf_sql_bigint">
					</cfquery>
					<cfset variables.insertionStruct.successfull = "true">
					<cfset variables.insertionStruct.message = "Quiz has been successfully updated">
					<cfreturn variables.insertionStruct>
				</cftransaction>
				<cfcatch type = "database">
					<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
					<cfset variables.insertionStruct.successfull = "false">
					<cfset variables.insertionStruct.message = "Error occured while insertion of data">
				</cfcatch>
				<cfcatch type = "any">
					<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cfset variables.insertionStruct.successfull = "false">
					<cfset variables.insertionStruct.message = "Error occured while insertion of data">
					<cfreturn variables.insertionStruct>
				</cfcatch>
			</cftry>
		<cfelse>
			<cfreturn variables.errorStruct>
		</cfif>
	</cffunction>
	<!---deleteQuiz : used to delete a future quiz from db--->
	<cffunction name = "deleteQuiz" access = "remote" returntype = "boolean" returnformat = "JSON" output = "false">
		<cfargument name = "quizId" required = "true" type = "numeric">
		<cfargument name = "userId" required = "true" type = "numeric">
			<cftry>
 				<cftransaction>
					<cfquery name = "check">
						SELECT [startDateTime]
							FROM [quiz] WHERE [quiz].[quizId] = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
					</cfquery>
					<cfif check.startDateTime GT now() >
						<cfquery>
							DELETE FROM [quizQuestion]
								WHERE [quizQuestion].[quizId] = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
						</cfquery>
						<cfquery>
							DELETE FROM [quiz]
								WHERE [quiz].[quizId] = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
								AND [quiz].[userId] = <cfqueryparam value = "#arguments.userId#" cfsqltype = "cf_sql_bigint">
						</cfquery>
					 <cfelse>
 						<cfreturn false>
 					</cfif>
 				</cftransaction>
 				<cfcatch type = "database">
					<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
					<cfreturn false>
				</cfcatch>
				<cfcatch type = "any">
					<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cfreturn false>
				</cfcatch>
 			</cftry>
		<cfreturn true>
	</cffunction>
	<!---updateQuizQuestionTable : used to update the quizQuestions table in db which the newly added
		questions for a perticular upcoming quiz--->
	<cffunction name = "updateQuizQuestionTable" access = "remote" returntype = "boolean" returnformat = "JSON">
		<cfargument name = "quizId" required = "true" type = "numeric">
		<cfset questionsList = url.questionId>
			<cftry>
				<cfloop list = "#questionsList#" delimiters = "," index = "ind">
					<cfquery>
						INSERT INTO [quizQuestion]
							VALUES (
							<cfqueryparam value = "#ind#" cfsqltype = "cf_sql_numeric" >,
							<cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">)
					</cfquery>
				</cfloop>
				<cfcatch type = "database">
					<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
					<cfreturn false>
				</cfcatch>
				<cfcatch type = "any">
					<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cfreturn false>
				</cfcatch>
 			</cftry>
			<cfreturn true>
	</cffunction>
</cfcomponent>