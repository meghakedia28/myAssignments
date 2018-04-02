<!---
NAME : addValidation.cfc
CREATED BY : megha Kedia
USE: This is used for validating (and then passing values to enter data in database),
	 the user information entered while adding new users --->

<cfcomponent output = "true">
	<cfset variables.errorStruct = {elementId = {},errorId = {}}>
	<cfset variables.insertionStruct = {successfull = {},message = {}}>
	<!---validateFirstName : validate first name--->
	<cffunction name = "validateFirstName" returnType = "void" output = "false" access = "public" >
		<cfargument name = "name" type = "string" required = "true" >
		<cfset variables.errorStruct.elementId.firstName = arguments.name>
		<cfif arguments.name EQ ''>
			<cfset variables.errorStruct.errorId.error_firstname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_firstname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<!---validateLastName : validate last name--->
	<cffunction name = "validateLastName" returnType = "void" output = "false" access = "public">
		<cfargument name = "name" type = "string" required = "true" >
		<cfset variables.errorStruct.elementId.lastName = arguments.name>
		<cfif arguments.name EQ ''>
			<cfset variables.errorStruct.errorId.error_lastname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_lastname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<!---validateEmail : validate email--->
	<cffunction name = "validateEmail" access = "remote" returnformat = "JSON" returntype = "struct" >
		<cfargument name = "emailId" type = "string" required = "true" >
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.emailId EQ ''>
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "You can't leave this empty." />
			<cfreturn local.stStatus>
		<cfelseif !(isValid("eMail", emailId)) >
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn local.stStatus>
		<cfelse>
			<cftry>
				<cfquery name = "alreadyExists" >
					SELECT [user].[userId] FROM [user]
					WHERE [user].[emailid] = <cfqueryparam value = "#arguments.emailId#" cfsqltype = "cf_sql_varchar" >
				</cfquery>
			<cfcatch type = "database">
				<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfset local.stStatus.status = "error" />
				<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
				<cfreturn local.stStatus>
			</cfcatch>
			<cfcatch type = "any">
				<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cfset local.stStatus.status = "error" />
				<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
				<cfreturn local.stStatus>
			</cfcatch>
			</cftry>
			<cfif alreadyExists.recordCount NEQ 0>
				<cfset local.stStatus.status = "error" />
				<cfset local.stStatus.message =  "User already exists" />
				<cfreturn local.stStatus>
			<cfelse>
				<cfset local.stStatus.status = "success" />
				<cfset local.stStatus.message = "Welcome new user" />
				<cfreturn local.stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<!---validatePhoneNumber : validate phone Number--->
	<cffunction name = "validatePhoneNumber" output = "false" returntype = "void" access = "public" >
		<cfargument name = "phoneNumber" type = "string" required = "true" >
		<cfset variables.errorStruct.elementId.contactNumber = arguments.phoneNumber>
		<cfif (arguments.phoneNumber EQ '')>
			<cfset variables.errorStruct.errorId.error_contactnumber = "You can't leave this empty.">
		<cfelseif !((isValid("telephone",phoneNumber)))>
			<cfset variables.errorStruct.errorId.error_contactnumber = "Please enter only numbers(0-9) of 10 digits.">
		</cfif>
	</cffunction>
	<!---validateSubject : validate subject name---->
	<cffunction name = "validateSubject" access = "remote" returnformat = "JSON" returntype = "struct">
		<cfargument name = "name" type = "string" required = "true" >
		<cfargument name = "id" type = "numeric" required = "false" default = "0" >
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.name EQ ''>
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message = "You can't leave this empty." />
			<cfreturn local.stStatus>
		<cfelseif (!isValid("regex",name,"^[a-zA-Z ]{1,30}"))>
			<cfset local.stStatus.status = "error" />
		<cfset local.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn local.stStatus>
		<cfelse>
			<cftry>
				<cfquery name = "subjectCount" >
					SELECT [subject].[subjectId] FROM [subject] JOIN [userSubject] ON [subject].[subjectId] = [userSubject].[subjectId]
					WHERE [subject].[name] = <cfqueryparam value = "#arguments.name#" cfsqltype = "cf_sql_varchar" >
					AND [userSubject].[userId] != <cfqueryparam value = "#arguments.id#" cfsqltype = "cf_sql_bigint" >
				</cfquery>
			<cfcatch type = "database">
				<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfset local.stStatus.status = "error" />
				<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
				<cfreturn local.stStatus>
			</cfcatch>
			<cfcatch type = "any">
				<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cfset local.stStatus.status = "error" />
				<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
				<cfreturn local.stStatus>
			</cfcatch>
			</cftry>
			<cfif subjectCount.RecordCount NEQ 0>
				<cfset local.stStatus.status = "error" />
				<cfset local.stStatus.message =  "This subject already exists." />
				<cfreturn local.stStatus>
			<cfelse>
					<cfset local.stStatus.status = "success" />
					<cfset local.stStatus.message = "This subject is new and will be added once you click DONE" />
					<cfreturn local.stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<!---validateAllFields : validates all fields--->
	<cffunction name = "validateAllFields" access = "remote" returnformat = "JSON" returntype = "struct" >
		<cfargument name = "id" required = "false" default = "0" type = "numeric" >
		<cfset role = 3>
		<cfif StructKeyExists(url,"firstName")>
			<cfset validateFirstName(trim(url.firstName))>
		</cfif>
		<cfif StructKeyExists(url,"lastName")>
			<cfset validateLastName(trim(url.lastName))>
		</cfif>
		<cfif StructKeyExists(url,"email")>
			<cfset var checkEmailStatus = validateEmail(trim(url.email))>
			<cfset variables.errorStruct.elementId.email = trim(url.email)>
			<cfif local.checkEmailStatus.status EQ "error">
				<cfset variables.errorStruct.errorId.error_email = local.checkEmailStatus.message>
			</cfif>
		</cfif>
		<cfif StructKeyExists(url,"contactNumber")>
			<cfset validatePhoneNumber(trim(url.contactNumber))>
		</cfif>
		<cfif StructKeyExists(url,"subject")>
			<cfset var checkSubjectStatus = validateSubject(trim(url.subject), trim(arguments.id))>
			<cfset role = 2>
			<cfif local.checkSubjectStatus.status EQ "error">
				<cfset variables.errorStruct.elementId.subject = trim(url.subject)>
				<cfset variables.errorStruct.errorId.error_subject = local.checkSubjectStatus.message>
			</cfif>
		</cfif>
		<cfreturn variables.errorStruct>
	</cffunction>
	<!---validateInsertController : controller to validate all and then insert--->
	<cffunction name = "validateInsertController" access = "remote" returntype = "struct" returnformat = "JSON">
		<cftry>
			<cfset validateAllFields() />
			<cfif StructIsEmpty(variables.errorStruct.errorId)>
				<cfset insertion = createObject("component","demoApplication.components.enterDataService").insertData(url,role)/>
				<cfif (insertion) >
					<cfset variables.insertionStruct.successfull = "true">
					<cfset variables.insertionStruct.message = "Data has been added successfully">
					<cfreturn variables.insertionStruct>
				<cfelse>
					<cfset variables.insertionStruct.successfull = "false">
					<cfset variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.">
					<cfreturn variables.insertionStruct>
				</cfif>
			<cfelse>
				<cfreturn variables.errorStruct>
			</cfif>
		<cfcatch type="any">
			<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset variables.insertionStruct.successfull = "false">
			<cfset variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.">
			<cfreturn variables.insertionStruct>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
