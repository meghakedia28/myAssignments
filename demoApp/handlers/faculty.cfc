/*----------------------------------------------------------------------------------------------------------
FileName    : faculty.cfc
Created By  : Megha Kedia
DateCreated : 20-March-2018
Description : added events for faculty portal.
------------------------------------------------------------------------------------------------------------*/

component extends = "coldbox.system.EventHandler"{

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
Function Name : preHandler
Description   : checks authentication.
Arguments     : event,action,eventArguments,rc,prc
Return Type   : none
------------------------------------------------------------------------------------*/

function preHandler(event,action,eventArguments,rc,prc){
	local.sessionExists = structKeyExists(session,'stLoggedInUser');
	if (!(local.sessionExists)){
		setNextEvent(event = "common.loginPage?noaccess");
	}
	else if (session.stLoggedInUser.roleId != 2){
		setNextEvent(event = "common.loginPage?noaccess");
	}
}
function te( event, rc, prc ){
		event.setView( view = "faculty/te", layout = "commonLayout" );
	}
/*----------------------------------------------------------------------------------
Function Name  : addQuestions
Description    : call view for faculty add question.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function addQuestions( event, rc, prc ){
		event.setView( view = "faculty/addQuestions", layout = "commonLayout" );
	}

/*----------------------------------------------------------------------------------
Function Name  : questionBank
Description    : call view for faculty question.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function questionBank( event, rc, prc ){
		event.setView( view = "faculty/questionBank", layout = "commonLayout" );
	}

/*----------------------------------------------------------------------------------
Function Name  : quizQuestion
Description    : call view for faculty quizQuestion.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function quizQuestions( event,rc, prc){
		local.getListQuery = quizService.fetchQuizList(session.stLoggedInUser.UserId);
		local.getList = #valueList(getListQuery.quizId,",")#;
		if ((!(structKeyExists(rc,"Id"))) || (!(listFindNoCase(getList, rc.Id)))){
		 	event.setView( view = "faculty/viewQuiz", layout = "commonLayout");
		}
		else {
			prc.quizDetails = quizService.fetchQuizDetails(rc.Id);
			event.setView( view = "faculty/quizQuestions", layout = "commonLayout");
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : results
Description    : call view for faculty results.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function results( event, rc, prc ){
		prc.quizFilter = quizService.addFilter(session.stLoggedInUser.userId);
		event.setView( view = "faculty/results", layout = "commonLayout" );
	}
/*----------------------------------------------------------------------------------
Function Name  : setQuiz
Description    : call view for faculty setQuiz.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function setQuiz( event, rc, prc ){
		event.setView( view = "faculty/setQuiz", layout = "commonLayout" );
	}
/*----------------------------------------------------------------------------------
Function Name  : studentsProfile
Description    : call view for faculty studentsProfile.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function studentsProfile( event, rc, prc ){
		event.setView( view = "faculty/studentsProfile", layout = "commonLayout" );
	}
/*----------------------------------------------------------------------------------
Function Name  : studentsReport
Description    : call view for faculty studentsReport.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function studentsReport( event, rc, prc ){
		local.getIds = resultService.fetchScoreIds(session.stLoggedInUser.UserId);
		local.scoreIdsList = valueList(getIds.scoreId,",");
		if ((!(structKeyExists(rc,"Id"))) || (!(listFindNoCase(scoreIdsList, rc.Id)))){
			event.setView( view = "faculty/results", layout = "commonLayout" );
		}
		else {
			prc.scoreDetails = resultService.fetchResultDetails(rc.Id);
			event.setView( view = "faculty/studentsReport", layout = "commonLayout" );
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : viewQuiz
Description    : call view for faculty viewQuiz.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function viewQuiz( event, rc, prc ){
		event.setView( view = "faculty/viewQuiz", layout = "commonLayout" );
	}
/*----------------------------------------------------------------------------------
Function Name  : enterQuestions
Description    : handler to insert questions into db.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function enterQuestions(event, rc, prc){
		if (event.isAjax()){
			local.row = enterQuestionsService.validateAllFields(rc);
			event.renderData(format = "json", data = serializeJSON(row));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : viewQuizList
Description    : call model to diplay the quiz list in view.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewQuizList(event,rc,prc){
		if (event.isAjax()){
			local.quizList = quizService.getQuizList(rc.userId);
			event.renderData(format = "json", data = serializeJSON(local.quizList));
		}
		else{
			event.norender();
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : viewQuestionBank
Description    : call all questions for question bank.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function viewQuestionBank(event,rc,prc){
		 if (event.isAjax()){
		 	local.data = getQuestionsService.getAllQuestions(rc);
		 	event.renderData(format = "json", data = serializeJSON(data));
		 }
		else{
			event.norender();
		}
 	 }

/*----------------------------------------------------------------------------------
Function Name  : populateQuestionInModal
Description    : calls model to populate data inside models.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

 	 function populateQuestionInModal(event, rc, prc){
	 	 if (event.isAjax()){
	 	 	local.data = getQuestionsService.getSingleQuestion(rc.questionId);
		  	event.renderData(format = "json", data = serializeJSON(local.data));
		  }
		else{
			event.norender();
		}
	 }

/*----------------------------------------------------------------------------------
Function Name  : deleteRow
Description    : calls models to delete the record.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
 	 function deleteRow(event,rc,prc){
	 	 if (event.isAjax()){
	 	 	local.status = modifyQuestionService.deleteRecord(rc.questionId);
	 		return status;
 		}
		else{
			event.norender();
		}
 	 }
/*----------------------------------------------------------------------------------
Function Name  : editRow
Description    : call model to edit the record.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function editRow(event,rc,prc){
		if (event.isAjax()){
			local.status = modifyQuestionService.modifyRecord(rc);
			event.renderData(format = "json", data = serializeJSON(status));
		}
		else{
			event.norender();
		}
	 }
/*----------------------------------------------------------------------------------
Function Name  : setQuizQuestions
Description    : call model to set quiz questions.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function setQuizQuestions(event,rc,prc){
		 if (event.isAjax()){
		 	local.listOfData = getQuestionsService.getAllQuestions(rc);
		  	event.renderData(format = "json", data = serializeJSON(listOfData));
	  	}
		else{
			event.norender();
		}
	 }
/*----------------------------------------------------------------------------------
Function Name  : checkTestTime
Description    : call model too validate test time.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function checkTestTime(event,rc,prc){
	 	if (event.isAjax()){
		    local.data = quizService.checkStartDateTime(rc);
		 	event.renderData(format = "json", data = serializeJSON(data));
		}
		else{
			event.norender();
		}
	 }
/*----------------------------------------------------------------------------------
Function Name  : checkTestName
Description    : call model to validate test name.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	 function checkTestName(event,rc,prc){
		 if (event.isAjax()){
		 	local.data = quizService.checkQuizName(rc);
		 	event.renderData(format = "json", data = serializeJSON(data));
	 	}
		else{
			event.norender();
		}
	 }
/*----------------------------------------------------------------------------------
Function Name  : submitQuizForm
Description    : calls model to submit the form.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function submitQuizForm (event,rc,prc){
		if (event.isAjax()){
			local.status = quizService.validateInsertController(rc,session.stLoggedInUser.userId);
			event.renderData(format = "json", data = serializeJSON(local.status));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : populateQuizModel
Description    : call model to populate data in a edit modal.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function populateQuizModel (event,rc,prc){
		if (event.isAjax()){
			local.getDetails = quizService.getQuizDetails(arguments.rc.quizId);
			event.renderData(format = "json", data = serializeJSON(local.getDetails));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : removeQuiz
Description    : call model to remove a quiz.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function removeQuiz (event,rc,prc){
		if (event.isAjax()){
			local.status = quizService.deleteQuiz(rc.quizId);
			event.renderData(format = "json", data = serializeJSON(local.status));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : updateQuiz
Description    : call model to edit quiz information.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function updateQuiz(event,rc,prc){
		if (event.isAjax()){
			local.status = quizService.validateInsertController(rc);
			event.renderData(format = "json", data = serializeJSON(local.status));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : getQuizQuestionList
Description    : call model to get quiz questions.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function getQuizQuestionList(event,rc,prc){
		if (event.isAjax()){
			local.quizQuestionList = quizService.getQuizQuestions(rc.quizId);
			event.renderData(format = "json", data = serializeJSON(local.quizQuestionList));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : removeQuizQuestion
Description    : call model to remove quiz questions.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function removeQuizQuestion(event,rc,prc){
		if (event.isAjax()){
			local.status = quizService.deleteQuizQuestion(rc.questionId, rc.quizId);
			event.renderData(format = "json", data = serializeJSON(status));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : updateQuizQuestion
Description    : call model to update quiz questions.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function updateQuizQuestion(event,rc,prc){
		if (event.isAjax()){
			local.status = quizService.addQuizQuestions(rc);
			event.renderData(format = "json", data = serializeJSON(status));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : viewResults
Description    : call model to view results.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewResults( event, rc, prc ){
		if (event.isAjax()){
			local.result = resultService.getFacultyResultSet(rc);
			event.renderData(format = "json", data = serializeJSON(local.result));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : viewReport
Description    : call view to get the report of students.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewReport (event,rc,prc){
		if (event.isAjax()){
			local.report = resultService.generateReport(rc.scoreId);
			event.renderData(format = "json", data = serializeJSON(local.report));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : viewStudents
Description    : call view to display student list.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function viewStudents (event,rc,prc){
		if (event.isAjax()){
			local.results = userDetails.getStudentsDetails();
			event.renderData(format = "json", data = serializeJSON(local.results));
		}
		else{
			event.norender();
		}
	}
/*----------------------------------------------------------------------------------
Function Name  : individualResultSet
Description    : call view for faculty result set.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function individualResultSet(event,rc,prc){
		if (event.isAjax()){
			local.score = resultService.getStudentResultSet(rc);
			event.renderData(format = "json", data = serializeJSON(local.score));
		}
		else{
			event.norender();
		}
	}
}
