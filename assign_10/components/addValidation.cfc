<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<cffunction name="validateFirstName" returnType="void" output="false" access="public" >
		<cfargument name="name" type="string" required="true" >
		<cfset variables.errorStruct.elementId.firstName = name>
		<cfif name EQ ''>
			<cfset variables.errorStruct.errorId.error_firstname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_firstname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<cffunction name="validateLastName" returnType="void" output="false" access="public">
		<cfargument name="name" type="string" required="true" >
		<cfset variables.errorStruct.elementId.lastName = name>
		<cfif name EQ ''>
			<cfset variables.errorStruct.errorId.error_lastname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_lastname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<!---email--->
	<cffunction name="validateEmail" output="false" returntype="void" access="public" >
		<cfargument name="emailId" type="string" required="true" >
		<cfquery name="alreadyExists" >
			SELECT [user].[userId] FROM [user]
			WHERE [user].[emailid] = <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar" >
		</cfquery>
		<cfset variables.errorStruct.elementId.email = emailId>
		<cfif emailID EQ ''>
			<cfset variables.errorStruct.errorId.error_email = "You can't leave this empty.">
		<cfelseif !(isValid("eMail", emailID)) >
			<cfset variables.errorStruct.errorId.error_email="Please enter the valid email address">
		<cfelseif alreadyExists.recordCount NEQ 0>
			<cfset variables.errorStruct.errorId.error_email="User already exists">
		<cfelseif structKeyExists(variables.errorStruct.errorId, 'error_email')>
			<cfset structdelete(variables.errorStruct.errorId, 'error_email') />
		</cfif>
	</cffunction>
	<!---phone Number--->
	<cffunction name="validatePhoneNumber" output="false" returntype="void" access="public" >
		<cfargument name="phoneNumber" type="string" required="true" >
		<cfset variables.errorStruct.elementId.contactNumber = phoneNumber>
		<cfif (phoneNumber EQ '')>
			<cfset variables.errorStruct.errorId.error_contactnumber="You can't leave this empty.">
		<cfelseif !((isValid("telephone",phoneNumber)))>
			<cfset variables.errorStruct.errorId.error_contact="Please enter only numbers(0-9) of 10 digits.">
		</cfif>
	</cffunction>
	<!---subject---->
	<cffunction name="validateSubject" returnType="void" output="false" access="public">
		<cfargument name="name" type="string" required="true" >
		<cfset variables.errorStruct.elementId.subject = name>
		<cfif name EQ ''>
			<cfset variables.errorStruct.errorId.error_subject = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z ]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_subject = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<!---validate all fields--->
	<cffunction name="validateAllFields" output="false" access="remote" returntype="struct" returnformat="JSON" >
		<cfset var role = 3>
		<cfif StructKeyExists(URL,'firstName')>
			<cfset validateFirstName('#URL.firstName#')>
		</cfif>
		<cfif StructKeyExists(URL,'lastName')>
			<cfset validateLastName('#URL.lastName#')>
		</cfif>
		<cfif StructKeyExists(URL,'email')>
			<cfset validateEmail('#URL.email#')>
		</cfif>
		<cfif StructKeyExists(URL,'contactNumber')>
			<cfset validatePhoneNumber('#URL.contactNumber#')>
		</cfif>
		<cfif StructKeyExists(URL,'subject')>
			<cfset validateSubject('#URL.subject#')>
			<cfset var role = 2>
		</cfif>
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
