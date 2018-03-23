/*----------------------------------------------------------------------------------------------------------
		FileName    : admin.cfc
		Created By  : Megha Kedia
		DateCreated : 20-March-2018
		Description : added events based on admin portal.

------------------------------------------------------------------------------------------------------------*/
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

/*----------------------------------------------------------------------------------
	    			Function Name: home
	    			Description: set the view for admin home.
	    			Arguments: event, rc, prc
	    			Return Type:
------------------------------------------------------------------------------------*/
	function home( event, rc, prc ){
		event.setView(view = "admin/home", layout = "adminFront" );
	}

/*----------------------------------------------------------------------------------
	    			Function Name: addFaculties
	    			Description: set the view for addFaculties.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function addFaculties( event, rc, prc ){
		event.setView(view = "admin/addFaculties", layout = "adminFront" );
	}

/*----------------------------------------------------------------------------------
	    			Function Name: viewFaculties
	    			Description: set the view for viewFaculties.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function viewFaculties( event, rc, prc ){
		event.setView(view = "admin/viewFaculties", layout = "adminFront" );
	}

/*----------------------------------------------------------------------------------
	    			Function Name: addStudents
	    			Description: set view for addStudents.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function addStudents( event, rc, prc ){
		event.setView(view = "admin/addStudents", layout = "adminFront" );
	}

/*----------------------------------------------------------------------------------
	    			Function Name: viewStudents
	    			Description: set the view for viewStudents.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function viewStudents( event, rc, prc ){
		event.setView(view = "admin/viewStudents", layout = "adminFront" );
	}
/*----------------------------------------------------------------------------------
	    			Function Name: validateAddUser
	    			Description: call models to validate and insert user information.
	    			Arguments: event, rc, prc
	    			Return Type: struct
------------------------------------------------------------------------------------*/

	function validateAddUser (event,rc,prc){
		var status = userValidationService.validateInsertController(rc);
		event.renderData(format = "json", data = serializeJSON(status));
	}
/*----------------------------------------------------------------------------------
	    			Function Name: checkEmail
	    			Description: call models to validate user email address.
	    			Arguments: event, rc, prc
	    			Return Type: struct
------------------------------------------------------------------------------------*/

	function checkEmail (event,rc,prc){
		var status = userValidationService.validateEmail(rc.emailId);
		event.renderData(format = "json", data = serializeJSON(status));
	}
/*----------------------------------------------------------------------------------
	    			Function Name: checkSubject
	    			Description: validate subject name.
	    			Arguments: event, rc, prc
	    			Return Type: struct
------------------------------------------------------------------------------------*/

	function checkSubject (event,rc,prc){
		var status = userValidationService.validateSubject(rc.name);
		event.renderData(format = "json", data = serializeJSON(status));
	}
/*----------------------------------------------------------------------------------
	    			Function Name: getUser
	    			Description: get the list of all faculty.
	    			Arguments: event, rc, prc
	    			Return Type: struct
------------------------------------------------------------------------------------*/

	function getUser(event,rc,prc){
		var data = userDetailsService.getUserList(rc);
		event.renderData(format = "json", data = serializeJSON(data));
	}
/*----------------------------------------------------------------------------------
	    			Function Name: populateStudentModel
	    			Description: populate data in the student portal.
	    			Arguments: event, rc, prc
	    			Return Type: struct
------------------------------------------------------------------------------------*/

	remote function populateModel(event,rc,prc){
		var data = userDetailsService.getUserDetails(rc);
		event.renderData(format = "json", data = serializeJSON(data));
	}

/*----------------------------------------------------------------------------------
	    			Function Name: updateRow
	    			Description: update the edited data of the user information.
	    			Arguments: event, rc, prc
	    			Return Type: struct
------------------------------------------------------------------------------------*/

	function updateRow(event,rc,prc){
		var data = userValidationService.updateUserInformationController(rc);
		event.renderData(format = "json", data = serializeJSON(data));
	}
}
