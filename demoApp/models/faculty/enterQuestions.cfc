/*----------------------------------------------------------------------------------------------------------
FileName    : enterQuestions.cfc
Created By  : Megha Kedia
DateCreated : 13-March-2018
Description : This file does all the validation before a question is added.

------------------------------------------------------------------------------------------------------------*/

component accessors = "true"{

	// Properties
	errorStruct = {elementId = {},errorId = {}};
	insertionStruct = {successfull = {},message = {}};

	/**
	 * Constructor
	 */
	enterQuestions function init(){

		return this;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : validateAllFields
Description    : validates all fields and then passed the data to insert data into data base,
Arguments      : struct formData.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validateAllFields(required struct formData){
		if (structKeyExists(arguments.formData,"question")){
			validate("question", trim(arguments.formData.question), "error_question");
		}
		if (structKeyExists(arguments.formData,"optiona")){
			validate("optionA", trim(arguments.formData.optiona), "error_optionA" );
		}
		if (structKeyExists(arguments.formData,"optionb")){
			validate("optionB", trim(arguments.formData.optionb), "error_optionB");
		}
		if (structKeyExists(arguments.formData,"optionc")){
			validate("optionC", trim(arguments.formData.optionc), "error_optionC");
		}
		if (structKeyExists(arguments.formData,"optiond")){
			validate("optionD", trim(arguments.formData.optiond), "error_optionD");
		}
		if (structKeyExists(arguments.formData,"answer")){
			validate("answer", trim(arguments.formData.answer), "error_answer");
		}
		try{
			if (structIsEmpty(variables.errorStruct.errorId)){
				local.unique = checkunique(trim(arguments.formData.optiona), trim(arguments.formData.optionb),
								trim(arguments.formData.optionc), trim(arguments.formData.optiond) );
				if (local.unique){
					local.insertion = insertQuestions(arguments.formData,session.stLoggedInUser.userId);
					if (insertion){
						variables.insertionStruct.successfull = "true";
						variables.insertionStruct.message = "Data has been added successfully";
					}
					else{
						variables.insertionStruct.successfull = "false";
						variables.insertionStruct.message = "Error occured while insertion of data1";
					}
				}
			}
		}
		catch (any e){
			application.errorLogService(e);
			variables.insertionStruct.successfull = "false";
			variables.insertionStruct.message = "Error occured while insertion of data2";
		}
		return variables.insertionStruct;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : insertErrorStruct
Description    : inserts error into struct,
Arguments      : string elementId,
				string element,
				string errorId,
				string errorMsg.
Return Type    : none.
------------------------------------------------------------------------------------------------------------*/

	function insertErrorStruct(required string elementId, required string element,
		required string errorId, required string errorMsg){
		variables.errorStruct.elementId.insert (arguments.elementId, arguments.element, true);
		variables.errorStruct.errorId.insert (arguments.errorId, arguments.errorMsg, true);
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : validate
Description    : inserts error into struct,
Arguments      : struct formData.
Return Type    : none
------------------------------------------------------------------------------------------------------------*/

	function validate(required string elementId, required string element,
		required string errorId){
		if (arguments.element == ''){
			insertErrorStruct(arguments.elementId, trim(arguments.element),
				arguments.errorId, "You can't leave this empty.");
		}
		else if (trim(arguments.element).len() < 1 OR trim(arguments.element).len() > 255){
			insertErrorStruct(arguments.elementId, trim(arguments.element),
				arguments.errorId, "Please enter characters of length between 1 to 255.");
		}
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : insertQuestions.
Description    : inserts questions into db.
Arguments      : struct data,
				numeric id
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function insertQuestions(required struct data, required numeric id){
		try{
			local.insertQueryService  = new query();
			local.insertQueryService.addParam(name = "question", value = "#trim(arguments.data.question)#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optiona", value = "#trim(arguments.data.optiona)#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optionb", value = "#trim(arguments.data.optionb)#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optionc", value = "#trim(arguments.data.optionc)#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optiond", value = "#trim(arguments.data.optiond)#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "answer", value = "#trim(arguments.data.answer)#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "id", value = "#arguments.id#",
				cfsqltype = "cf_sql_bigint");
			local.sql = "INSERT INTO [questionBank]
						 VALUES (:question,
						 		 :optiona,
						 		 :optionb,
						 		 :optionc,
						 		 :optiond,
						 		 :answer,
						 		 :id)";
			local.insertQueryService.setSQL(local.sql);
			local.insertQueryService.execute().getResult();
			return true;
		}
		catch(database db){
			application.errorLogService(db,1);
		}
		catch(any e){
			application.errorLogService(e);
		}
		return false;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : checkUnique.
Description    : validates if all the option values are unique or not.
Arguments      : string optiona,
				string optionb,
				string optionc,
				string optiond.
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function checkUnique(required string optiona, required string optionb,
		required string optionc, required string optiond){
		local.error = 0;
		if ((trim(arguments.optiond) == trim(arguments.optionc)) || (trim(arguments.optiond) == trim(arguments.optionb)) ||
			 (trim(arguments.optiond) == trim(arguments.optiona))){
			insertErrorStruct("optiond", trim(arguments.optiond),
				 "error_optiond", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if ((trim(arguments.optionc) == trim(arguments.optionb)) || (trim(arguments.optionc) == trim(arguments.optiona))){
			insertErrorStruct("optionc", trim(arguments.optionc),
				 "error_optionc", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if ((trim(arguments.optionb) == trim(arguments.optiona))){
			insertErrorStruct("optionb", trim(arguments.optionb),
				 "error_optionb", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if (error == 0){
			return true;
		}
		else{
			return false;
		}
	}
}