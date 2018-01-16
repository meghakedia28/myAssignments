<cfcomponent output="false">
	<cfset variables.errorStruct = {elementId={}, errorId={}}>
	<cffunction name="validate" returntype="struct" returnformat="JSON" access="remote">
		<cfset validPassword(#URL.password#)>
		<cfset checkPassword(#URL.confirmPassword#, #URL.password#)>
			<cfif StructIsEmpty(variables.errorStruct.errorId) >
				<cfset insert = insertPassword(#URL.password#, #URL.id#)>
				<cfif insert>
					<cfset variables.errorStruct.errorId = ''>
					<cfreturn variables.errorStruct>
				<cfelse>
					<cfset variables.errorStruct.errorId.error_insert = "error occured while insertion of data" >
					<cfreturn variables.errorStruct>
				</cfif>
			<cfelse>
				<cfreturn variables.errorStruct>
			</cfif>
	</cffunction>
		<!---password--->
	<cffunction name="validPassword" output="false" returntype="void" >
		<cfargument name="password" required="true" type="string">
			<cfset  variables.errorStruct.elementId.password = #arguments.password# />
			<cfset var checkPassword = #arguments.password#/>
			<cfif local.checkPassword EQ ''>
				<cfset variables.errorStruct.errorId.error_password = "You can't leave this empty." />
			<cfelseif !(len(local.checkPassword) GTE 8 AND len(local.checkPassword) LTE 30 AND refind('[A-Z]',local.checkPassword) AND refind('[a-z]',local.checkPassword) AND
			 refind('[0-9]',local.checkPassword) AND refind('[!@##$%&*]',local.checkPassword))>
				<cfset variables.errorStruct.errorId.error_password = "<p>Enter a valid password it should contain:<br>One capital letter,<br>One small letter,<br>One special character,<br>One number,and<br>between 8 to 30 characters.<p>" />
			</cfif>
	</cffunction>
	<!---confirm Password--->
	<cffunction name="checkPassword" output="false" returntype="void" >
		<cfargument name="confirmPassword" required="true" type="string">
		<cfargument name="password" required="true" type="string">
			<cfset  variables.errorStruct.elementId.confirmPassword = #arguments.confirmPassword# />
			<cfset var checkconfirmPassword = #arguments.confirmPassword#>
			<cfif local.checkconfirmPassword EQ '' >
				<cfset variables.errorStruct.errorId.error_confirmpassword = "You can't leave this empty." />
			<cfelseif (#arguments.password# NEQ local.checkconfirmPassword)>
				<cfset variables.errorStruct.errorId.error_confirmpassword = "Confirm password did not match with the password." />
			</cfif>
	</cffunction>
	<!---update password--->
	<cffunction name = "insertPassword" output="false" return type="boolean">
		<cfargument name="passwords" required="true" type="string">
		<cfargument name="id" required="true" type="string">
			<cfset var password = Hash(arguments.passwords & arguments.id, "SHA-512") />
 			<cftry>
				<cftransaction>
	 				<cfquery name ="updatePassword">
	 					UPDATE [user]
						SET hashPassword = '#local.password#', active = 1
	 					WHERE [user].[salt] = '#arguments.id#'
	 				</cfquery>
				</cftransaction>
				<cfreturn true>
			<cfcatch type="any">
 				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>