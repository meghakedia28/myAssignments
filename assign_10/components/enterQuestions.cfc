<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<cffunction name="validateAllFields" output="false" access="remote" returntype="struct" returnformat="JSON" >
		<cfif StructKeyExists(URL,'question')>
			<cfset validate('question', '#URL.question#', 'error_question')>
		</cfif>
		<cfif StructKeyExists(URL,'optiona')>
			<cfset validate('optionA', '#URL.optiona#', 'error_optionA' )>
		</cfif>
		<cfif StructKeyExists(URL,'optionb')>
			<cfset validate('optionB', '#URL.optionb#', 'error_optionB')>
		</cfif>
		<cfif StructKeyExists(URL,'optionc')>
			<cfset validate('optionC', '#URL.optionc#', 'error_optionC')>
		</cfif>
		<cfif StructKeyExists(URL,'optiond')>
			<cfset validate('optionD', '#URL.optiond#', 'error_optionD')>
		</cfif>
		<cfif StructKeyExists(URL,'answer')>
			<cfset validate('answer', '#URL.answer#', 'error_answer')>
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
	<!---validate--->
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
		<cfelseif element.len() LT 3 OR element.len() GT 50>
			<cfset insertErrorStruct('#arguments.elementId#', '#arguments.element#', '#arguments.errorId#', "Please enter characters of length between 3 to 50.") />
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