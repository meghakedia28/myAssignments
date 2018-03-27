/*----------------------------------------------------------------------------------------------------------
							FileName    : authentication.cfc
							Created By  : Megha Kedia
							DateCreated : 03-March-2018
							Description : provides authentication to the valid users.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true" {

	// Properties


	/**
	 * Constructor
	 */
	authentication function init(){

		return this;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : userValidation()
Description    : validates the user credentials.
Arguments      : string email,
				string password.
Return Type    : string
------------------------------------------------------------------------------------------------------------*/

	function userValidation(required string email, required string password){
		var aErrorMessage = ArrayNew(1);
		if ((NOT isValid("Email",arguments.email )) OR arguments.email EQ ''){
			arrayAppend( local.aErrorMessage,"Please enter a valid User Id.");
		}//end of if
		if (arguments.password EQ ''){
			arrayAppend (local.aErrorMessage,"Please enter the password.");
		}//end of if
		if (arrayisEmpty(local.aErrorMessage)){
			try{
				var getPasswordSaltService  = new query();
				local.getPasswordSaltService.setName("getPasswordSalt");
				local.getPasswordSaltService.addParam(name = "emailid",value = "#arguments.email#",
					cfsqltype = "cf_sql_varchar");
				var result = local.getPasswordSaltService.execute(sql = "SELECT [user].[salt],
																			[user].[hashPassword]
																			FROM [user]
																			WHERE [user].[emailid] = :emailid");
				getPasswordSalt = local.result.getResult();
				if (getPasswordSalt.recordCount EQ 1){
					var passwordHased =  hash(arguments.password & getPasswordSalt.salt,"SHA-512" );
					if (local.passwordHased != getPasswordSalt.hashPassword){
						arrayAppend (local.aErrorMessage,"The User Id and the Password did not match.
							Please try again or click forget password to reset your password.");
					}//end of if
				}//end of if
			}//end of try
			catch(database db){
				application.errorLogService.(db,1);
				arrayAppend (local.aErrorMessage,"An error has occured1. Please try again later.");
				return local.aErrorMessage;
			}//end of database catch
			catch(any e){
				application.errorLogService.(e);
				arrayAppend (local.aErrorMessage,"An error has occured2. Please try again later.");
				return local.aErrorMessage;
			}//end of any catch
		}//end of if
		return local.aErrorMessage;
	}//end of userValidation

/*----------------------------------------------------------------------------------------------------------
Function Name  : doLogin()
Description    : does login the user after validation is successfull.
Arguments      : string email,
				string password.
Return Type    : string
------------------------------------------------------------------------------------------------------------*/

	function doLogin(required string email, required string password){
		var isUserLoggedIn = false;
		var getSaltService  = new query();
		local.getSaltService.setName("getSalt");
		local.getSaltService.addParam(name = "emailid",value = "#arguments.email#",
			cfsqltype = "cf_sql_varchar");
		local.getSaltService.setSQL(sql = "SELECT [user].[salt] FROM [user]
				 WHERE [user].[emailid] = :emailid");
		getSalt = local.getSaltService.execute().getResult();

		if (getSalt.recordCount EQ 1){
			var passwordHased = hash(arguments.password & getPasswordSalt.salt,"SHA-512" );
			var loginService = new query();
			local.loginService.setName("loginUser");
			local.loginService.addParam(name = "emailid", value = "#arguments.email#",
				cfsqltype = "cf_sql_varchar");
			local.loginService.addParam(name = "password", value = "#local.passwordHased#",
				cfsqltype = "cf_sql_varchar");
			local.loginService.addParam(name = "active", value = "1",
				cfsqltype = "cf_sql_integer");
			local.loginService.setSQL(sql = "SELECT [user].[firstName], [user].[lastName],
													[user].[userId], [user].[emailid],
													[user].[hashPassword],[user].[roleId],
													[role].[name] as role FROM [user]
													JOIN [role] ON [user].[roleId] = [role].[roleId]
													WHERE [user].[emailid] = :emailid AND
			 										[user].[hashPassword] = :password AND
			 										[user].[active] = :active");
			loginUser = local.loginService.execute().getResult();

			if (loginUser.recordCount EQ 1){
				if (structKeyExists(session, "stLoggedInUser")){
					structdelete(session, "stLoggedInUser");
				} //end of if
				lock scope = "session" timeout = "30" {
					sessionRotate();
					session.stLoggedInUser = { "userFirstName" = #loginUser.firstName#,
												"userLastName" = #loginUser.LastName#,
												"userEmailId" = #loginUser.emailid#,
												"userId" = #loginUser.userId#,
												"roleId" = #loginUser.roleId#,
												"userRole" = #loginUser.role# };
												//end of session.stLoggedInUser
				local.isUserLoggedIn = true;
				}//end of lock
			} //end of if
		} //end of if
		return local.isUserLoggedIn;
	} //end of doLogin
/*----------------------------------------------------------------------------------------------------------
Function Name  : doLogout()
Description    : does session clear for user to successfully logout.
Arguments      : none
Return Type    : none
------------------------------------------------------------------------------------------------------------*/

	function doLogout(){
		structdelete(session,"stLoggedInUser");
		sessionInvalidate();
		sessionRotate();
	}//end of doLogout
}