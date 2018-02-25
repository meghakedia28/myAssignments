<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cffunction name="checkEditability" access="public" output="false" returntype="boolean">
		<cfargument name="questionId" required="true" type="numeric">
		<cfquery name="availableQuestions">
			SELECT [questionBank].[questionId] FROM [questionBank] JOIN [quizQuestion]
			ON [questionBank].[questionId] = [quizQuestion].[questionId]
			WHERE [quizQuestion].[questionId] = <cfqueryparam value="#arguments.questionId#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfif availableQuestions.RecordCount EQ 0>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>
	<cffunction name="updateQuestion" output="false" returntype="Struct" access="remote" returnformat="JSON">
		<cfargument name="questionId" required="true" type="numeric" >
		<cfset validate = validateAllField()>
		<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cfquery name="update">
					UPDATE [questionBank]
					SET [questionBank].[question] = <cfqueryparam value="#url.question#" cfsqltype="cf_sql_varchar">,
					[questionBank].[option1] = <cfqueryparam value="#url.optiona#" cfsqltype="cf_sql_varchar">,
					[questionBank].[option2] = <cfqueryparam value="#url.optionb#" cfsqltype="cf_sql_varchar">,
					[questionBank].[option3] = <cfqueryparam value="#url.optionc#" cfsqltype="cf_sql_varchar">,
					[questionBank].[option4] = <cfqueryparam value="#url.optiond#" cfsqltype="cf_sql_varchar">,
					[questionBank].[correctAnswer] = <cfqueryparam value="#url.answer#" cfsqltype="cf_sql_varchar">
					WHERE [questionBank].[questionId] = <cfqueryparam value="#arguments.questionId#" cfsqltype="cf_sql_bigint">
				</cfquery>
				<cfset variables.errorStruct.errorId.insert ('update', 'successfull', true) >
			<cfreturn variables.errorStruct>
		<cfelse>
			<cfreturn variables.errorStruct>
		</cfif>
	</cffunction>
	<cffunction name="deleteRecord" output="false" returntype="boolean" returnformat="JSON" access="remote">
		<cfargument name="questionId" required="true" type="numeric">
			<cftry>
				<cfquery name="deleteRow">
					DELETE FROM [questionBank]
		 				 WHERE [questionBank].[questionId] = <cfqueryparam value="#arguments.questionId#" cfsqltype="cf_sql_bigint">
		 		</cfquery>
		 	<cfcatch type="any">
			 	<cfreturn false>
		 	</cfcatch>
		 	</cftry>
		 		<cfreturn true>
	</cffunction>
	<cffunction name="validateAllField" output="false" access="public" returntype="void">
		<cfif StructKeyExists(url,'question')>
			<cfset validate('question', '#url.question#', 'error_question')>
		</cfif>
		<cfif StructKeyExists(url,'optiona')>
			<cfset validate('optionA', '#url.optiona#', 'error_optionA' )>
		</cfif>
		<cfif StructKeyExists(url,'optionb')>
			<cfset validate('optionB', '#url.optionb#', 'error_optionB')>
		</cfif>
		<cfif StructKeyExists(url,'optionc')>
			<cfset validate('optionC', '#url.optionc#', 'error_optionC')>
		</cfif>
		<cfif StructKeyExists(url,'optiond')>
			<cfset validate('optionD', '#url.optiond#', 'error_optionD')>
		</cfif>
		<cfif StructKeyExists(url,'answer')>
			<cfset validate('answer', '#url.answer#', 'error_answer')>
		</cfif>
	</cffunction>
	<cffunction name="insertErrorStruct" output="false" access="public" returntype="void">
		<cfargument name="elementId" required="true" >
		<cfargument name="element" required="true" >
		<cfargument name="errorId" required="true" >
		<cfargument name="error" required="true" >
			<cfset variables.errorStruct.elementId.insert (#arguments.elementId#, #arguments.element#, true) >
			<cfset variables.errorStruct.errorId.insert (#arguments.errorId#, #arguments.error#, true) >
	</cffunction>
	<cffunction name ="validate" output="false" access="public" returntype="void" >
		<cfargument name="elementId" required="true" >
		<cfargument name="element" required="true" >
		<cfargument name="errorId" required="true" >
		<cfif arguments.element EQ ''>
			<cfset insertErrorStruct('#arguments.elementId#', '#arguments.element#', '#arguments.errorId#', "You can't leave this empty.") />
		<cfelseif element.len() LT 1 OR element.len() GT 50>
			<cfset insertErrorStruct('#arguments.elementId#', '#arguments.element#', '#arguments.errorId#', "Please enter characters of length between 1 to 50.") />
		</cfif>
	</cffunction>
	<cffunction name="deleteQuizQuestion" access="remote" returntype="boolean" returnformat="JSON" output="false">
		<cfargument name="questionId" required="true" type="numeric">
		<cfargument name="quizId" required="true" type="numeric">
		<cftry>
			<cfquery name="deleteRow">
				DELETE FROM [quizQuestion]
					WHERE [quizQuestion].[quizId] = <cfqueryparam value="#arguments.quizId#" cfsqltype="cf_sql_bigint">
					AND [quizQuestion].[questionId] = <cfqueryparam value="#arguments.questionId#" cfsqltype="cf_sql_bigint">
			</cfquery>
		<cfcatch type="any">
			<cfreturn false>
		</cfcatch>
		</cftry>
		<cfreturn true>
	</cffunction>
</cfcomponent>