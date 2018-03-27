/*----------------------------------------------------------------------------------------------------------
						FileName    : modifyQuestionService.cfc
						Created By  : Megha Kedia
						DateCreated : 13-March-2018
						Description : upadtes the changes made to the questions.

------------------------------------------------------------------------------------------------------------*/

component accessors = "true" extends = "enterQuestions" {
	// Properties

	/**
	 * Constructor
	 */
	modifyQuestionService function init(){

		return this;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : checkEditability
Description    : check if the question is editable or not:
				A question is editable only when it is never used to set a quiz.
Arguments      : numeric questionId.
Return Type    : boolean.
------------------------------------------------------------------------------------------------------------*/

	function checkEditability(required numeric questionId){
		var queryService  = new query();
		local.queryService.setName("editableQuestions");
		local.queryService.addParam(name = "id",value = "#arguments.questionId#",cfsqltype = "cf_sql_bigint");
		var result = local.queryService.execute(sql = "SELECT [questionBank].[questionId]
															FROM [questionBank] JOIN [quizQuestion]
															ON [questionBank].[questionId] =
															[quizQuestion].[questionId]
															WHERE [quizQuestion].[questionId] = :id");
		editableQuestions = local.result.getResult();
		if (editableQuestions.recordCount EQ 0){
			return true;
		}//end of if
		else{
			return false;
		}//end of else
	}//end of checkEditability

/*------------------------------------------------------------------------------------------------------------
Function Name  : deleteRecord
Description    : removes a question from database.
Arguments      : numeric questionId.
Return Type    : boolean.
------------------------------------------------------------------------------------------------------------*/

	function deleteRecord(required numeric questionId){
		try{
			var queryService  = new query();
			local.queryService.addParam(name = "id",value = "#arguments.questionId#",
				cfsqltype = "cf_sql_bigint");
			var result = local.queryService.execute(sql = "DELETE FROM [questionBank]
		 														 WHERE [questionBank].[questionId] = :id");
		 	}//end of try
	 	catch (database db){
	 		application.errorLogService.(db,1);
			return false;
	 	}//end of db catch
	 	catch (any e){
		 	application.errorLogService.(e);
			return false;
	 	}//end of catch
	 	return true;
	}//end of deleteRecord

/*------------------------------------------------------------------------------------------------------------
Function Name  : modifyRecord
Description    : updates the modification done in a question.
Arguments      : struct data.
Return Type    : boolean.
------------------------------------------------------------------------------------------------------------*/

	function modifyRecord(required struct data){
		try{
			transaction{
				validateAll(arguments.data);
				if (structIsEmpty(variables.errorStruct.errorId)){
					var unique = checkunique(data.optiona, data.optionb, data.optionc, data.optiond );
					if (local.unique){
						var updateQuestionsService  = new query();
						local.updateQuestionsService.setName("result");
						local.updateQuestionsService.addParam(name = "question",value = "#data.question#",
						cfsqltype = "cf_sql_varchar");
						local.updateQuestionsService.addParam(name = "optiona",value = "#data.optiona#",
						cfsqltype = "cf_sql_varchar");
						local.updateQuestionsService.addParam(name = "optionb",value = "#data.optionb#",
						cfsqltype = "cf_sql_varchar");
						local.updateQuestionsService.addParam(name = "optionc",value = "#data.optionc#",
						cfsqltype = "cf_sql_varchar");
						local.updateQuestionsService.addParam(name = "optiond",value = "#data.optiond#",
						cfsqltype = "cf_sql_varchar");
						local.updateQuestionsService.addParam(name = "answer",value = "#data.answer#",
						cfsqltype = "cf_sql_varchar");
						local.updateQuestionsService.addParam(name = "id",value = "#data.questionId#",
						cfsqltype = "cf_sql_bigint");
						var sql = "UPDATE [questionBank]
										SET [questionBank].[question] = :question,
										[questionBank].[option1] = :optiona,
										[questionBank].[option2] = :optionb,
										[questionBank].[option3] = :optionc,
										[questionBank].[option4] = :optiond,
										[questionBank].[correctAnswer] = :answer
										WHERE [questionBank].[questionId] = :id";
						local.updateQuestionsService.setSQL(local.sql);
						local.updateQuestionsService.execute().getResult();
						variables.errorStruct.errorId.insert ("update", "successfull", true);
					}
				}//end of if
			return variables.errorStruct;
			}//end of transaction
		}//end of try
		catch (database db){
			application.errorLogService.(db,1);
			variables.errorStruct.errorId.insert ("update", "fail", true);
			return variables.errorStruct;
		}//end of db catch
		catch (any e){
			application.errorLogService.(e);
			variables.errorStruct.errorId.insert ("update", "fail", true);
			return variables.errorStruct;
		}//end of any catch
	}//end of modifyRecord

/*------------------------------------------------------------------------------------------------------------
Function Name  : validateAll
Description    : validates all the fields.
Arguments      : struct data.
Return Type    : none.
------------------------------------------------------------------------------------------------------------*/

	 function validateAll(required struct data){
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