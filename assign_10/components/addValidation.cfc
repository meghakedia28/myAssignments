<cfcomponent output="true">
	<!---This is used for (validating and then passing values to enter data in database),
	 the user information entered while adding new users as well as for modifing the user information--->
	<cfset variables.errorStruct = {elementId={},errorId={}}>
	<cfset variables.insertionStruct = {successfull={},message={}}>
	<cffunction name="validateFirstName" returnType="void" output="false" access="public" >
		<cfargument name="name" type="string" required="true" >
		<cfset variables.errorStruct.elementId.firstName = name>
		<cfif arguments.name EQ ''>
			<cfset variables.errorStruct.errorId.error_firstname = "You can't leave this empty.">
		<cfelseif (!isValid("regex",name,"^[a-zA-Z]{1,30}"))>
			<cfset variables.errorStruct.errorId.error_firstname = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.">
		</cfif>
	</cffunction>
	<cffunction name="validateLastName" returnType="void" output="false" access="public">
		<cfargument name="name" type="string" required="true" >
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
		<cfset variables.errorStruct.elementId.contactNumber = phoneNumber>
		<cfif (arguments.phoneNumber EQ '')>
			<cfset variables.errorStruct.errorId.error_contactnumber="You can't leave this empty.">
		<cfelseif !((isValid("telephone",phoneNumber)))>
			<cfset variables.errorStruct.errorId.error_contactnumber="Please enter only numbers(0-9) of 10 digits.">
		</cfif>
	</cffunction>
	<!---subject---->
	<cffunction name="validateSubject" access="remote" returnformat="JSON" returntype="struct">
		<cfargument name="name" type="string" required="true" >
		<cfargument name="id" type="numeric" required="false" default="0" >
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
				SELECT [subject].[subjectId] FROM [subject] JOIN [userSubject] ON [subject].[subjectId] = [userSubject].[subjectId]
				JOIN [user] ON [user].[userId] = [userSubject].[userId]
				WHERE [subject].[name] = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" >
				AND [user].[userId] != <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint" >
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
		<cfargument name="id" required="false" default="0" type="numeric" >
		<cfset role = 3>
		<cfif StructKeyExists(URL,'firstName')>
			<cfset validateFirstName(URL.firstName)>
		</cfif>
		<cfif StructKeyExists(URL,'lastName')>
			<cfset validateLastName(URL.lastName)>
		</cfif>
		<cfif StructKeyExists(URL,'email')>
			<cfset var checkEmailStatus = validateEmail(URL.email)>
			<cfset variables.errorStruct.elementId.email = URL.email>
			<cfif local.checkEmailStatus.status EQ "error">
				<cfset variables.errorStruct.errorId.error_email = local.checkEmailStatus.message>
			</cfif>
		</cfif>
		<cfif StructKeyExists(URL,'contactNumber')>
			<cfset validatePhoneNumber(URL.contactNumber)>
		</cfif>
		<cfif StructKeyExists(URL,'subject')>
			<cfset var checkSubjectStatus = validateSubject(URL.subject, arguments.id)>
			<cfset role = 2>
			<cfif local.checkSubjectStatus.status EQ "error">
				<cfset variables.errorStruct.elementId.subject = URL.subject>
				<cfset variables.errorStruct.errorId.error_subject = local.checkSubjectStatus.message>
			</cfif>
		</cfif>
		<cfreturn variables.errorStruct>
	</cffunction>
	<cffunction name="validateInsertController" access="remote" returntype="struct" returnformat="JSON">
		<cfset validateAllFields() />
		<cfif StructIsEmpty(variables.errorStruct.errorId)>
			<cfset insertion = createobject('component','assign_10.components.enterDataService').insertData(URL,role)/>
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
	<cffunction name ="updateUserInformation" access="remote" returntype="Struct" returnformat="JSON">
		<cfquery name="userExists">
			SELECT [userId] FROM [user]
			WHERE [user].[emailid] = <cfqueryparam value="#URL.emailId#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif userExists.RecordCount NEQ 0>
			<cfset validateAllFields(userExists.userId) />
			<cfif StructIsEmpty(variables.errorStruct.errorId)>
				<cfset insertion = updateUserData(URL,userExists.userId) />
				<cfif (insertion) >
					<cfset variables.insertionStruct.successfull = 'true'>
					<cfset variables.insertionStruct.message = 'Data has been updated successfully'>
					<cfreturn variables.insertionStruct>
				<cfelse>
					<cfset variables.insertionStruct.successfull = 'false'>
					<cfset variables.insertionStruct.message = 'Error occured while updation of data'>
					<cfreturn variables.insertionStruct>
				</cfif>
			<cfelse>
				<cfreturn variables.errorStruct>
			</cfif>
		</cfif>
	</cffunction>
	<cffunction name="updateUserData" access="public" returntype="boolean">
		<cfargument name="data" required="true" type="struct" >
		<cfargument name="id" required="true" type="numeric">
			<cfquery name="updateuserDetails">
					UPDATE [user]
						SET [user].[firstName] = <cfqueryparam value="#data.firstName#" cfsqltype="cf_sql_varchar">,
						[user].[lastName] = <cfqueryparam value="#data.lastName#" cfsqltype="cf_sql_varchar">,
						[user].[active] = <cfqueryparam value="#data.active#" cfsqltype="cf_sql_integer">,
						[user].[contactNumber] = <cfqueryparam value="#data.contactNumber#" cfsqltype="cf_sql_varchar">
						FROM [user]
						<cfif structKeyExists(url,'subject')>
							JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
							JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
						</cfif>
						WHERE [user].[userId] = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">
				</cfquery>
				<cfif structKeyExists (data,'subject')>
					<cfquery name="updateSubject">
						UPDATE [subject]
							SET [subject].[name] = <cfqueryparam value="#data.subject#" cfsqltype="cf_sql_varchar">
							FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
							JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
							WHERE [user].[userId] = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">
	 				</cfquery>
	 			</cfif>
		<cfreturn true>
	</cffunction>
</cfcomponent>
