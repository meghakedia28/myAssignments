/*----------------------------------------------------------------------------------------------------------
FileName    : resetPasswordService.cfc
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : validates and updates the password after resetting it.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true"{

	// Properties


	/**
	 * Constructor
	 */
	resetPasswordService function init(){

		return this;
	}

	variables.errorStruct = {elementId = {}, errorId = {}};

/*----------------------------------------------------------------------------------------------------------
Function Name  : validate
Description    : use to call for  validation for the password and confirm pasword field
				and then call for destroy the session.
Arguments      : string data
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validate(required struct data){
		try{
			validPassword(arguments.data.password);
			checkPassword(arguments.data.confirmPassword, arguments.data.password);
			if (structIsEmpty(variables.errorStruct.errorId)){
				local.insert = insertPassword(arguments.data.password, arguments.data.id);
				if (insert){
					variables.errorStruct.errorId = '';
					destroyExistingSession();
				}
				else{
					variables.errorStruct.errorId.error_insert = "error occured while insertion of data";
				}
			}
		}
		catch (any e){
			application.errorLogService(e);
			variables.errorStruct.errorId.error_insert = "Some unexpected error has occured. Please try agin later.";
		}
		return variables.errorStruct;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : validPassword
Description    : validate password.
Arguments      : string password
Return Type    : none
------------------------------------------------------------------------------------------------------------*/

	function validPassword(required string password){
		variables.errorStruct.elementId.password = arguments.password;
		local.checkPassword = arguments.password;
		if (local.checkPassword == ''){
			variables.errorStruct.errorId.error_password = "You can't leave this empty.";
		}
		else if (!(len(local.checkPassword) >= 8 AND len(local.checkPassword) <= 30
				AND refind('[A-Z]',local.checkPassword) AND refind('[a-z]',local.checkPassword) AND
		 		refind('[0-9]',local.checkPassword) AND refind('[!@##$%&*]',local.checkPassword))){
			variables.errorStruct.errorId.error_password =
														"<p>Enter a valid password it should contain:<br>
														One capital letter,<br>One small letter,<br>
														One special character,<br>One number,and<br>
														between 8 to 30 characters.<p>";
		}
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : checkPassword
Description    : validate confirm Password.
Arguments      : string confirmPassword,
				string password
Return Type    : none
------------------------------------------------------------------------------------------------------------*/

	function checkPassword(required string confirmPassword, required string password){
		variables.errorStruct.elementId.confirmPassword = arguments.confirmPassword;
		local.checkconfirmPassword = arguments.confirmPassword;
		if (local.checkconfirmPassword == ''){
			variables.errorStruct.errorId.error_confirmpassword = "You can't leave this empty.";
		}
		else if (arguments.password != local.checkconfirmPassword){
			variables.errorStruct.errorId.error_confirmpassword = "Confirm password did not match with the password.";
		}
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : insertPassword
Description    : update the new password.
Arguments      : string passwords,
				string id
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function insertPassword (required string passwords, required string salt){
		try{
			transaction{
				local.getUserIdService = new query();
				local.getUserIdService.setName("getUserId");
				local.getUserIdService.addParam(name = "salt", value = "#arguments.salt#", cfsqltype = "cf_sql_varchar");
				local.getUserIdService.setSQL("SELECT  [user].[userId]
											   FROM    [user]
											   WHERE   [user].[salt] = :salt");
				getUserId = local.getUserIdService.execute().getResult();
				local.code = hash(generateSecretKey("AES"),"SHA-512" );
				local.password = hash(arguments.passwords & local.code, "SHA-512");

				local.updateService = new query();
				local.updateService.addParam(name = "code", value = "#local.code#", cfsqltype = "cf_sql_varchar");
				local.updateService.addParam(name = "password", value = "#local.password#", cfsqltype = "cf_sql_varchar");
				local.updateService.addParam(name = "userId", value = "#getUserId.userId#", cfsqltype = "cf_sql_bigint");
				local.updateService.setSQL(" UPDATE  [user]
											 SET	 [user].[salt] = :code,
													 [user].[hashPassword] = :password,
													 [user].[active] = 1
											 WHERE   [user].[userId] = :userId");
				local.updateService.execute().getResult();
			}
			return true;
		}
		catch (database db){
		  	application.errorLogService(db, 1);
		}
		catch (any e){
			application.errorLogService(e);
		}
		return false;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : destroyExistingSession
Description    : destroy the previous existing sessions.
Arguments      : none
Return Type    : none
------------------------------------------------------------------------------------------------------------*/

	function destroyExistingSession(){
		if (structKeyExists(session, "stLoggedInUser")){
			structdelete(session, "stLoggedInUser");
			sessionInvalidate();
			sessionRotate();
		}
	}
}