<cfcomponent output="false" >
	<!---validation--->
	<cffunction name="userValidation" returnType="array" access="public" >
		<cfargument name="email" type="string" required="true" >
		<cfargument name="password" type="string" required="true" >
		<cfset var aErrorMessage = ArrayNew(1)>
		<!---validate user email id--->
		<cfif ((NOT isValid("Email",arguments.email )) OR arguments.email EQ '')>
			<cfset arrayAppend( aErrorMessage,'Please enter a valid User Id.')>
		</cfif>
		<!---validate user password--->
		<cfif arguments.password EQ ''>
			<cfset arrayAppend (aErrorMessage,'Please enter the password.')>
		</cfif>
		<cfif ArrayisEmpty(aErrorMessage)>
			<cfquery name="getPasswordSalt">
				SELECT [user].[salt], [user].[hashPassword] FROM [user]
				WHERE [user].[emailid] = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfif getPasswordSalt.recordCount EQ 1>
				<cfset var passwordHased = Hash(arguments.password & getPasswordSalt.salt,'SHA-512' ) />
				<cfif passwordHased NEQ getPasswordSalt.hashPassword >
					<cfset arrayAppend (aErrorMessage,'The User Id and the Password did not match. Please try again or contact the administrator at : "megha.kedia28@gmail.com".')>
				</cfif>
			</cfif>
		</cfif>
		<cfreturn aErrorMessage>
	</cffunction> <!---end of function user validation--->
	<cffunction name="doLogin"  access="public" output="false" returnType="boolean">
		<cfargument name="email" type="string" required="true" >
		<cfargument name="password" type="string" required="true" >
		<cfset var isUserLoggedIn = false/>
		<cfquery name="getPasswordSalt">
			SELECT [user].[salt] FROM [user]
			WHERE [user].[emailid] = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		<cfif getPasswordSalt.recordCount EQ 1>
			<cfset var passwordHased = Hash(arguments.password & getPasswordSalt.salt,'SHA-512' ) />
			<cfquery name="LoginUser">
				SELECT [user].[firstName], [user].[lastName], [user].[userId], [user].[emailid], [user].[hashPassword],[user].[roleId], [role].[name] as role
					FROM [demoProject].[dbo].[user] JOIN
					[demoProject].[dbo].[role] ON
					[demoProject].[dbo].[user].[roleId] = [demoProject].[dbo].[role].[roleId]
					WHERE [user].[emailid] = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" / > AND
			 		[user].[hashPassword] = <cfqueryparam value="#local.passwordHased#" cfsqltype="cf_sql_varchar" / >	AND
					[user].[active] = <cfqueryparam value= 1 cfsqltype="cf_sql_integer" / >
			</cfquery>
			<cfif LoginUser.recordCount EQ 1>
				<cfif structKeyExists(session, 'stLoggedInUser') >
					<cfset structdelete(session, 'stLoggedInUser') />
				</cfif>
				<cflogin applicationtoken="DemoApplication" >
					<cfloginuser name="#LoginUser.firstName# #LoginUser.LastName#" password="#LoginUser.hashPassword#" roles="#LoginUser.role#" >
				</cflogin>
				<cflock scope="session" timeout="30" >
					<cfset sessionRotate() />
					<cfset session.stLoggedInUser = {'userFirstName' = #LoginUser.firstName#, 'userLastName' = #LoginUser.LastName#, 'userEmailId' = #LoginUser.emailid#,'userId' = #LoginUser.userId#, 'roleId' = #LoginUser.roleId#, 'userRole' = #LoginUser.role#}>
				<cfset var.isUserLoggedIn = true />
				</cflock>
			</cfif>
		</cfif>
		<cfreturn isUserLoggedIn/>
	</cffunction>
	<!---doLogOut method--->
	<cffunction name="doLogOut" access="public" returntype="void">
		<cfset structdelete(session,'stLoggedInUser')/>
		<cfset sessionInvalidate()/>
		<cflogout />
	</cffunction>
</cfcomponent>