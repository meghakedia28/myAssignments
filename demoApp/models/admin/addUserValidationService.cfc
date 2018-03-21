/*----------------------------------------------------------------------------------------------------------
		FileName    : addUserValidationService.cfc
		Created By  : Megha Kedia
		DateCreated : 03-March-2018
		Description : This file does all the validation before a new user is added

------------------------------------------------------------------------------------------------------------*/
component singleton = "true" accessors="true" extends = "enterDataService"{

	// Properties


	/**
	 * Constructor
	 */
	addUserValidationService function init(){

		return this;
	}

	/**
	* validateinsertController
	*/
	variables.errorStruct = {elementId = {},errorId = {}};
	variables.insertionStruct = {successfull = {},message = {}};
	role = 3;
	/*----------------------------------------------------------------------------------
			Function Name: validateInsertController
			Description: first validates all fields then calls for insertion,
						if successfully validated.
			Arguments: struct data
			Return Type: struct
	    ------------------------------------------------------------------------------------*/
	function validateInsertController(required struct data){
		try{
			validateAllFields(data);
			if (structIsEmpty(variables.errorStruct.errorId)){
				var insertion = insertData(data,role);
				if (local.insertion){
					variables.insertionStruct.successfull = "true";
					variables.insertionStruct.message = "Data has been added successfully";
				}
				else{
					variables.insertionStruct.successfull = "false";
					variables.insertionStruct.message = "Some unexpected error has occured,
						Please try again later.";
				}
				return variables.insertionStruct;
			}
			else{
				return variables.errorStruct;
			}
		}
		catch (any e){
			writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#", type = "Error");
			variables.insertionStruct.successfull = "false";
			variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.";
			return variables.insertionStruct;
		}
	}

	/*----------------------------------------------------------------------------------
	    			Function Name: validateAllFields
	    			Description: calls validation for all the fields,
	    			Arguments: struct data,
	    						numeric id.
	    			Return Type: none
	    ------------------------------------------------------------------------------------*/
	function validateAllFields(required struct data, numeric id = 0){
		if (structKeyExists(arguments.data,"firstName")){
			validateName((trim(arguments.data.firstName)), 'firstName', 'error_firstname');
		}
		if (structKeyExists(arguments.data,"lastName")){
			validateName((trim(arguments.data.lastName)), 'lastName', 'error_lastname');
		}
		if (structKeyExists(arguments.data,"email")){
			var checkEmailStatus = validateEmail(trim(arguments.data.email));
			variables.errorStruct.elementId.email = trim(arguments.data.email);
			if ( local.checkEmailStatus.status == "error"){
				variables.errorStruct.errorId.error_email = local.checkEmailStatus.message;
			}
		}
		if ( structKeyExists(arguments.data,"contactNumber")){
			validatePhoneNumber(trim(arguments.data.contactNumber));
		}
		if ( structKeyExists(arguments.data,"subject")){
			var checkSubjectStatus = validateSubject(trim(arguments.data.subject), arguments.id);
			variables.role = 2;
			if ( local.checkSubjectStatus.status == "error"){
				variables.errorStruct.elementId.subject = trim(url.subject);
				variables.errorStruct.errorId.error_subject = local.checkSubjectStatus.message;
			}
		}
	}

		/*----------------------------------------------------------------------------------
	    			Function Name: validateName
	    			Description: validate first name and last name
	    			Arguments: string name
	    			Return Type: none
	    ------------------------------------------------------------------------------------*/
	function validateName(required string name, required string elementId, required string errorId){
		variables.errorStruct.elementId.insert (arguments.elementId, arguments.name, true);
		if (arguments.name == ''){
			variables.errorStruct.errorId.insert (arguments.errorId, "You can't leave this empty.", true);
		}
		else if (!isValid("regex",name,"^[a-zA-Z]{1,30}")){
			var errorMessage = "Please use only letters(a-z) or (A-Z)\n
				between 1 and 30 characters.";
			variables.errorStruct.errorId.insert (arguments.errorId, local.errorMessage, true);
		}
	}

		/*----------------------------------------------------------------------------------
	    			Function Name: validateEmail
	    			Description: validates the email,
	    			Arguments: string emailId
	    			Return Type: struct
	    ------------------------------------------------------------------------------------*/
	function validateEmail(required string emailId){
		var stStatus = {status = {} , message = {}};
		if (arguments.emailId == ''){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty." ;
		}
		else if (NOT(isValid("eMail", emailId))){
			local.stStatus.status = "error";
			local.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." ;
		}
		else{
			try{
				var queryService = new query();
				local.queryService.setName("alreadyExists");
				local.queryService.addParam(name = "emailId", value = "#arguments.emailId#",
				cfsqltype = "cf_sql_varchar");
				local.queryService.setSQL("SELECT [user].[userId] FROM [user]
						WHERE [user].[emailid] = :emailId");
				alreadyExists = local.queryService.execute().getResult();
			}//end of try
			catch (database db){
				writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
				type = "Error");
				writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
				local.stStatus.status = "error" ;
				local.stStatus.message =  "Some unexpected error has occured, Please try again later." ;
				return local.stStatus;
			}
			catch (any e){
				writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#", type = "Error");
				local.stStatus.status = "error" ;
				local.stStatus.message =  "Some unexpected error has occured, Please try again later." ;
				return local.stStatus;
			}
			if (alreadyExists.recordCount != 0){
				local.stStatus.status = "error" ;
				local.stStatus.message =  "User already exists" ;
			}
			else{
				local.stStatus.status = "success" ;
				local.stStatus.message = "Welcome new user" ;
			}//end of else
		}//end of else
		return local.stStatus;
	}//end of function

		/*----------------------------------------------------------------------------------
	    			Function Name: validatePhoneNumber
	    			Description: validates the users phone number,
	    			Arguments: string phoneNumber
	    			Return Type: none
	    ------------------------------------------------------------------------------------*/
	function validatePhoneNumber(required string phoneNumber){
		variables.errorStruct.elementId.contactNumber = arguments.phoneNumber;
		if (arguments.phoneNumber == ''){
			variables.errorStruct.errorId.error_contactnumber = "You can't leave this empty.";
		}
		else if (NOT(isValid("telephone",arguments.phoneNumber))){
			variables.errorStruct.errorId.error_contactnumber = "Please enter only numbers(0-9) of 10 digits.";
		}
	}

		/*----------------------------------------------------------------------------------
	    			Function Name: validateSubject
	    			Description: validates the subject,
	    			Arguments: string name,
	    						numeric id.
	    			Return Type: struct
	    ------------------------------------------------------------------------------------*/
	function validateSubject(required string name, numeric id = 0){
		var stStatus = {status = {} , message = {}};
		if (arguments.name == ''){
			local.stStatus.status = "error" ;
			local.stStatus.message = "You can't leave this empty." ;
		}
		else if (NOT(isValid("regex",arguments.name,"^[a-zA-Z ]{1,30}"))){
			local.stStatus.status = "error" ;
			local.stStatus.message = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters." ;
		}
		else {
			try {
				var queryService = new query();
				local.queryService.setName("subjectCount");
				local.queryService.addParam(name = "quizId", value = "#arguments.id#",
				cfsqltype = "cf_sql_bigint");
				local.queryService.addParam(name = "name", value = "#arguments.name#",
				cfsqltype = "cf_sql_varchar");
				local.queryService.setSQL("SELECT [subject].[subjectId]
					FROM [subject] JOIN [userSubject] ON [subject].[subjectId] = [userSubject].[subjectId]
					WHERE [subject].[name] = :name AND [userSubject].[userId] != :quizId");
				subjectCount = local.queryService.execute().getResult();
 			}
  			catch (database db){
	 			writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
	 			type = "Error" );
	  			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
				local.stStatus.status = "error" ;
				local.stStatus.message =  "Some unexpected error has occured, Please try again later." ;
				return local.stStatus;
			}
			catch (any e){
				writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#", type = "Error");
				local.stStatus.status = "error" ;
				local.stStatus.message =  "Some unexpected error has occured, Please try again later." ;
				return local.stStatus;
			}
			if (subjectCount.recordCount != 0){
				local.stStatus.status = "error" ;
				local.stStatus.message =  "This subject already exists." ;
			}
			else {
				local.stStatus.status = "success" ;
				local.stStatus.message = "This subject is new and will be added once you click DONE" ;
			}
		}
		return local.stStatus;
	}

	function updateUserInformationController (required struct data){
		//try{
			validateAllFields(arguments.data,arguments.data.userId);
			if (structIsEmpty(variables.errorStruct.errorId)){
				var insertion = updateUserData(arguments.data,arguments.data.userId);
				if (insertion){
			 		variables.insertionStruct.successfull = "true";
			 		variables.insertionStruct.message = "Data has been updated successfully";
		 		}
			 	else {
		 			variables.insertionStruct.successfull = "false";
		 			variables.insertionStruct.message = "Error occured while updation of data.";
		 		}
		 		return variables.insertionStruct;
		 	}
		 	else{
		 		return variables.errorStruct;
		 	}
	 	/*}
 		catch (any e){
 			writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
 			 type = "Error");
 			variables.insertionStruct.successfull = "false";
 			variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.";
			return variables.insertionStruct;
		}*/
	}

}