/*----------------------------------------------------------------------------------------------------------
FileName    : enterDataService.cfc
Created By  : Megha Kedia
DateCreated : 03-March-2018
Description : provides all services related to enter of data in database

------------------------------------------------------------------------------------------------------------*/
component singleton = "true" accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	enterDataService function init(){

		return this;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : insertData
Description    : performance insertion of data into data base,
Arguments      : string data,
				numeric role.
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function insertData(required struct data, required numeric role){
		try{
			transaction{
				if (structKeyExists(arguments.data,'subject')){
					local.insertSubjectService = new query();
					local.insertSubjectService.addParam(name = "subject", value = "#trim(arguments.data.subject)#",
						cfsqltype = "cf_sql_varchar");
					local.insertSubjectService.setSQL("INSERT INTO [subject]
																   (name)
													   VALUES 	   (:subject )");
					local.insertSubjectService.execute().getResult();
					writeDump(1);
					local.getSubjectIdService = new query();
					local.getSubjectIdService.addParam(name = "subject", value = "#trim(arguments.data.subject)#",
						cfsqltype = "cf_sql_varchar");
					local.getSubjectIdService.setName("getSubjectId");
					local.getSubjectIdService.setSQL("SELECT	 [subjectId]
													  FROM 		 [subject]
													  WHERE		 [name] = :subject");
					getSubjectId = local.getSubjectIdService.execute().getResult();
				}
				writeDump(2);
				local.insertUserService = new query();
				local.insertUserService.addParam(name = "firstName", value = "#trim(arguments.data.firstName)#",
					cfsqltype = "cf_sql_varchar");
				local.insertUserService.addParam(name = "lastName", value = "#trim(arguments.data.lastName)#",
					cfsqltype = "cf_sql_varchar");
				local.insertUserService.addParam(name = "email", value = "#trim(arguments.data.email)#",
					cfsqltype = "cf_sql_varchar");
				local.insertUserService.addParam(name = "contactNumber", value = "#arguments.data.contactNumber#",
					cfsqltype = "cf_sql_varchar");
				local.insertUserService.addParam(name = "role", value = "#arguments.role#",
					cfsqltype = "cf_sql_integer");
				local.insertUserService.addParam(name = "active", value = 0,
					cfsqltype = "cf_sql_integer");
				local.insertUserService.setSQL("INSERT INTO [user]
															(firstName,
															lastName,
															emailid,
															contactNumber,
															roleId,
															active)
												 VALUES 	( :firstName,
															  :lastName,
															  :email,
															  :contactNumber,
															  :role,
															  :active)");
				local.insertUserService.execute().getResult();
				writeDump(3);
				local.getUserIdService = new query();
				local.getUserIdService.addParam(name = "email",  value = "#trim(arguments.data.email)#",
					cfsqltype = "cf_sql_varchar");
				local.getUserIdService.setName("getUserId");
				local.getUserIdService.setSQL("SELECT 	[userId]
											   FROM		[user]
											   WHERE	[emailid] = :email");
				getUserId = local.getUserIdService.execute().getResult();

				local.code = hash(generateSecretKey("AES"),"SHA-512" );

				local.updateUserSaltService = new query();
				local.updateUserSaltService.addParam(name = "code",  value = "#local.code#",
					cfsqltype = "cf_sql_varchar");
				local.updateUserSaltService.addParam(name = "userId",  value = "#getUserId.userId#",
					cfsqltype = "cf_sql_bigint");
				local.updateUserSaltService.setSQL("UPDATE [user]
												    SET    salt = :code
												    WHERE [userId] = :userId");
				local.updateUserSaltService.execute().getResult();
				if (structKeyExists(arguments.data,'subject')){
					local.insertUserSubjectService = new query();
					local.insertUserSubjectService.addParam(name = "userId",  value = "#getUserId.userId#",
					cfsqltype = "cf_sql_bigint");
					local.insertUserSubjectService.addParam(name = "subjectId",  value = "#getSubjectId.subjectId#",
					cfsqltype = "cf_sql_bigint");
					local.insertUserSubjectService.setSQL("INSERT INTO [userSubject]
																	   (userId,
																	   subjectId)
														   VALUES 	   (:userId,
														   				:subjectId)");
					local.insertUserSubjectService.execute().getResult();
				}
				local.mailSubject = "Mail to set password";
				local.body = "<p>Hello #arguments.data.firstName#<br>
	   				This email has to send to you, because the admin of the 'QUIZ CENTER' has tried to add you.<br>
					Here is the
					<a href = 'https://172.16.9.18/demoApp/index.cfm/?event=common.resetPassword&id=#local.code#'>
						link</a> to set your password,<br>
					You can change the pasword only once. So, please be careful while you set your password.<br>
					Their is no time limit, you can set the password anytime you want.
					After you are done with it, you can login from
					<a href = 'https://172.16.9.18/demoApp/index.cfm/?event=common.loginPage'>here</a> .</p><br>
					<p>If you did not make this requested, please ignore the mail.</p><br>
					<p>In case of any query you can reply back. We are happy to help.</p>";
				mailObject = createObject("component","demoApp/models/common/mailService");
				mailStatus = mailObject.sendMails(trim(arguments.data.email),
					 application.mailFrom, local.mailSubject, local.body );
				return true;
			}
		}
		catch (database db){
			application.errorLogService(db,1);
		}
		catch (any e){
			application.errorLogService(e);
		}
		return false;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : updateUserData
Description    : update user information in db,
Arguments      : string data,
				numeric id.
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function updateUserData (required struct data, required numeric id){
		try{
			transaction{
				local.updateUserService = new query();
				local.updateUserService.addParam (name = "firstName", value = "#trim(arguments.data.firstName)#",
					cfsqltype = "cf_sql_varchar");
				local.updateUserService.addParam (name = "lastName", value = "#trim(arguments.data.lastName)#",
			 		cfsqltype = "cf_sql_varchar");
			 	local.updateUserService.addParam (name = "contactNumber", value = "#arguments.data.contactNumber#",
					cfsqltype = "cf_sql_varchar");
				local.updateUserService.addParam (name = "id", value = "#arguments.id#",
					cfsqltype = "cf_sql_bigint");
				local.sql = "UPDATE [user]
							 SET    [user].[firstName] 		= :firstName,
								    [user].[lastName] 		= :lastName,
								    [user].[contactNumber]  = :contactNumber
							 FROM   [user]";
				if (structKeyExists(arguments.data,"subject")){
					local.sql &= " JOIN   [userSubject]
								   ON   [user].[userId] 			= [userSubject].[userId]
								   JOIN   [subject]
								   ON   [userSubject].[subjectId]   = [subject].[subjectId]";
				}
				local.sql &= " WHERE [user].[userId] = :id";
				local.updateUserService.setSQL(sql);
				local.updateUserService.execute().getResult();

				if (structKeyExists (arguments.data,"subject")){
					local.updateSubjectService = new query();
					local.updateSubjectService.addParam (name = "subject", value = "#trim(arguments.data.subject)#",
						 cfsqltype = "cf_sql_varchar");
					local.updateSubjectService.addParam (name = "id", value = "#arguments.id#",
					 	cfsqltype = "cf_sql_bigint");
					local.updateSubjectService.setSQL("UPDATE [subject]
													   SET    [subject].[name] 			= :subject
													   FROM   [user]
													   JOIN   [userSubject]
													   ON	  [user].[userId] 			= [userSubject].[userId]
													   JOIN   [subject]
													   ON	  [userSubject].[subjectId] = [subject].[subjectId]
													   WHERE  [user].[userId] 			= :id");
					local.updateSubjectService.execute().getResult();
			 	}
			 	return true;
			}
		}
		catch (database db){
			application.errorLogService(db,1);
		}
		catch (any e){
			application.errorLogService.logError(e,1);
		}
	return false;
	}
}
