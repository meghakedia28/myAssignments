<cfcomponent output="false">
	<cffunction name="sendMails" access="public" output="false" returntype="void">
		<cfargument name="emailid" required="true" type="string" >
		<cfargument name="firstName" required ="true" type="string" >
		<cfargument name="salt" required="true" type="string">
			<cfmail type="html" from="megha.kedia28@gmail.com" to="#arguments.emailid#" subject="An email sent" port="587" >
   				<p>Hello #arguments.firstName#<br>
   				This email has to send to you, because the admin of the "QUIZ CENTER" has tried to add you.<br>
				Here is the <a href="https://172.16.9.18/assign_10/comman/resetPassword.cfm?id=#arguments.salt#">link</a> to set your password,<br>
				You can change the pasword only once. So, please be careful while you set your password.<br>
				Their is no time limit, you can set the password anytime you want.
				After you are done with reset, you can login from <a href="https://172.16.9.18/assign_10/comman/loginPage.cfm">here</a> .</p><br>
				<p>If you did not make this requested, please ignore the mail.</p><br>
				<p>In case of any query you can reply back. We are happy to help.</p>
			</cfmail>
	</cffunction>
	<cffunction name="forgetPassword" access="public" output="false" returntype="void">
		<cfargument name="emailid" required="true" type="string" >
		<cfargument name="firstName" required ="true" type="string" >
		<cfargument name="salt" required="true" type="string">
		<cfargument name="reset" required="true" type="numeric">
			<cfmail type="html" from="megha.kedia28@gmail.com" to="#arguments.emailid#" subject="An email sent" port="587" >
   				<p>Hello #arguments.firstName#<br>
   				This email has to send to you, because you have requested a password reset, for the  "QUIZ CENTER".<br>
				Here is the <a href="https://172.16.9.18/assign_10/comman/resetPassword.cfm?id=#arguments.salt#&reset=#arguments.reset#">link</a> to reset your password,<br>
				Their is no time limit, you can reset the password anytime you want.
				After you are done with reset, you can login from <a href="https://172.16.9.18/assign_10/comman/loginPage.cfm">here</a> .</p><br>
				<p>If you did not make this requested, please ignore the mail.</p><br>
				<p>In case of any query you can reply back. We are happy to help.</p>
			</cfmail>
	</cffunction>
</cfcomponent>