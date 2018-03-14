/**
* I am a new Model Object
*/
component singleton = "true" accessors = "true" {

	// Properties


	/**
	 * Constructor
	 */
	authentication function init(){

		return this;
	}

	/*FUNCTION NAME: userValidation()
	 *PURPOSE: validate if the user id and password and check if the correct password is entered or not
	 *PARAMETERS: email, password*/

	function userValidation(email, password){
		var aErrorMessage = ArrayNew(1);
		if ((NOT isValid("Email",arguments.email )) OR arguments.email EQ ''){
			arrayAppend( aErrorMessage,"Please enter a valid User Id.");
		}//end of if
		if (arguments.password EQ ''){
			arrayAppend (aErrorMessage,"Please enter the password.");
		}//end of if
		if (ArrayisEmpty(aErrorMessage)){
			try{
				queryService  = new query();
				queryService.setName("getPasswordSalt");
				queryService.addParam(name = "emailid",value = "#arguments.email#",cfsqltype = "cf_sql_varchar");
				result = queryService.execute(sql = "SELECT [user].[salt], [user].[hashPassword] FROM [user]
						 WHERE [user].[emailid] = :emailid");
				getPasswordSalt = result.getResult();
				if (getPasswordSalt.recordCount EQ 1){
					var passwordHased = Hash(arguments.password & getPasswordSalt.salt,"SHA-512" );
					if (passwordHased NEQ getPasswordSalt.hashPassword){
						arrayAppend (aErrorMessage,"The User Id and the Password did not match.
						 Please try again or contact the administrator at : 'megha.kedia28@gmail.com'.");
					}//end of if
				}//end of if
			}//end of try
			catch(database db){
				WriteLog(type = "error", file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#");
				WriteLog(type = "error", file = "dbErrors", text = "#db.queryError#");
				arrayAppend (aErrorMessage,"An error has occured1. Please try again later.");
				return aErrorMessage;
			}//end of database catch
			catch(any e){
				WriteLog( type = "error", file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#");
				arrayAppend (aErrorMessage,"An error has occured2. Please try again later.");
				return aErrorMessage;
			}//end of any catch
		}//end of if
		return aErrorMessage;
	}//end of userValidation

	/*FUNCTION NAME: doLogin()
	 *PURPOSE: do login for the authenticated user, create session variables for them.
	 *PARAMETERS: email, password*/

	function doLogin(email, password){
		var isUserLoggedIn = false;
				queryService  = new query();
				queryService.setName("getSalt");
				queryService.addParam(name = "emailid",value = "#arguments.email#",cfsqltype = "cf_sql_varchar");
				result = queryService.execute(sql = "SELECT [user].[salt] FROM [user]
						 WHERE [user].[emailid] = :emailid");
				getSalt = result.getResult();
				if (getSalt.recordCount EQ 1){
					var passwordHased = Hash(arguments.password & getPasswordSalt.salt,"SHA-512" );
					queryService.setName("loginUser");
					queryService.addParam(name = "password", value = "#local.passwordHased#", cfsqltype = "cf_sql_varchar");
					queryService.addParam(name = "active", value = "1", cfsqltype = "cf_sql_integer");
					result = queryService.execute(sql = "SELECT [user].[firstName], [user].[lastName], [user].[userId], [user].[emailid], [user].[hashPassword],[user].[roleId], [role].[name] as role
							FROM [demoProject].[dbo].[user] JOIN
							[demoProject].[dbo].[role] ON
							[demoProject].[dbo].[user].[roleId] = [demoProject].[dbo].[role].[roleId]
							WHERE [user].[emailid] = :emailid AND
					 		[user].[hashPassword] = :password AND
					 		[user].[active] = :active");
					loginUser = result.getResult();
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
								"userRole" = #loginUser.role# }; //end of session.stLoggedInUser
						local.isUserLoggedIn = true;
						}//end of lock
					} //end of if
				} //end of if
		return local.isUserLoggedIn;
	} //end of doLogin

	/*FUNCTION NAME: doLogout()
	 *PURPOSE: do logout for the user, clear session variables which contained the user informations.
	 *PARAMETERS: email, password*/
	function doLogout(){
		structdelete(session,"stLoggedInUser");
		sessionInvalidate();
		sessionRotate();
	}//end of doLogout
}