<cfcomponent output="false">
<!---ValidateUser Method--->
	<cffunction name="validateUser" access="public" output="false" returntype="array">
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />

		<cfset var aErrorMessages = ArrayNew(1)/>
		<!---validate email addaress--->
			<cfif ((NOT isValid("Email",arguments.userEmail )) OR (arguments.userEmail EQ ''))>
				<cfset arrayAppend (aErrorMessages,'Please provide a valid email address')>
			</cfif>
		<!---validate password--->
			<cfif arguments.userPassword EQ ''>
				<cfset arrayAppend(aErrorMessages,'Please provide a password')/>
			</cfif>
		<cfreturn aErrorMessages/>
	</cffunction>
<!---doLogin method--->
	<cffunction name="doLogin" access="public" output="true" returntype="boolean">
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type= "string" required="true" />
			
			<cfset var isUserLoggedIn = false/>
				<cfquery name = "getPasswordSalt">
					SELECT userInfo.hashPassword, userInfo.salt
						FROM [registrationForm].[dbo].[userInfo]
						WHERE userInfo.email = <cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar" / >
				</cfquery>
				<cfdump var = #getPasswordSalt#>
			<cfif getPasswordSalt.recordCount EQ 1>
				<cfset variables.password = Hash(arguments.userpassword & getPasswordSalt.salt, "SHA-512") />
					<cfquery name = "loginUser">
						SELECT userInfo.f_name, userInfo.l_name, userInfo.userId, userInfo.email, userInfo.hashPassword, userInfo.role
 							FROM [registrationForm].[dbo].[userInfo]
 							WHERE userInfo.email = <cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar" / > AND 
						 	userInfo.hashPassword = <cfqueryparam value="#variables.password#" cfsqltype="cf_sql_varchar" / > 
							AND userInfo.isActive =<cfqueryparam value= 0 cfsqltype="cf_sql_integer" / > 
 					</cfquery>
 					<cfdump var = #loginUser#>
 				<cfif loginUser.recordCount EQ 1>
					<cflogin applicationtoken="My_Application">
						<cfdump var = 'inside login'>
						<cfloginuser name="#loginUser.f_name# #loginUser.l_name#" password="#loginUser.hashPassword#" roles="#loginUser.role#" >
					</cflogin>
					<cfset session.stLoggedInUser = {'userFirstName' = #loginUser.f_name#, 'userLastName' = #loginUser.l_name#, 'userId' = #loginUser.userId#}>
					<cfdump var = #session.stLoggedInUser#>
					<cfset var isUserLoggedIn = true />
				</cfif>
			</cfif>
			<cfreturn isUserLoggedIn/>
	</cffunction>
<!---doLogOut method--->
	<cffunction name="doLogout" access="public" returntype="void" output="false" >
		<cfset structdelete(session,'stLoggedInUser')/>
		<cflogout />
	</cffunction>

</cfcomponent>