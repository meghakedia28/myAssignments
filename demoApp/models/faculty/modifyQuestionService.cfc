/**
* I am a new Model Object
*/
component accessors = "true" extends = "enterQuestions" {
	// Properties

	/**
	 * Constructor
	 */
	modifyQuestionService function init(){

		return this;
	}

	/**
	* checkEditability
	*/
	function checkEditability(required numeric questionId){
		var queryService  = new query();
		local.queryService.setName("editableQuestions");
		local.queryService.addParam(name = "id",value = "#arguments.questionId#",cfsqltype = "cf_sql_bigint");
		var result = local.queryService.execute(sql = "SELECT [questionBank].[questionId]
			FROM [questionBank] JOIN [quizQuestion]
			ON [questionBank].[questionId] = [quizQuestion].[questionId]
			WHERE [quizQuestion].[questionId] = :id");
		editableQuestions = local.result.getResult();
		if (editableQuestions.recordCount EQ 0){
			return true;
		}//end of if
		else{
			return false;
		}//end of else
	}//end of checkEditability
	/**
	* deleteRecord
	*/
	function deleteRecord(required numeric questionId){
		try{
			var queryService  = new query();
			local.queryService.addParam(name = "id",value = "#arguments.questionId#",cfsqltype = "cf_sql_bigint");
			var result = local.queryService.execute(sql = "DELETE FROM [questionBank]
		 				 WHERE [questionBank].[questionId] = :id");
		 	}//end of try
	 	catch (database db){
	 		WriteLog (file = "error", text = "#db.message# #db.detail# #db.ExtendedInfo#", type = "error");
			WriteLog (file = "dbErrors", text = "#db.queryError#", type = "error");
			return false;
	 	}//end of db catch
	 	catch (any e){
		 	WriteLog (file = "error", text = "#db.message# #db.detail# #db.ExtendedInfo#", type = "error");
			return false;
	 	}//end of catch
	 	return true;
	}//end of deleteRecord
	/**
	 * modifyRecord()
	 **/
	function modifyRecord(required struct data){
		//try{
			transaction{
				validateAll(arguments.data);
				if (structIsEmpty(variables.errorStruct.errorId)){
					var unique = checkunique(data.optiona, data.optionb, data.optionc, data.optiond );
					if (local.unique){
						var queryService  = new query();
						local.queryService.setName("result");
						local.queryService.addParam(name = "question",value = "#data.question#",
						cfsqltype = "cf_sql_varchar");
						local.queryService.addParam(name = "optiona",value = "#data.optiona#",
						cfsqltype = "cf_sql_varchar");
						local.queryService.addParam(name = "optionb",value = "#data.optionb#",
						cfsqltype = "cf_sql_varchar");
						local.queryService.addParam(name = "optionc",value = "#data.optionc#",
						cfsqltype = "cf_sql_varchar");
						local.queryService.addParam(name = "optiond",value = "#data.optiond#",
						cfsqltype = "cf_sql_varchar");
						local.queryService.addParam(name = "answer",value = "#data.answer#",
						cfsqltype = "cf_sql_varchar");
						local.queryService.addParam(name = "id",value = "#data.questionId#",
						cfsqltype = "cf_sql_bigint");
						var sql = "UPDATE [questionBank]
								SET [questionBank].[question] = :question,
								[questionBank].[option1] = :optiona, [questionBank].[option2] = :optionb,
								[questionBank].[option3] = :optionc, [questionBank].[option4] = :optiond,
								[questionBank].[correctAnswer] = :answer WHERE [questionBank].[questionId] = :id";
						local.queryService.setSQL(local.sql);
						local.queryService.execute().getResult();
						variables.errorStruct.errorId.insert ("update", "successfull", true);
						return variables.errorStruct;
					}
					else{
						return variables.errorStruct;
					}
				}//end of if
				else{
					return variables.errorStruct;
				}//end of else
			}//end of transaction
		/*}//end of try
		catch (database db){
			WriteLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
					 type = "Error");
			WriteLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			variables.errorStruct.errorId.insert ("update", "fail", true);
			return variables.errorStruct;
		}//end of db catch
		catch (any e){
			WriteLog (file = "dbErrors", text = "#e.message# #e.detail# #e.ExtendedInfo#",
					 type = "Error");
			variables.errorStruct.errorId.insert ("update", "fail", true);
			return variables.errorStruct;
		}//end of any catch*/
	}//end of modifyRecord
	/**
	 * validateAll
	 **/
	 function validateAll(data){
	 	if (structKeyExists(arguments.data,"question")){
			validate("question", arguments.data.question, "error_question");
		}
		if (structKeyExists(arguments.data,"optiona")){
			validate("optionA", arguments.data.optiona, "error_optionA" );
		}
		if (structKeyExists(arguments.data,"optionb")){
			validate("optionB", arguments.data.optionb, "error_optionB");
		}
		if (structKeyExists(arguments.data,"optionc")){
			validate("optionC", arguments.data.optionc, "error_optionC");
		}
		if (structKeyExists(arguments.data,"optiond")){
			validate("optionD", arguments.data.optiond, "error_optionD");
		}
		if (structKeyExists(arguments.data,"answer")){
			validate("answer", arguments.data.answer, "error_answer");
		}
	 }//end of validateAllFields
}