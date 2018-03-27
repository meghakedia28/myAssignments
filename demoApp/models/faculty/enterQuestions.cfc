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
			validate("question", arguments.formData.question, "error_question");
		}
		if (structKeyExists(arguments.formData,"optiona")){
			validate("optionA", arguments.formData.optiona, "error_optionA" );
		}
		if (structKeyExists(arguments.formData,"optionb")){
			validate("optionB", arguments.formData.optionb, "error_optionB");
		}
		if (structKeyExists(arguments.formData,"optionc")){
			validate("optionC", arguments.formData.optionc, "error_optionC");
		}
		if (structKeyExists(arguments.formData,"optiond")){
			validate("optionD", arguments.formData.optiond, "error_optionD");
		}
		if (structKeyExists(arguments.formData,"answer")){
			validate("answer", arguments.formData.answer, "error_answer");
		}
		try{
			if (structIsEmpty(variables.errorStruct.errorId)){
				var unique = checkunique(arguments.formData.optiona, arguments.formData.optionb,
								arguments.formData.optionc, arguments.formData.optiond );
				if (local.unique){
					var insertion = insertQuestions(arguments.formData,session.stLoggedInUser.userId);
					if (insertion){
						variables.insertionStruct.successfull = "true";
						variables.insertionStruct.message = "Data has been added successfully";
					}//end of if
					else{
						variables.insertionStruct.successfull = "false";
						variables.insertionStruct.message = "Error occured while insertion of data1";
					}//end of else
				return variables.insertionStruct;
				}//end of if
			}//end of if
		return variables.errorStruct;
		}//end of try
		catch (any e){
			application.errorLogService.(e);
			variables.insertionStruct.successfull = "false";
			variables.insertionStruct.message = "Error occured while insertion of data2";
			return variables.insertionStruct;
		}//end of catch
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
			insertErrorStruct(arguments.elementId, arguments.element,
				arguments.errorId, "You can't leave this empty.");
		}//end of if
		else if (element.len() < 1 OR element.len() > 255){
			insertErrorStruct(arguments.elementId, arguments.element,
				arguments.errorId, "Please enter characters of length between 1 to 255.");
		}//end of elseif
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
			var insertQueryService  = new query();
			local.insertQueryService.addParam(name = "question", value = "#arguments.data.question#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optiona", value = "#arguments.data.optiona#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optionb", value = "#arguments.data.optionb#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optionc", value = "#arguments.data.optionc#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "optiond", value = "#arguments.data.optiond#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "answer", value = "#arguments.data.answer#",
				cfsqltype = "cf_sql_varchar");
			local.insertQueryService.addParam(name = "id", value = "#arguments.id#",
				cfsqltype = "cf_sql_bigint");
			var sql = "INSERT INTO [questionBank] VALUES (
							:question, :optiona, :optionb, :optionc, :optiond, :answer, :id)";
			local.insertQueryService.setSQL(local.sql);
			local.insertQueryService.execute().getResult();
			return true;
		}//end of try
		catch(database db){
			application.errorLogService.(db,1);
			return false;
		}//end of catch
		catch(any e){
			application.errorLogService.(e);
			return false;
		}//end of catch
	}///end of insertQuestions

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
		var error = 0;
		if ((arguments.optiond == arguments.optionc) || (arguments.optiond == arguments.optionb) ||
			 (arguments.optiond == arguments.optiona)){
			insertErrorStruct("optiond", arguments.optiond,
				 "error_optiond", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if ((arguments.optionc == arguments.optionb) || (arguments.optionc == arguments.optiona)){
			insertErrorStruct("optionc", arguments.optionc,
				 "error_optionc", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if ((arguments.optionb == arguments.optiona)){
			insertErrorStruct("optionb", arguments.optionb,
				 "error_optionb", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if (error == 0){
			return true;
		}
		else{
			return false;
		}
	}//end of checkUnique
}