<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<!---validate all--->
	<cffunction name="validateAllFields" output="false" access="remote" returntype="struct" returnformat="JSON" > 
		<cfif StructKeyExists(URL,'quizname')>
			<cfset checkName('#URL.quizname#')>
		</cfif>
		<cfif StructKeyExists(URL,'startTime')>
			<cfset checkStartTime('#URL.startTime#')>
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
		<cffunction name ="checkName" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" type="string" >
		<cfif element EQ ''>
				<cfset variables.errorStruct.elementId.quizName = element>
				<cfset variables.errorStruct.errorId.error_quizname = "You can't leave this empty.">	
		</cfif>
	</cffunction>
	<!---starttime--->
	<cffunction name ="checkStartTime" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" type="any" >
		<cfif element EQ ''>
				<cfset variables.errorStruct.elementId.startTime = element>
				<cfset variables.errorStruct.errorId.error_starttime = "You can't leave this empty.">	
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
	
	<!---name--->
	<cffunction name="checkQuizName" access="remote" returnformat="JSON" returntype="string">
		<cfargument name="name" required="true" type="string" >
		<cfquery name="quizNameCount" >
			SELECT [quiz].[quizId] FROM [quiz]
			WHERE [quiz].[name] = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" >
		</cfquery>
		<cfif quizNameCount.RecordCount NEQ 0>
			<cfreturn 'this quiz name already exists'>
		<cfelse>
			<cfreturn 'this name is new and will be added once you click DONE'>
		</cfif>
	</cffunction>
	<!---datecheck--->
	<cffunction name="checkDate" access="remote" returnformat="JSON" returntype="string">
		<cfargument name="startDate" required="true" type="date" >
		<cfquery name="quizNameCount" >
			SELECT [quiz].[quizId] FROM [quiz]
			WHERE ( CONVERT(VARCHAR(8), [quiz].[startDateTime], 1) ) = ( CONVERT(VARCHAR(8), <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date" >, 1))
		</cfquery>
		<cfif quizNameCount.RecordCount NEQ 0>
			<cfreturn 'this date is already selected by other faculty'>
		<cfelse>
			<cfreturn 'this date is new and will be added once you click DONE'>
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
			<cfquery name="insertId">
				SELECT [quiz].[quizId] FROM [quiz]
					WHERE [name] = <cfqueryparam value ="#data.quizName#" cfsqltype="cf_sql_varchar" >
			</cfquery>
			<cfif insertId.RecordCount EQ 1>
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
						WHERE [quizId] = <cfqueryparam value="#insertId.quizId#" cfsqltype="cf_sql_bigint">
				</cfquery>
				<cfloop list="#questionsList#" delimiters="," index="ind">
					<cfquery name="insertQuizQuestion">
						INSERT INTO [quizQuestion]
							VALUES (
							<cfqueryparam value="#ind#" cfsqltype="cf_sql_numeric" >,
							<cfqueryparam value="#insertId.quizId#" cfsqltype="cf_sql_bigint">)
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