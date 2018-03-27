/*----------------------------------------------------------------------------------------------------------
							FileName    : faculty.cfc
							Created By  : Megha Kedia
							DateCreated : 20-March-2018
							Description : added events for faculty portal.
------------------------------------------------------------------------------------------------------------*/
component extends="coldbox.system.EventHandler"{

	property name = "enterQuestionsService" inject = "id:enterQuestionsService";
	property name = "getQuestionsService" inject = "id:getQuestionsService";
	property name = "modifyQuestionService" inject = "id:modifyQuestionService";
	property name = "quizService" inject = "id:quizService";
	property name = "resultService" inject = "id:resultService";
	property name = "userDetails" inject = "id:userDetailsService";
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function home( event, rc, prc ){
		event.setView( view = "faculty/home", layout = "facultyFront" );
	}

/*----------------------------------------------------------------------------------
Function Name  : addQuestions
Description    : call view for faculty add question.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function addQuestions( event, rc, prc ){
		event.setView( view = "faculty/addQuestions", layout = "facultyFront" );
	}

/*----------------------------------------------------------------------------------
Function Name  : questionBank
Description    : call view for faculty question.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function questionBank( event, rc, prc ){
		event.setView( view = "faculty/questionBank", layout = "facultyFront" );
	}

/*----------------------------------------------------------------------------------
Function Name  : quizQuestion
Description    : call view for faculty quizQuestion.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function quizQuestions( event,rc, prc){
		var getListQuery = quizService.fetchQuizList(#session.stLoggedInUser.UserId#);
		var getList = #valueList(getListQuery.quizId,",")#;
		if ((!(structKeyExists(rc,"Id"))) || (NOT (listFindNoCase(getList, rc.Id)))){
		 	event.setView( view = "faculty/viewQuiz", layout = "facultyFront");
		}
		else {
			prc.quizDetails = quizService.fetchQuizDetails(rc.Id);
			event.setView( view = "faculty/quizQuestions", layout = "facultyFront");
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : results
Description    : call view for faculty results.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function results( event, rc, prc ){
		event.setView( view = "faculty/results", layout = "facultyFront" );
	}
/*----------------------------------------------------------------------------------
Function Name  : setQuiz
Description    : call view for faculty setQuiz.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function setQuiz( event, rc, prc ){
		var getResult =
		event.setView( view = "faculty/setQuiz", layout = "facultyFront" );
	}
/*----------------------------------------------------------------------------------
Function Name  : studentsProfile
Description    : call view for faculty studentsProfile.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function studentsProfile( event, rc, prc ){
		event.setView( view = "faculty/studentsProfile", layout = "facultyFront" );
	}
/*----------------------------------------------------------------------------------
Function Name  : studentsReport
Description    : call view for faculty studentsReport.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function studentsReport( event, rc, prc ){
		var getIds = resultService.fetchScoreIds(#session.stLoggedInUser.UserId#);
		var scoreIdsList = valueList(getIds.scoreId,",");
		if ((NOT (structKeyExists(rc,"Id"))) || (NOT (listFindNoCase(scoreIdsList, rc.Id)))){
			event.setView( view = "faculty/results", layout = "facultyFront" );
		}
		else {
			prc.scoreDetails = resultService.fetchResultDetails(rc.Id);
			event.setView( view = "faculty/studentsReport", layout = "facultyFront" );
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : viewQuiz
Description    : call view for faculty viewQuiz.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function viewQuiz( event, rc, prc ){
		event.setView( view = "faculty/viewQuiz", layout = "facultyFront" );
	}
/*----------------------------------------------------------------------------------
Function Name  : enterQuestions
Description    : handler to insert questions into db.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function enterQuestions(event, rc, prc){
		if (event.isAjax()){
			var row = enterQuestionsService.validateAllFields(rc);
			event.renderData(format = "json", data = serializeJSON(row));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : viewQuizList
Description    : .
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewQuizList(event,rc,prc){
		var quizList = quizService.getQuizList(rc.userId);
		event.renderData(format = "json", data = serializeJSON(local.quizList));
	}

/*----------------------------------------------------------------------------------
Function Name  : viewQuestionBank
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function viewQuestionBank(event,rc,prc){
	 	var data = getQuestionsService.getAllQuestions(rc);
	 	event.renderData(format = "json", data = serializeJSON(data));
 	 }//end of viewQuestionBank

/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

 	 function populateQuestionInModal(event, rc, prc){
 	 	var data = getQuestionsService.getSingleQuestion(rc.questionId);
	  	event.renderData(format="json", data = serializeJSON(local.data));
	 } //end of populateQuestionInModal

/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
 	 function deleteRow(event,rc,prc){
 	 	var status = modifyQuestionService.deleteRecord(rc.questionId);
 		return status;
 	 }//end of deleteRow
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function editRow(event,rc,prc){
		var status = modifyQuestionService.modifyRecord(rc);
		event.renderData(format = "json", data = serializeJSON(status));
	 }
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function setQuizQuestions(event,rc,prc){
	 	var listOfData = getQuestionsService.getAllQuestions(rc);
	  	event.renderData(format = "json", data = serializeJSON(listOfData));
	   }
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function checkTestTime(event,rc,prc){
	    var data = quizService.checkStartDateTime(rc);
	 	event.renderData(format = "json", data = serializeJSON(data));
	 }
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function checkTestName(event,rc,prc){
	 	var data = quizService.checkQuizName(rc);
	 	event.renderData(format = "json", data = serializeJSON(data));
	 }
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function submitQuizForm (event,rc,prc){
		var status = quizService.validateInsertController(rc,session.stLoggedInUser.userId);
		event.renderData(format = "json", data = serializeJSON(local.status));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function populateQuizModel (event,rc,prc){
		var getDetails = quizService.getQuizDetails(arguments.rc.quizId);
		event.renderData(format = "json", data = serializeJSON(local.getDetails));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function removeQuiz (event,rc,prc){
		var status = quizService.deleteQuiz(rc.quizId);
		event.renderData(format = "json", data = serializeJSON(local.status));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function updateQuiz(event,rc,prc){
		var status = quizService.validateInsertController(rc);
		event.renderData(format = "json", data = serializeJSON(local.status));
	}//end of updateRow
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function getQuizQuestionList(event,rc,prc){
		var quizQuestionList = quizService.getQuizQuestions(rc.quizId);
		event.renderData(format = "json", data = serializeJSON(local.quizQuestionList));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function removeQuizQuestion(event,rc,prc){
		var status = quizService.deleteQuizQuestion(rc.questionId, rc.quizId);
		event.renderData(format = "json", data = serializeJSON(status));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function updateQuizQuestion(event,rc,prc){
		var status = quizService.addQuizQuestions(rc);
		event.renderData(format = "json", data = serializeJSON(status));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewResults( event, rc, prc ){
		var result = resultService.getFacultyResultSet(rc);
		event.renderData(format = "json", data = serializeJSON(local.result));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function applyQuizFilter(event,rc,prc){
		var getList = quizService.getQuizList(rc.userId);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var i = 1;
		for (row in getList){
			local.dataArray[i][1] =
				"<input type = 'checkbox' name = 'quizId' id = 'quizId' value = '#row.quizId#'></input>";
			local.dataArray[i][2] = encodeForHTML(row.name);
			local.i = local.i + 1;
		}
		result.data = dataArray;
		event.renderData(format = "json", data = serializeJSON(local.result));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewReport (event,rc,prc){
		var report = resultService.generateReport(rc.scoreId);
		event.renderData(format = "json", data = serializeJSON(local.report));
	}
/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewStudents (event,rc,prc){
		var results = userDetails.getStudentsDetails();
		event.renderData(format = "json", data = serializeJSON(local.results));
	}
/*----------------------------------------------------------------------------------
Function Name  : individualResultSet
Description    : call view for faculty home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function individualResultSet(event,rc,prc){
		var score = resultService.getStudentResultSet(rc);
		event.renderData(format = "json", data = serializeJSON(local.score));
	}
}
