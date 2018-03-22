/**
* I am a new handler
*/
component extends="coldbox.system.EventHandler"{

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

/*----------------------------------------------------------------------------------------------------------
		FileName    : students.cfc
		Created By  : Megha Kedia
		DateCreated : 20-March-2018
		Description : added events for students portal.

------------------------------------------------------------------------------------------------------------*/
	function home( event, rc, prc ){
		event.setView(view = "student/home", layout = "studentFront" );
	}

	/**
	* tests
	*/
	function tests( event, rc, prc ){
		event.setView( view = "student/tests", layout = "studentFront" );
	}

	/**
	* testStart
	*/
	function testStart( event, rc, prc ){
		event.setView( view = "student/testStart", layout = "studentFront" );
	}

	/**
	* results
	*/
	function results( event, rc, prc ){
		event.setView( view = "student/results", layout = "studentFront" );
	}



}
