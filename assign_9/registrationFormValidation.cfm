<cfparam name="form.submitted" default="0" />
<cfparam name="form.gender" default="Female"/>
<cfparam name="form.currentCountry" default="" />
<cfparam name="form.currentState" default="" />
<cfparam name="form.answer" default="" />
<cfparam name="form.alt_contact" default=""/>
<cfset errorStruct = {struct1={}, struct2={}}>
<cfif structKeyExists(form,'submit')>
	<cfset errorStruct.struct1.gender = "#form.gender#">
	<cfset errorStruct.struct1.captchaAnswer = "#form.captchaAnswer#">
			<cfset name1 = #validFirstName()#/>
			<cfset name2 = #validLastName()#/>
			<cfset email = #validEmail()#/>
			<cfset password = #validPassword()#/>
			<cfset passwordCheck = #checkPassword()#/>
			<cfset phoneNumber = #validatePhoneNumber()#/>
			<cfset alternateNumber = #checkAlternateNumber()#/>
			<cfset country = #checkCountry()#/>
			<cfset state = #checkState()#/>
			<cfset city = #checkCity()#/>
			<cfset address = #checkAddress()#/>
			<cfset checkCaptcha = #checkCaptcha()#/>
<cfelse>
	<cflocation url = "https://localhost/assign_9/registrationFormUsingJQuery.cfm?restartapp">
