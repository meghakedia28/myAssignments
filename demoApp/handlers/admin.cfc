/**
* I am a new handler
*/
component extends="coldbox.system.EventHandler"{

	property name = "userValidationService" inject = "id:userValidationService";
	property name = "userDetailsService" inject = "id:userDetailsService";
	property name = "enterDataService" inject = "id:enterDataService";
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

	/**
	* home
	*/
	function home( event, rc, prc ){
		event.setView(view = "admin/home", layout = "adminFront" );
	}

	/**
	* addFaculties
	*/
	function addFaculties( event, rc, prc ){
		event.setView(view = "admin/addFaculties", layout = "adminFront" );
	}

	/**
	* viewFaculties
	*/
	function viewFaculties( event, rc, prc ){
		event.setView(view = "admin/viewFaculties", layout = "adminFront" );
	}

	/**
	* addStudents
	*/
	function addStudents( event, rc, prc ){
		event.setView(view = "admin/addStudents", layout = "adminFront" );
	}

	/**
	* viewStudents
	*/
	function viewStudents( event, rc, prc ){
		event.setView(view = "admin/viewStudents", layout = "adminFront" );
	}

	function validateAddUser (event,rc,prc){
		var status = userValidationService.validateInsertController(rc);
		event.renderData(format = "json", data = serializeJSON(status));
	}
	function checkEmail (event,rc,prc){
		var status = userValidationService.validateEmail(rc.emailId);
		event.renderData(format = "json", data = serializeJSON(status));
	}

	function checkSubject (event,rc,prc){
		var status = userValidationService.validateSubject(rc.name);
		event.renderData(format = "json", data = serializeJSON(status));
	}

	function getFaculty(event,rc,prc){
		var data = userDetailsService.getFacultyList();
		event.renderData(format = "json", data = serializeJSON(data));
	}

	function getStudent(event,rc,prc){
		var data = userDetailsService.getStudentList();
		event.renderData(format = "json", data = serializeJSON(data));
	}

	function populateStudentModel(event,rc,prc){
		var data = userDetailsService.getStudentDetails(rc.userId);
		event.renderData(format = "json", data = serializeJSON(data));
	}
	function populatefacultyModel(event,rc,prc){
		var data = userDetailsService.getFacultyDetails(rc.userId);
		event.renderData(format = "json", data = serializeJSON(data));
	}

	function updateRow(event,rc,prc){
		var data = userValidationService.updateUserInformationController(rc);
		event.renderData(format = "json", data = serializeJSON(data));
	}
}
