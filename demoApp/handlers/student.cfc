/*----------------------------------------------------------------------------------------------------------
FileName    : students.cfc
Created By  : Megha Kedia
DateCreated : 20-March-2018
Description : added events for students portal.

------------------------------------------------------------------------------------------------------------*/

component extends="coldbox.system.EventHandler"{

	property name = "testService" inject = "id:testService";
	property name = "studentResultService" inject = "id:studentResultService";
	property name = "getQuestionsService" inject = "id:getQuestionsService";
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
	else if (session.stLoggedInUser.roleId != 3){
		setNextEvent(event = "common.loginPage?noaccess");
	}
}

/*----------------------------------------------------------------------------------
Function Name  : home
Description    : call view for student home.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/
	function home( event, rc, prc ){
		event.setView(view = "student/home", layout = "commonLayout" );
	}

/*----------------------------------------------------------------------------------
Function Name  : tests
Description    : call view for student tests.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function tests( event, rc, prc ){
		prc.test = testService.displayTestMessage(rc);
		if (structKeyExists(rc,"endTest")){
			prc.endTestMessage = "The test has ended";
		}
		if (structKeyExists(rc,"submitEnd")){
			prc.score = testService.getScore(rc.quizId, session.stLoggedInUser.userId);
			prc.endTestMessage = "The test has ended";
		}
		event.setView( view = "student/tests", layout = "commonLayout" );
	}

/*----------------------------------------------------------------------------------
Function Name  : testStart
Description    : call view for student testStart.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function testStart( event, rc, prc ){
		prc.results = testService.testStartValidation();
		event.setView( view = "student/testStart", layout = "commonLayout" );
	}

/*----------------------------------------------------------------------------------
Function Name  : testValidate
Description    : handler to call the component of test validation.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function testValidate (event, rc, prc){
		if (event.isAjax()){
			local.validate = testService.checkTestTime();
			event.renderData(format = "json", data = serializeJSON(validate));
		}
		else{
			event.norender();
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : getQuestions
Description    : calls the component to get questions in the test.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function getQuestions(event, rc, prc){
		if (event.isAjax()){
			local.data = getQuestionsService.getQuizQuestion(rc.quizId);
			event.renderData(format = "json", data = serializeJSON(data));
		}
		else{
			event.norender();
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : getNext
Description    : handler to call next question in test.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function getNext(event, rc, prc){
		if (event.isAjax()){
			local.data = getQuestionsService.getNextQuizQuestion(rc);
			event.renderData(format = "json", data = serializeJSON(data));
		}
		else{
			event.norender();
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : submitTest
Description    : calls when test submit is called.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function submitTest(event, rc, prc){
		if (event.isAjax()){
			local.data = testService.testEnd(rc);
			event.renderData(format = "json", data = serializeJSON(data));
		}
		else{
			event.norender();
		}
	}

/*----------------------------------------------------------------------------------
Function Name  : results
Description    : calls view for viewing results.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function results( event, rc, prc ){
		event.setView( view = "student/results", layout = "commonLayout" );
	}

/*----------------------------------------------------------------------------------
Function Name  : getResults
Description    : gets the results of the student.
Arguments      : event, rc, prc
Return Type    : none
------------------------------------------------------------------------------------*/

	function getResults (event, rc, prc){
		if (event.isAjax()){
			local.data = studentResultService.getAStudentResult(session.stLoggedInUser.userId);
			event.renderData(format = "json", data = serializeJSON(local.data));
		}
		else{
			event.norender();
		}
	}
}