</cfif>
<cffunction name = "validFirstName" output="false" access="public" returntype="boolean">
	<cfset var flag=0>
	<cfset name=#form.f_name#/>
	<cfset length = #len(name)#/>
	<cfif #name# EQ ''>
			<cfset errorStruct.struct1.f_name='#form.f_name#'>
			<cfset errorStruct.struct2.error_f_name="please enter the first name">
			<cfset flag=1>
	<cfelseif #length# GTE 31>
			<cfset errorStruct.struct1.f_name='#form.f_name#'>
			<cfset errorStruct.struct2.error_f_name="Length of the input should be less than 30">
			<cfset flag=1>
	<cfelse>
		<cfloop index="i" from="1" to="#length#">
			<cfif !((#name.charAt(i-1)# GTE 'a' AND #name.charAt(i-1)# LTE 'z') OR
				 (#name.charAT(i-1)# GTE 'A' AND #name.charAt(i-1)# LTE 'Z')) >
				<cfset errorStruct.struct1.f_name='#form.f_name#'>
				<cfset errorStruct.struct2.error_f_name="please enter the valid first name between A-Z or a-z only.">
				<cfset flag=1>
				<cfbreak>
			</cfif>
		</cfloop>
	</cfif>
	<cfif flag EQ 0>
				<cfreturn true>
	<cfelse>
				<cfreturn false>
	</cfif>
</cffunction>
<cffunction name = "validLastName" output="false" access="public" returntype="boolean">
	<cfset var flag=0>
	<cfset name=#form.l_name#/>
	<cfset length = #len(name)#/>
	<cfif #name# EQ ''>
			<cfset errorStruct.struct1.l_name='#form.l_name#'>
			<cfset errorStruct.struct2.error_l_name="please enter the last name">
			<cfset flag=1>
	<cfelseif #length# GTE 31>
			<cfset errorStruct.struct1.l_name='#form.l_name#'>
			<cfset errorStruct.struct2.error_l_name="Length of the input should be less than 30">
			<cfset flag=1>
	<cfelse>
		<cfloop index="i" from="1" to="#length#">
			<cfif !((#name.charAt(i-1)# GTE 'a' AND #name.charAt(i-1)# LTE 'z') OR
				 (#name.charAT(i-1)# GTE 'A' AND #name.charAt(i-1)# LTE 'Z')) >
				<cfset errorStruct.struct1.l_name='#form.l_name#'>
				<cfset errorStruct.struct2.error_l_name="please enter the valid last name between A-Z or a-z only.">
				<cfset flag=1>
				<cfbreak>
			</cfif>
		</cfloop>
	</cfif>
	<cfif flag EQ 0>
				<cfreturn true>
	<cfelse>
				<cfreturn false>
	</cfif>
</cffunction>
<!---email--->
<cffunction name="validEmail" output="false" returntype="boolean" >
	<cfset var emailID=#form.email#/>
	<cfif !(isValid("eMail", emailID)) >
		<cfset errorStruct.struct1.email='#form.email#'>
		<cfset errorStruct.struct2.error_email="Please enter the valid email address">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---password--->
<cffunction name="validPassword" output="false" returntype="boolean" >
	<cfset var password = #form.password#/>
	<cfif password EQ ''>
		<cfset errorStruct.struct1.password='#form.password#'>
		<cfset errorStruct.struct2.error_password="You can't leave this field empty.">
		<cfreturn false>
	<cfelseif !(len(password) GTE 8 AND len(password) LTE 30 AND refind('[A-Z]',password) AND refind('[a-z]',password) AND
	 refind('[0-9]',password) AND refind('[!@##$&*]',password))>
		<cfset errorStruct.struct1.password='#form.password#'>
		<cfset errorStruct.struct2.error_password="Enter a valid password it should contain:<br>One capital letter,<br>One small letter,<br>One special character,<br>One number,and<br>between 8 to 30 characters.">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---confirm Password--->
<cffunction name="checkPassword" output="false" returntype="boolean" >
	<cfset confirmPassword = #form.c_password#>
	<cfif !((confirmPassword NEQ '') AND (#form.password# EQ confirmpassword))>
		<cfset errorStruct.struct1.c_password='#form.c_password#'>
		<cfset errorStruct.struct2.error_c_password="Please enter the comfirm password same as the password">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---phone Number--->
<cffunction name="validatePhoneNumber" output="false" returntype="boolean" >
	<cfset phoneNumber = #form.contact#>
	<cfif (phoneNumber EQ '')>
		<cfset errorStruct.struct1.contact='#form.contact#'>
		<cfset errorStruct.struct2.error_contact="You can't leave this field empty.">
		<cfreturn false>
	<cfelseif !((isValid("telephone",phoneNumber)))>
		<cfset errorStruct.struct1.contact='#form.contact#'>
		<cfset errorStruct.struct2.error_contact="Please enter the valid Contact number">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---check alternate phone number --->
<cffunction name="checkAlternateNumber" output="false" returntype="boolean" >
	<cfset alternateNumber = #form.alt_contact#>
	<cfif ((alternateNumber NEQ '') AND (#form.contact# EQ alternateNumber))>
		<cfset errorStruct.struct1.alt_contact='#form.alt_contact#'>
		<cfset errorStruct.struct2.error_alt_contact="Alternate Contact number should be different from the Contact number">
		<cfreturn false>
	<cfelseif (alternateNumber NEQ '')>
		<cfif !(isValid("telephone",alternateNumber )) >
			<cfset errorStruct.struct1.alt_contact='#form.alt_contact#'>
			<cfset errorStruct.struct2.error_alt_contact="Please enter only numbers(0-9) of 10 digits.">
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---country--->
<cffunction name="checkCountry" output="false" returntype="boolean" >
	<cfset country = #form.currentCountry#>
	<cfif (country EQ '')>
		<cfset errorStruct.struct1.currentCountry='#form.currentCountry#'>
		<cfset errorStruct.struct2.error_currentCountry="You can't leave this field empty.">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---state--->
<cffunction name="checkState" output="false" returntype="boolean" >
	<cfset state = #form.currentState#>
	<cfif (state EQ '')>
		<cfset errorStruct.struct1.currentState='#form.currentCountry#'>
		<cfset errorStruct.struct2.error_currentState="You can't leave this field empty.">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---city--->
<cffunction name="checkCity" output="false" returntype="boolean" >

	<cfset city = #form.currentCity#>
	<cfif !((isValid("regex",city,"^[a-zA-Z ]{1,30}$" )) AND (city NEQ ''))>
		<cfset errorStruct.struct1.currentCity = '#form.currentCity#'>
		<cfset errorStruct.struct2.error_currentCity = "Please enter your valid current city: use (a-z) OR (A-Z) between 1 to 30 characters.">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---address--->
<cffunction name="checkAddress" output="false" returntype="boolean" >
	<cfset address = #form.currentAddress#>
	<cfif !((isValid("regular_expression",address,"^[a-zA-Z0-9\s,'-\/]*$")) AND (address NEQ ''))>
		<cfset errorStruct.struct1.currentAddress = '#form.currentAddress#'>
		<cfset errorStruct.struct2.error_currentAddress = "Please enter a valid current address name, you can use (a-z),(A-Z),(0-9)or ('-,/,\').">
		<cfreturn false>
	<cfelse>
		<cfreturn true>
	</cfif>
</cffunction>
<!---captcha check--->
<cffunction name="checkCaptcha" output="false" returntype="boolean" >

	<cfset result= #form.captchaAnswer#	>
	<cfset userAnswer= #form.answer#>
	<cfif userAnswer EQ ''>
		<cfset errorStruct.struct1.answer = '#form.answer#'>
		<cfset errorStruct.struct2.error_answer = "Please enter the captcha above.">
		<cfreturn false>
	<cfelseif userAnswer NEQ result>
		<cfset errorStruct.struct1.answer = '#form.answer#'>
		<cfset errorStruct.struct2.error_answer = "wrong Captcha entered! Try again!">
		<cfreturn false>
	</cfif>
		<cfreturn true>
</cffunction>
<!---My check--->
<cfif structIsEmpty(errorStruct.struct2) EQ "NO">
	<cfset session.structOfError = #errorStruct#>
	<cflocation url = "https://localhost/assign_9/registrationFormUsingJQuery.cfm">
<cfelse>
		<cfset structdelete(session,'structOfError')/>
		<!---check if the user is registred--->
			<cfquery name="checkRegistered" >
				SELECT * FROM [dbo].[userInfo]
				WHERE userInfo.email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" />
			</cfquery>
		<cfif checkRegistered.RecordCount EQ 0>
			<!---insert in db--->
			<cfoutput>#insertData()#</cfoutput>
		<cfelse>
			<cflocation url = "https://localhost/assign_9/registrationSuccessfull.cfm?registered">
		</cfif>
</cfif>
<!---insert data--->
<cffunction name = "insertData" output="false" returntype="void" >
		<cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
		<cfset variables.hashPassword = Hash(form.password & variables.salt, "SHA-512") />
		<cftry >
			<cfquery name="insertQuery"  >
			INSERT into [registrationForm].[dbo].[userInfo]
			values (
				<cfqueryparam value='#form.f_name#' cfsqltype="cf_sql_varchar"  > ,
				<cfqueryparam value='#form.l_name#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.email#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#variables.hashPassword#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#variables.salt#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.gender#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.contact#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.alt_contact#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.currentCountry#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.currentState#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.currentCity#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='#form.currentAddress#' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value='user' cfsqltype="cf_sql_varchar"  >,
				<cfqueryparam value=0 cfsqltype="cf_sql_int"  >);
			</cfquery>
		<cfcatch type="any" >
			<cflog file="database" type="information" application="true" text="Insert issue in database " >
		</cfcatch>
		</cftry>
		<cflocation url = "https://localhost/assign_9/registrationSuccessfull.cfm?confirmed">
</cffunction>