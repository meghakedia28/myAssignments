/**
* I am a new Model Object
*/
component singleton = "true" accessors = "true"{

	// Properties


	/**
	 * Constructor
	 */
	getQuestionsService function init(){

		return this;
	}

	/**
	* getAllQuestions
	*/
	function getAllQuestions(required struct data){
		if (NOT(structKeyExists(arguments.data,'quizId'))){
			arguments.data.quizId = 0;
		}
		var queryService  = new query();
		local.queryService.setName("questions");
		local.queryService.addParam(name = "quizId",value = "#arguments.data.quizId#",cfsqltype = "cf_sql_bigint");
		local.queryService.addParam(name = "userId",value = "#arguments.data.userId#",cfsqltype = "cf_sql_bigint");
		var result = local.queryService.execute(sql = "SELECT questionId,question,option1,option2,option3,option4,
			correctAnswer FROM [questionBank]
			WHERE [questionBank].[userId] = :userId AND [questionBank].[questionId] NOT IN
			(SELECT [questionId] FROM [quizQuestion] WHERE [quizQuestion].[quizId] = :quizId)
			ORDER BY [questionBank].[questionId] DESC ");
		questions = local.result.getResult();
		/** this subquery is written by keeping the folowing condition in mind:
		while viewing quiz(for upcoming quies) the questions can be added or deleted,
		(in viewQuizQuestion.cfm), their the feature of "addQuestions" will contain
		only those question which are not set for the quiz,
		hence the query is filtered by quizId also in this case only */
		return questions;
	}//end of getAllQuestions

	/**
	* getQuizQuestions
	*/
	function getSingleQuestion(required numeric questionId){
		var queryService  = new query();
		local.queryService.setName("questionDetails");
		local.queryService.addParam(name = "questionId",value = "#arguments.questionId#",cfsqltype = "cf_sql_varchar");
		var result = queryService.execute(sql = "SELECT questionId,question,option1,option2,option3,option4,
			correctAnswer FROM [questionBank]
			WHERE [questionBank].[questionId] = :questionId");
		questionDetails = local.result.getResult();
		return questionDetails;
	}


}