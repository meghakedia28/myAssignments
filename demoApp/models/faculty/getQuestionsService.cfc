/*----------------------------------------------------------------------------------------------------------
						FileName    : getQuestionsService.cfc
						Created By  : Megha Kedia
						DateCreated : 13-March-2018
						Description : get services related to questions.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true"{

	// Properties


	/**
	 * Constructor
	 */
	getQuestionsService function init(){

		return this;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchAllQuestions
Description    : fetches all the questions from database
Arguments      : struct data.
Return Type    : query
------------------------------------------------------------------------------------------------------------*/

	function fetchAllQuestions(required struct data){
		if (!(structKeyExists(arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		var getQuestionService  = new query();
		local.getQuestionService.setName("questions");
		local.getQuestionService.addParam(name = "quizId",value = "#arguments.data.quizId#",
			cfsqltype = "cf_sql_bigint");
		local.getQuestionService.addParam(name = "userId",value = "#arguments.data.userId#",
			cfsqltype = "cf_sql_bigint");
		var sql = "SELECT questionId,question,option1,option2,option3,option4,
						correctAnswer FROM [questionBank] WHERE [questionBank].[userId] = :userId
						AND [questionBank].[questionId] NOT IN (SELECT [questionId]
						FROM [quizQuestion] WHERE [quizQuestion].[quizId] = :quizId)
						ORDER BY [questionBank].[questionId] DESC";
		local.getQuestionService.setSQL(local.sql);
		questions = local.getQuestionService.execute().getResult();
		/** this subquery is written by keeping the folowing condition in mind:
		while viewing quiz(for upcoming quies) the questions can be added or deleted,
		(in viewQuizQuestion.cfm), their the feature of "addQuestions" will contain
		only those question which are not set for the quiz,
		hence the query is filtered by quizId also in this case only */
		return questions;
	}//end of fetchAllQuestions

/*------------------------------------------------------------------------------------------------------------
Function Name  : getAllQuestions
Description    : gets all the questions from database and formats it to dispaly to datatable
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getAllQuestions(required struct data){
		var questionList = fetchAllQuestions(arguments.data);
		var dataArray = arrayNew(2);
		var i = 1;
		var result["data"] = {};
		var answer = "";
		for ( row in questionList ) {
			var j = 1;
			if ((structKeyExists(arguments.data, 'action')) && (arguments.data.action == "setQuiz")){
				local.dataArray[i][j++] = "<input type = 'checkbox' class = 'question'
												name = 'questionId'  id = 'questionId_#row.questionId#'
												value = '#row.questionId#'></input>";
			}
			local.dataArray[i][j++] = encodeForHtml(row.question);
			local.dataArray[i][j++] = encodeForHtml(row.option1);
			local.dataArray[i][j++] = encodeForHtml(row.option2);
			local.dataArray[i][j++] = encodeForHtml(row.option3);
			local.dataArray[i][j++] = encodeForHtml(row.option4);
			local.answer = encodeForHtml(row.correctAnswer);
			if (local.answer == "option1"){
				local.dataArray[i][j++] = "Option A";
			}
			else if (local.answer == "option2"){
				local.dataArray[i][j++] = "Option B";
			}
			else if (local.answer == "option3"){
				local.dataArray[i][j++] = "Option C";
			}
			else if (local.answer == "option4"){
				local.dataArray[i][j++] = "Option D";
			}
			if ((structKeyExists(arguments.data, 'action')) && (arguments.data.action == "modify")){
				var modifyQuestionService =
					createObject("component","demoApp/models/faculty/modifyQuestionService");
				if (local.modifyQuestionService.checkEditability(row.questionId)){
					local.dataArray[i][j++] = "<button type = 'button' class = 'btn btn-success btn-sm'
													id = 'edit' name = 'edit' data-toggle = 'modal'
													data-target = '##rowEdit' data-id = '#row.questionId#'>
													<i class = 'glyphicon glyphicon-pencil'>
													</i>edit</button>"&
													"<button type = 'button'
													class = 'btn btn-danger btn-sm' id = 'delete'
													name = 'delete' data-toggle = 'modal'
													data-target = '##rowDelete' data-id = '#row.questionId#' >
													<i class = 'glyphicon glyphicon-remove'>
													</i>Delete</button>";
			 	}
				else {
			  		local.dataArray[i][j++] = "<button type = 'button' class = 'btn btn-success btn-sm' disabled>
				 									<i class = 'glyphicon glyphicon-pencil'></i>edit</button>"&
				 									"<button type = 'button' class = 'btn btn-danger btn-sm'
				 									data-toggle = 'modal' disabled>
				 									<i class = 'glyphicon glyphicon-remove'>
													</i>Delete</button>";
	 			}
			}
 			local.i = local.i+1;
 		}
 		local.result["data"] = local.dataArray;
 		return result;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchSingleQuestion
Description    : fetches single question from database based on questionId
Arguments      : numeric questionId.
Return Type    : query
------------------------------------------------------------------------------------------------------------*/

	function fetchSingleQuestion(required numeric questionId){
		var queryService  = new query();
		local.queryService.setName("questionDetails");
		local.queryService.addParam(name = "questionId",value = "#arguments.questionId#",
			cfsqltype = "cf_sql_varchar");
		var result = queryService.execute(sql = "SELECT questionId,question,option1,option2,option3,option4,
													correctAnswer FROM [questionBank]
													WHERE [questionBank].[questionId] = :questionId");
		questionDetails = local.result.getResult();
		return questionDetails;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : getSingleQuestion
Description    : formats a single question query from database to populate in modal.
Arguments      : numeric questionId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getSingleQuestion(required numeric questionId){
		var getQuestionDetails = fetchSingleQuestion (arguments.questionId);
		var data = {};
 	 	for ( row in getQuestionDetails ) {
 			local.data["question"] = row.question;
	 		local.data["optiona"] = row.option1;
 			local.data["optionb"] = row.option2;
 			local.data["optionc"] = row.option3;
  			local.data["optiond"] = row.option4;
	 		local.data["answer"] = row.correctAnswer;
	 		local.data["questionId"] = row.questionId;
	  	}
	  	return data;
	}
}