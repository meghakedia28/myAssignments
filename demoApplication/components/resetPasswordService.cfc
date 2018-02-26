<!---
NAME : resetPasswordService.cfc
CREATED BY : megha Kedia
USE: use to perform operations for and after password reset , such as:
use to valiadte the new password and conform password and the updating it in db after which session is destroyed--->

<cfcomponent output = "false">
	<cfset variables.errorStruct = {elementId = {}, errorId = {}}>
	<!---validate : use to call for  validation for the password and confirm pasword field
		and then call for destroy the session--->
	<cffunction name = "validate" returntype = "struct" returnformat = "JSON" access = "remote">
		<cfset validPassword(url.password)>
		<cfset checkPassword(url.confirmPassword, url.password)>
			<cfif StructIsEmpty(variables.errorStruct.errorId) >
				<cfset insert = insertPassword(url.password, url.id)>
				<cfif insert>
					<cfset variables.errorStruct.errorId = ''>
					<cfset destroyExistingSession() />
					<cfreturn variables.errorStruct>
				<cfelse>
					<cfset variables.errorStruct.errorId.error_insert = "error occured while insertion of data" >
					<cfreturn variables.errorStruct>
				</cfif>
			<cfelse>
				<cfreturn variables.errorStruct>
			</cfif>
	</cffunction>
	<!---validPassword : validate password--->
	<cffunction name = "validPassword" output = "false" returntype = "void" >
		<cfargument name = "password" required = "true" type = "string">
			<cfset  variables.errorStruct.elementId.password = arguments.password />
			<cfset var checkPassword = arguments.password/>
			<cfif local.checkPassword EQ ''>
				<cfset variables.errorStruct.errorId.error_password = "You can't leave this empty." />
			<cfelseif !(len(local.checkPassword) GTE 8 AND len(local.checkPassword) LTE 30 AND refind('[A-Z]',local.checkPassword) AND refind('[a-z]',local.checkPassword) AND
			 refind('[0-9]',local.checkPassword) AND refind('[!@##$%&*]',local.checkPassword))>
				<cfset variables.errorStruct.errorId.error_password = "<p>Enter a valid password it should contain:<br>One capital letter,<br>One small letter,<br>One special character,<br>One number,and<br>between 8 to 30 characters.<p>" />
			</cfif>
	</cffunction>
	<!---checkPassword : validate confirm Password--->
	<cffunction name = "checkPassword" output = "false" returntype = "void" >
		<cfargument name = "confirmPassword" required = "true" type = "string">
		<cfargument name="password" required="true" type="string">
			<cfset  variables.errorStruct.elementId.confirmPassword = arguments.confirmPassword />
			<cfset var checkconfirmPassword = arguments.confirmPassword>
			<cfif local.checkconfirmPassword EQ '' >
				<cfset variables.errorStruct.errorId.error_confirmpassword = "You can't leave this empty." />
			<cfelseif (arguments.password NEQ local.checkconfirmPassword)>
				<cfset variables.errorStruct.errorId.error_confirmpassword = "Confirm password did not match with the password." />
			</cfif>
	</cffunction>
	<!---insertPassword : update the new password--->
	<cffunction name = "insertPassword" output = "false" returntype = "boolean">
		<cfargument name = "passwords" required = "true" type = "string">
		<cfargument name = "id" required = "true" type = "string">
 			<cftry>
				<cftransaction>
					<cfquery name = "getUserId">
						SELECT [user].[userId] FROM [user]
						WHERE [user].[salt] = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar">
					</cfquery>
					<cfset var code = Hash(GenerateSecretKey("AES"),"SHA-512" )>
					<cfset var password = Hash(arguments.passwords & local.code, "SHA-512") />
					<cfquery name = "updateSaltPassword">
						UPDATE [user]
						SET [user].[salt] = '#code#', hashPassword = '#local.password#', active = 1
						WHERE [user].[userId] = <cfqueryparam value="#getUserId.userId#" cfsqltype="cf_sql_bigint"  >
					</cfquery>
				</cftransaction>
				<cfreturn true>
			<cfcatch type="any">
 				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
	<!---destroyExistingSession : destroy the previous existing sessions--->
	<cffunction name = "destroyExistingSession" output = "false">
		<cfif structKeyExists(session, 'stLoggedInUser') >
			<cfset structdelete(session, 'stLoggedInUser') />
			<cfset sessionInvalidate()/>
		</cfif>
	</cffunction>
</cfcomponent>