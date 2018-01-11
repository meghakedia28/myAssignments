<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<!---validate all--->
	<cffunction name="validateAllFields" output="false" access="remote" returntype="struct" returnformat="JSON" >
		<cfif StructKeyExists(URL,'quizName')>
			<cfset var checkQuizNameStatus = checkQuizName('#URL.quizName#')>
			<cfif local.checkQuizNameStatus.status EQ "error" >
				<cfset variables.errorStruct.elementId.quizName = #URL.quizName# >
				<cfset variables.errorStruct.errorId.error_quizname = local.checkQuizNameStatus.message >
			</cfif>
		</cfif>
		<cfif StructKeyExists(URL,'startTime')>
			<cfset var checkStartTimeStatus = checkStartTime('#URL.startTime#')>
			<cfif local.checkStartTimeStatus.status EQ "error">
				<cfset variables.errorStruct.elementId.startTime = #URL.startTime# >
				<cfset variables.errorStruct.errorId.error_starttime = local.checkStartTimeStatus.message >
			</cfif>
		</cfif>
		<cfif StructKeyExists(URL,'endTime')>
			<cfset checkEndTime('#URL.endTime#')>
		</cfif>
		<cfif StructKeyExists(URL,'questionId')>
			<cfset checkQuestionList('#URL.questionId#')>
		<cfelse>
			<cfset variables.errorStruct.elementId.questionId = '' >
			<cfset variables.errorStruct.errorId.error_questions ='You should select atleast one question to set the quiz'>
		</cfif>
		<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cfset var insertion = setQuiz("#URL#","#session.stLoggedInUser.userId#")>
			<cfif (insertion) >
				<cfset variables.insertionStruct.successfull = 'true'>
				<cfset variables.insertionStruct.message = 'Quiz has been successfully set'>
				<cfreturn variables.insertionStruct>
			<cfelse>
				<cfset variables.insertionStruct.successfull = 'false'>
				<cfset variables.insertionStruct.message = 'Error occured while insertion of data'>
				<cfreturn variables.insertionStruct>
			</cfif>
		<cfelse>
			<cfreturn variables.errorStruct>
		</cfif>
	</cffunction>
	<!---validation--->
	<!---name--->
	<cffunction name="checkQuizName" access="remote" returnformat="JSON" returntype="struct">
		<cfargument name="name" required="true" type="string" >
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.name EQ ''>
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "You can't leave this empty." />
			<cfreturn var.stStatus>
		<cfelseif !(isValid("regex",name,"^[a-zA-Z0-9 ]{1,30}$" )) >
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "Please enter your valid quiz name: use (a-z) OR (A-Z) OR (0-9) between 1 to 30 characters." />
			<cfreturn var.stStatus>
		<cfelse>
			<cfquery name="quizNameCount" >
				SELECT [quiz].[quizId] FROM [quiz]
				WHERE [quiz].[name] = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" >
			</cfquery>
			<cfif quizNameCount.RecordCount NEQ 0>
				<cfset var.stStatus.status = "error" />
				<cfset var.stStatus.message =  "This quiz name already exists" />
				<cfreturn var.stStatus>
			<cfelse>
				<cfset var.stStatus.status = "success" />
				<cfset var.stStatus.message = "This quiz name is new and will be added once you click DONE" />
				<cfreturn var.stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<!---starttime--->
	<cffunction name="checkStartTime" access="remote" returnformat="JSON" returntype="struct">
		<cfargument name="startDate" required="true" type="any" >
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif startDate EQ ''>
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "You can't leave this empty." />
			<cfreturn var.stStatus >
		<cfelseif !(isValid("regex",startDate,"^\d{4}\/\d{2}\/\d{2} \d{2}:\d{0,2}$" )) >
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "Please select a valid date time of pattern 'YYYY/MM/DD HH:MM'" />
			<cfreturn var.stStatus>
		<cfelse>
			<cfquery name="quizNameCount" >
				SELECT [quiz].[quizId] FROM [quiz]
				WHERE ( CONVERT(VARCHAR(8), [quiz].[startDateTime], 1) ) = ( CONVERT(VARCHAR(8), <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date" >, 1))
			</cfquery>
			<cfif quizNameCount.RecordCount NEQ 0>
				<cfset var.stStatus.status = "error" />
				<cfset var.stStatus.message = "This date is already selected by other faculty" />
				<cfreturn var.stStatus >
			<cfelse>
				<cfif now() GTE #arguments.startDate# >
					<cfset var.stStatus.status = "error" />
					<cfset var.stStatus.message = "The date selected is old. please select a future date." />
					<cfreturn var.stStatus >
				<cfelse>
					<cfset var.stStatus.status = "success" />
					<cfset var.stStatus.message = "This date is new and will be added once you click DONE" />
					<cfreturn var.stStatus >
				</cfif>
			</cfif>
		</cfif>
	</cffunction>
	<!---endtime--->
	<cffunction name ="checkEndTime" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" type="string" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.endTime = element>
			<cfset variables.errorStruct.errorId.error_endtime = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<cffunction name="checkQuestionList" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" type="string">
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.questions = element>
			<cfset variables.errorStruct.errorId.error_questions = "You have to select the questions to set the quiz.">
		</cfif>
	</cffunction>
	<!---insert quiz details--->
	<cffunction name="setQuiz" access="remote" output="false" returntype="boolean" >
		<cfargument name="data" required="true" type="struct">
		<cfargument name="id" required="true" type="numeric" >
		<cfset questionsList = #data.questionId#>
		<cftry>
			<cftransaction>
				<cfquery name="insertQuiz">
					INSERT INTO [quiz]
						VALUES (
						<cfqueryparam value="#data.quizName#" cfsqltype="cf_sql_varchar" >,
						<cfqueryparam value="#data.startTime#" cfsqltype="cf_sql_datetime" >,
						<cfqueryparam value="#data.startTime#" cfsqltype="cf_sql_datetime" >,
						<cfqueryparam value="#id#" cfsqltype="cf_sql_bigint" >)
				</cfquery>
				<cfquery name="getQuizId">
					SELECT [quiz].[quizId] FROM [quiz]
						WHERE [name] = <cfqueryparam value ="#data.quizName#" cfsqltype="cf_sql_varchar" >
				</cfquery>
				<cfif getQuizId.RecordCount EQ 1>
					<cfquery name="getEndDateTime">
						SELECT [endDateTime] FROM [QUIZ]
							WHERE [name] = <cfqueryparam value ="#data.quizName#" cfsqltype="cf_sql_varchar" >
					</cfquery>
					<cfquery name="addEndDateTime" >
						select DATEADD (n, #data.endTime#,'#getEndDateTime.endDateTime#') 'RESULT'
					</cfquery>
					<cfquery name="updateEndDateTime">
						UPDATE [quiz]
							SET [endDateTime] = <cfqueryparam value= #addEndDateTime.RESULT# cfsqltype="cf_sql_datetime" >
							WHERE [quizId] = <cfqueryparam value="#getQuizId.quizId#" cfsqltype="cf_sql_bigint">
					</cfquery>
					<cfloop list="#questionsList#" delimiters="," index="ind">
						<cfquery name="insertQuizQuestion">
							INSERT INTO [quizQuestion]
								VALUES (
								<cfqueryparam value="#ind#" cfsqltype="cf_sql_numeric" >,
								<cfqueryparam value="#getQuizId.quizId#" cfsqltype="cf_sql_bigint">)
						</cfquery>
					</cfloop>
				<cfelse >
					<cfreturn false>
				</cfif>
					<cfreturn true>
			</cftransaction>
			<cfcatch type="any" >
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>