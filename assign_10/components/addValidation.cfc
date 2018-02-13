<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<cffunction name="validateFirstName" returnType="void" output="false" access="public" >
		<cfargument name="name" type="string" required="true" >
		<cfdump var = "2">
		<cfset variables.errorStruct.elementId.firstName = name>
		<cfif arguments.name EQ ''>
			<cfset variables.errorStruct.errorId.error_firstname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_firstname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<cffunction name="validateLastName" returnType="void" output="false" access="public">
		<cfargument name="name" type="string" required="true" >
		<cfdump var = "3">
		<cfset variables.errorStruct.elementId.lastName = name>
		<cfif arguments.name EQ ''>
			<cfset variables.errorStruct.errorId.error_lastname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_lastname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<!---email--->
	<cffunction name="validateEmail" access="remote" returnformat="JSON" returntype="struct" >
		<cfargument name="emailId" type="string" required="true" >
		<cfdump var = "4">
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.emailId EQ ''>
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "You can't leave this empty." />
			<cfreturn var.stStatus>
		<cfelseif !(isValid("eMail", emailId)) >
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn var.stStatus>
		<cfelse>
			<cfquery name="alreadyExists" >
				SELECT [user].[userId] FROM [user]
				WHERE [user].[emailid] = <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar" >
			</cfquery>
			<cfif alreadyExists.recordCount NEQ 0>
				<cfset var.stStatus.status = "error" />
				<cfset var.stStatus.message =  "User already exists" />
				<cfreturn var.stStatus>
			<cfelse>
				<cfset var.stStatus.status = "success" />
					<cfset var.stStatus.message = "Welcome new user" />
					<cfreturn var.stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<!---phone Number--->
	<cffunction name="validatePhoneNumber" output="false" returntype="void" access="public" >
		<cfargument name="phoneNumber" type="string" required="true" >
		<cfdump var = "5">
		<cfset variables.errorStruct.elementId.contactNumber = phoneNumber>
		<cfif (arguments.phoneNumber EQ '')>
			<cfset variables.errorStruct.errorId.error_contactnumber="You can't leave this empty.">
		<cfelseif !((isValid("telephone",phoneNumber)))>
			<cfset variables.errorStruct.errorId.error_contact="Please enter only numbers(0-9) of 10 digits.">
		</cfif>
	</cffunction>
	<!---subject---->
	<cffunction name="validateSubject" access="remote" returnformat="JSON" returntype="struct">
		<cfargument name="name" type="string" required="true" >
		<cfdump var = "6">
		<cfset var stStatus = {status = {} , message = {}} >
		<cfif arguments.name EQ ''>
			<cfset var.stStatus.status = "error" />
			<cfset var.stStatus.message = "You can't leave this empty." />
			<cfreturn var.stStatus>
		<cfelseif (!isValid("regex",name,"^[a-zA-Z ]{1,30}"))>
			<cfset var.stStatus.status = "error" />
		<cfset var.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." />
			<cfreturn var.stStatus>
		<cfelse>
			<cfquery name="subjectCount" >
				SELECT [subject].[subjectId] FROM [subject]
				WHERE [subject].[name] = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" >
			</cfquery>
			<cfif subjectCount.RecordCount NEQ 0>
				<cfset var.stStatus.status = "error" />
				<cfset var.stStatus.message =  "This subject already exists." />
				<cfreturn var.stStatus>
			<cfelse>
					<cfset var.stStatus.status = "success" />
					<cfset var.stStatus.message = "This subject is new and will be added once you click DONE" />
					<cfreturn var.stStatus >
			</cfif>
		</cfif>
	</cffunction>
	<!---validate all fields--->
	<cffunction name="validateAllFields" access="remote" returnformat="JSON" returntype="struct" >
		<cfdump var = "1">
		<cfset var role = 3>
		<cfif StructKeyExists(URL,'firstName')>
			<cfset validateFirstName('#URL.firstName#')>
		</cfif>
		<cfif StructKeyExists(URL,'lastName')>
			<cfset validateLastName('#URL.lastName#')>
		</cfif>
		<cfif StructKeyExists(URL,'email')>
			<cfset var checkEmailStatus = validateEmail('#URL.email#')>
			<cfif local.checkEmailStatus.status EQ "error">
				<cfset variables.errorStruct.elementId.email = #URL.email#>
				<cfset variables.errorStruct.errorId.error_email = local.checkEmailStatus.message>
			</cfif>
		</cfif>
	<cfif StructKeyExists(URL,'contactNumber')>
			<cfset validatePhoneNumber('#URL.contactNumber#')>
		</cfif>
		<cfif StructKeyExists(URL,'subject')>
			<cfset var checkSubjectStatus = validateSubject('#URL.subject#')>
			<cfset var role = 2>
			<cfif local.checkSubjectStatus.status EQ "error">
				<cfset variables.errorStruct.elementId.subject = #URL.subject#>
				<cfset variables.errorStruct.errorId.error_subject = local.checkSubjectStatus.message>
			</cfif>
		</cfif>
		<cfdump var = #variables.errorStruct# abort>
	<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cfset insertion = createobject('component','assign_10.components.enterDataService').insertData('#URL#','#role#')/>
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
</cfcomponent>
