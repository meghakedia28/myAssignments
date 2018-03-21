/**
* I am a new Model Object
*/
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

	/**
	* validateAllFields
	*/
	function validateAllFields(formData){
		if (structKeyExists(formData,"question")){
			validate("question", formData.question, "error_question");
		}
		if (structKeyExists(formData,"optiona")){
			validate("optionA", formData.optiona, "error_optionA" );
		}
		if (structKeyExists(formData,"optionb")){
			validate("optionB", formData.optionb, "error_optionB");
		}
		if (structKeyExists(formData,"optionc")){
			validate("optionC", formData.optionc, "error_optionC");
		}
		if (structKeyExists(formData,"optiond")){
			validate("optionD", formData.optiond, "error_optionD");
		}
		if (structKeyExists(formData,"answer")){
			validate("answer", formData.answer, "error_answer");
		}
		try{

			if (structIsEmpty(variables.errorStruct.errorId)){
				var unique = checkunique(formData.optiona, formData.optionb, formData.optionc, formData.optiond );
				if (local.unique){
					var insertion = insertQuestions(formData,session.stLoggedInUser.userId);
					if (insertion){
						variables.insertionStruct.successfull = "true";
						variables.insertionStruct.message = "Data has been added successfully";
						return variables.insertionStruct;
					}//end of if
					else{
						variables.insertionStruct.successfull = "false";
						variables.insertionStruct.message = "Error occured while insertion of data1";
						return variables.insertionStruct;
					}//end of else
				}//end of if
				else{
					return variables.errorStruct;
				}//end of else
			}//end of if
			else{
				return variables.errorStruct;
			}//end of else
		}//end of try
		catch (any e){
			WriteLog( type = "error", file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#");
			variables.insertionStruct.successfull = "false";
			variables.insertionStruct.message = "Error occured while insertion of data2";
			return variables.insertionStruct;
		}//end of catch
	}

	/**
	* insertErrorStruct
	*/
	function insertErrorStruct(elementId, element, errorId, error){
		variables.errorStruct.elementId.insert (arguments.elementId, arguments.element, true);
		variables.errorStruct.errorId.insert (arguments.errorId, arguments.error, true);
	}

	/**
	* validate
	*/
	function validate(elementId, element, errorId){
		if (arguments.element EQ ''){
			insertErrorStruct(arguments.elementId, arguments.element,
				arguments.errorId, "You can't leave this empty.");
		}//end of if
		else if (element.len() LT 1 OR element.len() GT 50){
			insertErrorStruct(arguments.elementId, arguments.element,
				arguments.errorId, "Please enter characters of length between 1 to 50.");
		}//end of elseif
	}

	/**
	* insertQuestions
	*/
	function insertQuestions(data, id){
		try{
			transaction{
				var queryService  = new query();
				local.queryService.addParam(name = "question",value = "#data.question#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "optiona",value = "#data.optiona#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "optionb",value = "#data.optionb#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "optionc",value = "#data.optionc#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "optiond",value = "#data.optiond#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "answer",value = "#data.answer#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "id",value = "#id#",cfsqltype = "cf_sql_bigint");
				var sql = "INSERT INTO [questionBank] VALUES (
					:question, :optiona, :optionb, :optionc, :optiond, :answer, :id)";
				local.queryService.setSQL(local.sql);
				var result = local.queryService.execute().getResult();
				return true;
			}//end of transaction
		}//end of try
		catch(database db){
			WriteLog(type = "error", file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#");
			WriteLog(type = "error", file = "dbErrors", text = "#db.queryError#");
			return false;
		}//end of catch
		catch(any e){
			WriteLog( type = "error", file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#");
			return false;
		}//end of catch
	}///end of insertQuestions

	/**
	* checkUnique
	*/
	function checkUnique(optiona, optionb, optionc, optiond){
		var error = 0;
		if ((arguments.optiond EQ arguments.optionc) OR (arguments.optiond EQ arguments.optionb) OR
			 (arguments.optiond EQ arguments.optiona)){
			insertErrorStruct("optiond", arguments.optiond,
				 "error_optiond", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if ((arguments.optionc EQ arguments.optionb) OR (arguments.optionc EQ arguments.optiona)){
			insertErrorStruct("optionc", arguments.optionc,
				 "error_optionc", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if ((arguments.optionb EQ arguments.optiona)){
			insertErrorStruct("optionb", arguments.optionb,
				 "error_optionb", "This option is already selected. Please enter a different option.");
			local.error = 1;
		}
		if (error EQ 0){
			return true;
		}
		else{
			return false;
		}
	}//end of checkUnique
}