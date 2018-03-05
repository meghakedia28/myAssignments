<!---
NAME : authentication.cfc
CREATED BY : megha Kedia
USE : validate the user and do-login and do-logout the user , maintaining the session--->
<cfcomponent>
	<!---validation : for checking the email id and password are correct or not--->
	<cffunction name = "userValidation" returnType = "array" access = "public" >
		<cfargument name = "email" type = "string" required = "true" >
		<cfargument name = "password" type = "string" required = "true" >
		<cfset var aErrorMessage = ArrayNew(1)>
		<!---validate user email id--->
		<cfif ((NOT isValid("Email",arguments.email )) OR arguments.email EQ '')>
			<cfset arrayAppend( aErrorMessage,"Please enter a valid User Id.")>
		</cfif>
		<!---validate user password--->
		<cfif arguments.password EQ ''>
			<cfset arrayAppend (aErrorMessage,"Please enter the password.")>
		</cfif>
		<cfif ArrayisEmpty(aErrorMessage)>
		<cftry>
			<cfquery name = "getPasswordSalt">
				SELECT [user].[salt], [user].[hashPassword] FROM [user]
				WHERE [user].[emailid]  =  <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar" />
			</cfquery>
			<cfif getPasswordSalt.recordCount EQ 1>
				<cfset var passwordHased = Hash(arguments.password & getPasswordSalt.salt,"SHA-512" ) />
				<cfif passwordHased NEQ getPasswordSalt.hashPassword >
					<cfset arrayAppend (aErrorMessage,"The User Id and the Password did not match. Please try again or contact the administrator at : 'megha.kedia28@gmail.com'.")>
				</cfif>
			</cfif>
		<cfcatch type = "any">
			<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset arrayAppend (aErrorMessage,"An error has occured. Please try again later.")>
			<cfreturn aErrorMessage>
		</cfcatch>
		</cftry>
		</cfif>
		<cfreturn aErrorMessage>
	</cffunction> <!---end of function user validation--->
	<!---doLogin : creates the session variables when the user is passes the validations--->
	<cffunction name = "doLogin"  access = "public" output = "false" returnType = "boolean">
		<cfargument name = "email" type = "string" required = "true" >
		<cfargument name = "password" type = "string" required = "true" >
		<cfset var isUserLoggedIn = false/>
		<cftry>
			<cftransaction>
				<cfquery name = "getPasswordSalt">
					SELECT [user].[salt] FROM [user]
					WHERE [user].[emailid] = <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar" />
				</cfquery>
				<cfif getPasswordSalt.recordCount EQ 1>
					<cfset var passwordHased = Hash(arguments.password & getPasswordSalt.salt,"SHA-512" ) />
					<cfquery name = "LoginUser">
						SELECT [user].[firstName], [user].[lastName], [user].[userId], [user].[emailid], [user].[hashPassword],[user].[roleId], [role].[name] as role
							FROM [demoProject].[dbo].[user] JOIN
							[demoProject].[dbo].[role] ON
							[demoProject].[dbo].[user].[roleId] = [demoProject].[dbo].[role].[roleId]
							WHERE [user].[emailid] = <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar" / > AND
					 		[user].[hashPassword] = <cfqueryparam value = "#local.passwordHased#" cfsqltype = "cf_sql_varchar" / >	AND
							[user].[active] = <cfqueryparam value = 1 cfsqltype = "cf_sql_integer" / >
					</cfquery>
					<cfif LoginUser.recordCount EQ 1>
						<cfif structKeyExists(session, "stLoggedInUser") >
							<cfset structdelete(session, "stLoggedInUser") />
						</cfif>
						<cflogin applicationtoken = "demoApplication" >
							<cfloginuser name = "#LoginUser.firstName# #LoginUser.LastName#" password = "#LoginUser.hashPassword#" roles = "#LoginUser.role#" >
						</cflogin>
						<cflock scope = "session" timeout = "30" >
							<cfset sessionRotate() />
							<cfset session.stLoggedInUser = {"userFirstName" = #LoginUser.firstName#, "userLastName" = #LoginUser.LastName#, "userEmailId" = #LoginUser.emailid#,"userId" = #LoginUser.userId#, "roleId" = #LoginUser.roleId#, "userRole" = #LoginUser.role#}>
						<cfset local.isUserLoggedIn = true />
						</cflock>
					</cfif>
				</cfif>
			</cftransaction>
		<cfcatch type = "database">
			<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
			<cfset local.stStatus.status = "error" />
			<cfset local.stStatus.message =  "Some unexpected error has occured, Please try again later." />
			<cfreturn local.stStatus>
		</cfcatch>
		<cfcatch type = "any">
			<cflog file="error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset local.isUserLoggedIn = false />
			<cfreturn local.isUserLoggedIn>
		</cfcatch>
		</cftry>
		<cfreturn local.isUserLoggedIn/>
	</cffunction>
	<!---doLogOut : to clear and invalidate the session when the user logs out --->
	<cffunction name = "doLogOut" access = "public" returntype = "void">
		<cfset structdelete(session,"stLoggedInUser")/>
		<cfset sessionInvalidate()/>
		<cflogout />
	</cffunction>
</cfcomponent>