/*----------------------------------------------------------------------------------------------------------
FileName    : forgetPasswordService.cfc
Created By  : Megha Kedia
DateCreated : 03-March-2018
Description : does all validation and updation for forget password.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true" {

	// Properties


	/**
	 * Constructor
	 */
	forgetPasswordService function init(){

		return this;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : validateEmail
Description    : validates the email id.
Arguments      : string emailId
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validateEmail(required string emailId){
		local.stStatus = {status = {} , message = {}};
		if (arguments.emailId == ''){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty.";
		}
		else if (!(isValid("eMail", arguments.emailId))){
			local.stStatus.status = "error";
			local.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.";
		}
		try{
			local.userExistsService  = new query();
			local.userExistsService.setName("userExists");
			local.userExistsService.addParam(name = "emailid",value = "#arguments.emailId#",
				cfsqltype = "cf_sql_varchar");
			local.userExistsService.setSQL("SELECT	 [user].[userId]
											FROM  	 [user]
											WHERE  	 [user].[emailid] = :emailid
											AND 	 [user].[active] = 1");
			userExists = local.userExistsService.execute().getResult();
		}
		catch (database db){
			application.errorLogService(db,1);
			local.stStatus.status = "error";
			local.stStatus.message =  "Some unexpected error has occured, Please try again later.";
		}
		catch (any e){
			application.errorLogService(e);
			local.stStatus.status = "error";
			local.stStatus.message =  "Some unexpected error has occured, Please try again later.";
		}
		if (userExists.recordCount != 0){
			local.stStatus.status = "success";
			local.stStatus.message = "User exists";
		}
		else{
			local.stStatus.status = "fail";
			local.stStatus.message = "Your search didn't return any result,
									Please try again with correct information.";
		}
		return local.stStatus;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : validateAndSendMailController
Description    : call vali dation and then updates the data in database
Arguments      : string emailId
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validateAndSendMailController(required string emailId){
		local.validate = validateEmail(arguments.emailId);
		if (local.validate.status == "success"){
			try{
				transaction{
					local.updateReset = new query();
					local.updateReset.addParam(name = "emailid", value = "#arguments.emailId#",
						cfsqltype = "cf_sql_varchar");
					local.updateReset.setSQL("UPDATE	[user]
											  SET 		[user].[reset] = [user].[reset] + 1
											  WHERE		[user].[emailid] = :emailid");
					local.updateReset.execute().getResult();

					local.getUserDetailsService = new query();
					local.getUserDetailsService.setName("getUserDetails");
					local.getUserDetailsService.addParam(name = "emailid", value = "#arguments.emailId#",
						cfsqltype = "cf_sql_varchar");
					local.getUserDetailsService.setSQL("SELECT [user].[salt],
														       [user].[reset],
															   [user].[firstName]
														FROM   [user]
														WHERE  [user].[emailid] = :emailid");
					getUserDetails = local.getUserDetailsService.execute().getResult();

					local.mailSubject = "Mail to reset password";
					local.body = "<p>Hello #getUserDetails.firstName#<br>
		   				We received a request to reset your password for the  'QUIZ CENTER'.<br>
						Here is the
						<a href = 'https://localhost/demoApp/index.cfm/?event=common.resetPassword&id=#getUserDetails.salt#&reset=#getUserDetails.reset#'>
						link</a> to reset your password,<br>
						There is no time limit, you can reset the password anytime you want.
						After you are done with reset, you can login from
						<a href = 'https://localhost/demoApp/index.cfm/?event=common.loginPage'>here</a> .</p><br>
						<p>If you did not request for reset password, please ignore the mail.</p><br>
						<p>In case of any query you can reply back. We are happy to help.</p>";

					mailObject = createObject("component","demoApp/models/common/mailService");
					mailStatus = mailObject.sendMails(mailTo   = arguments.emailId,
						 				  			  mailFrom = application.mailFrom,
						 				 			  subject  = local.mailSubject,
						 				 			  mailBody = local.body );
	 				if (!(mailStatus)){
	 					local.validate.status = "error";
	 					local.validate.message =  "Some unexpected error has occured, Please try again later.";
	 				}
	 			}
			}
			catch (database db){
 					application.errorLogService(db,1);
	 				local.validate.status = "error";
 					local.validate.message =  "Some unexpected error has occured, Please try again later.";
 			}
 			catch (any e){
  					application.errorLogService(e);
	 				local.validate.status = "error";
	 				local.validate.message =  "Some unexpected error has occured, Please try again later.";
	 		}
		}
		return local.validate;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : validateUser
Description    : validates the user if for resetting the user
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validateUser(required struct data){
		local.userSet = getUserInformation(id = arguments.data.id);
		local.dataSet = {};
		if ((userSet.recordCount == 1) AND ((userSet.active == 0)
			 OR ((userSet.active == 1) AND (userSet.reset == arguments.data.reset)))){
			 	local.dataSet.userExists = "true";
				if (userSet.active EQ 0){
					local.dataSet.setting = "true";
				}
				else{
					local.dataSet.resetting = "true";
				}
				local.dataSet.firstName = local.userSet.firstName;
				local.dataSet.lastName = local.userSet.lastName;
				local.dataSet.id = arguments.data.id;
			}
		else{
			local.dataSet.userExists = "false";
		}
		return local.dataSet;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : getUserDetails
Description    : get the details of the user .
Arguments      : string id
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getUserInformation(required string id){
		local.queryService = new query();
		local.queryService.setName("getUser");
		local.queryService.addParam(name = "id", value = "#arguments.id#", cfsqltype = "cf_sql_varchar");
		local.queryService.setSql("SELECT 	[user].[firstName],
										  	[user].[lastName],
										 	[user].[active],
											[user].[reset],
										 	[user].[userId]
									FROM 	[user]
									WHERE 	[user].[salt] = :id");
		getUser = local.queryService.execute().getResult();
		return getUser;
	}
}