/*----------------------------------------------------------------------------------------------------------
		FileName    : addUserValidationService.cfc
		Created By  : Megha Kedia
		DateCreated : 03-March-2018
		Description : This file does all the validation before a new user is added

------------------------------------------------------------------------------------------------------------*/
component singleton = "true" accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	enterDataService function init(){

		return this;
	}

	function insertData(required struct data, required numeric role){
		try{
			if (structKeyExists(arguments.data,'subject')){
				var queryService = new query();
				local.queryService.addParam(name = "subject",  value = "#trim(data.subject)#",
				cfsqltype = "cf_sql_varchar");
				local.queryService.setSQL("INSERT INTO [subject] (name) VALUES (:subject )");
				local.queryService.execute().getResult();

				var secondQueryService = new query();
				local.secondQueryService.addParam(name = "subject",  value = "#trim(data.subject)#",
				cfsqltype = "cf_sql_varchar");
				local.secondQueryService.setName("getSubjectId");
				local.secondQueryService.setSQL("SELECT [subjectId] FROM [subject] WHERE [name] = :subject");
				getSubjectId = local.secondQueryService.execute().getResult();
			}
			var thirdQueryService = new query();
			local.thirdQueryService.addParam(name = "firstName",  value = "#trim(data.firstName)#",
			cfsqltype = "cf_sql_varchar");
			local.thirdQueryService.addParam(name = "lastName",  value = "#trim(data.lastName)#",
			cfsqltype = "cf_sql_varchar");
			local.thirdQueryService.addParam(name = "email",  value = "#trim(data.email)#",
			cfsqltype = "cf_sql_varchar");
			local.thirdQueryService.addParam(name = "contactNumber",  value = "#trim(data.contactNumber)#",
			cfsqltype = "cf_sql_varchar");
			local.thirdQueryService.addParam(name = "role",  value = "#trim(role)#",
			cfsqltype = "cf_sql_integer");
			local.thirdQueryService.addParam(name = "active",  value = "0",
			cfsqltype = "cf_sql_varchar");
			local.thirdQueryService.setSQL("INSERT INTO [user]
					(firstName,lastName,emailid,contactNumber,roleId,active) VALUES (
					:firstName, :lastName, :email, :contactNumber, :role, :active)");
			local.thirdQueryService.execute().getResult();

			var fourthQueryService = new query();
			local.fourthQueryService.addParam(name = "email",  value = "#trim(data.email)#",
			cfsqltype = "cf_sql_varchar");
			local.fourthQueryService.setName("getUserId");
			local.fourthQueryService.setSQL("SELECT [userId] FROM [user] WHERE [emailid] = :email");
			getUserId = local.fourthQueryService.execute().getResult();

			var code = Hash(GenerateSecretKey("AES"),"SHA-512" );

			var fifthQueryService = new query();
			local.fifthQueryService.addParam(name = "code",  value = "#local.code#",
			cfsqltype = "cf_sql_varchar");
			local.fifthQueryService.addParam(name = "userId",  value = "#getUserId.userId#",
			cfsqltype = "cf_sql_bigint");
			local.fifthQueryService.setSQL("UPDATE [user] SET salt = :code WHERE [userId] = :userId");
			local.fifthQueryService.execute().getResult();

			if (structKeyExists(arguments.data,'subject')){
				var sixthQueryService = new query();
				local.sixthQueryService.addParam(name = "userId",  value = "#getUserId.userId#",
				cfsqltype = "cf_sql_bigint");
				local.sixthQueryService.addParam(name = "subjectId",  value = "#getSubjectId.subjectId#",
				cfsqltype = "cf_sql_bigint");
				local.sixthQueryService.setSQL("INSERT INTO [userSubject]
						(userId,subjectId) VALUES ( :userId, :subjectId)");
				local.sixthQueryService.execute().getResult();
			}
			//mailObject = createObject('component','demoApp/models/common/mailService').sendMails('#data.email#',"#data.firstName#","#code#");
			return true;
		}
		catch (database db){
			writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
			 type = "Error");
			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			return false;
		}
		catch (any e){
			writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
			type = "Error");
			return false;
		}
	}

	/*updateUserData : update user information in db*/
	function updateUserData (required struct data, required numeric id){
		try{
			var queryService = new query();
			local.queryService.addParam (name = "firstName", value = "#arguments.data.firstName#",
			cfsqltype = "cf_sql_varchar");
			local.queryService.addParam (name = "lastName", value = "#arguments.data.lastName#",
		 	cfsqltype = "cf_sql_varchar");
		 	local.queryService.addParam (name = "contactNumber", value = "#arguments.data.contactNumber#",
			cfsqltype = "cf_sql_varchar");
			local.queryService.addParam (name = "id", value = "#arguments.id#",
			cfsqltype = "cf_sql_bigint");
			var sql = "UPDATE [user]
							SET [user].[firstName] = :firstName,
							[user].[lastName] = :lastName,
							[user].[contactNumber] = :contactNumber
							FROM [user]";
			if (structKeyExists(arguments.data,"subject")){
				local.sql &= " JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
									JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]";
			}
			local.sql &= " WHERE [user].[userId] = :id";
			local.queryService.setSQL(sql);
			local.queryService.execute().getResult();
			if (structKeyExists (arguments.data,"subject")){
				var queryService = new query();
				local.queryService.addParam (name = "subject", value = "#arguments.data.subject#",
				 cfsqltype = "cf_sql_varchar");
				local.queryService.addParam (name = "id", value = "#arguments.id#",
				 cfsqltype = "cf_sql_bigint");
				local.queryService.setSQL("UPDATE [subject]
												SET [subject].[name] = :subject
												FROM [user] JOIN [userSubject]
												ON [user].[userId] = [userSubject].[userId]
												JOIN [subject]
												ON [userSubject].[subjectId] = [subject].[subjectId]
												WHERE [user].[userId] = :id");
				local.queryService.execute().getResult();
		 	}
		}
		catch (database db){
			writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
			 type = "Error");
			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			return false;
		}
		catch (any e){
			writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
			 type = "Error");
			return false;
		}
	return true;
	}
}
