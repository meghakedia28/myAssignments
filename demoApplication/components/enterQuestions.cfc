<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<cffunction name="validateAllFields" output="false" access="remote" returntype="struct" returnformat="JSON" >
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
		<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cfset unique = checkunique('#url.optiona#', '#url.optionb#', '#url.optionc#', '#url.optiond#' ) />
			<cfif unique>
				<cfset var insertion = insertQuestions("#url#","#session.stLoggedInUser.userId#")>
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
	<cffunction name ="checkUnique" access="public" returntype="boolean">
		<cfargument name="optiona" required="true" type="string">
		<cfargument name="optionb" required="true" type="string">
		<cfargument name="optionc" required="true" type="string">
		<cfargument name="optiond" required="true" type="string">
		<cfset var error = 0>
		<cfif ((arguments.optiond EQ arguments.optionc) || (arguments.optiond EQ arguments.optionb) || (arguments.optiond EQ arguments.optiona))>
			<cfset insertErrorStruct('optiond', '#arguments.optiond#', 'error_optiond', "This option is already selected. Please enter a different option.") />
			<cfset local.error = 1>
		</cfif>
		<cfif ((arguments.optionc EQ arguments.optionb) || (arguments.optionc EQ arguments.optiona))>
			<cfset insertErrorStruct('optionc', '#arguments.optionc#', 'error_optionc', "This option is already selected. Please enter a different option.") />
			<cfset local.error = 1>
		</cfif>
		<cfif ((arguments.optionb EQ arguments.optiona))>
			<cfset insertErrorStruct('optionb', '#arguments.optionb#', 'error_optionb', "This option is already selected. Please enter a different option.") />
			<cfset local.error = 1>
		</cfif>
		<cfif error EQ 0>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>
</cfcomponent>