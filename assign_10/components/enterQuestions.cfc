<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<cffunction name="validateAllFields" output="false" access="remote" returntype="struct" returnformat="JSON" >
		<cfif StructKeyExists(URL,'question')>
			<cfset validateQuestion('#URL.question#')>
		</cfif>
		<cfif StructKeyExists(URL,'optiona')>
			<cfset validateOptionA('#URL.optiona#')>
		</cfif>
		<cfif StructKeyExists(URL,'optionb')>
			<cfset validateOptionB('#URL.optionb#')>
		</cfif>
		<cfif StructKeyExists(URL,'optionc')>
			<cfset validateOptionC('#URL.optionc#')>
		</cfif>
		<cfif StructKeyExists(URL,'optiond')>
			<cfset validateOptionD('#URL.optiond#')>
		</cfif>
		<cfif StructKeyExists(URL,'answer')>
			<cfset validateAnswer('#URL.answer#')>
		</cfif>
		<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cfset var insertion = insertQuestions("#URL#","#session.stLoggedInUser.userId#")>
			<cfif (insertion) >
				<cfset variables.insertionStruct.successfull = 'true'>
				<cfset variables.insertionStruct.message = 'Data has been added successfully'>
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
	<!---question--->
	<cffunction name ="validateQuestion" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.question = element>
			<cfset variables.errorStruct.errorId.error_question = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---option A--->
	<cffunction name ="validateOptionA" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.optionA = element>
			<cfset variables.errorStruct.errorId.error_optionA = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---option B--->
	<cffunction name ="validateOptionB" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.optionB = element>
			<cfset variables.errorStruct.errorId.error_optionB = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---option C--->
	<cffunction name ="validateOptionC" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.optionC = element>
			<cfset variables.errorStruct.errorId.error_optionC = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---option D--->
	<cffunction name ="validateOptionD" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.optionD = element>
			<cfset variables.errorStruct.errorId.error_optionD = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---answer--->
	<cffunction name ="validateAnswer" output="false" access="public" returntype="void" >
		<cfargument name="element" required="true" >
		<cfif element EQ ''>
			<cfset variables.errorStruct.elementId.correctAnswer = element>
			<cfset variables.errorStruct.errorId.error_correctAnswer = "You can't leave this empty.">
		</cfif>
	</cffunction>
	<!---insert Questions--->
	<cffunction name="insertQuestions" access="remote" output="false" returntype="boolean" >
		<cfargument name="data" required="true" type="struct" >
		<cfargument name="id" required="true" type="numeric" >
		<cftry>
			<cftransaction>
				<cfquery name="questions">
					INSERT INTO [questionBank]
					VALUES (
					<cfqueryparam value="#data.question#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.optiona#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.optionb#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.optionc#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.optiond#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.answer#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#id#" cfsqltype="cf_sql_bigint" >)
				</cfquery>
				<cfreturn true>
			</cftransaction>
			<cfcatch type="any" >
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>