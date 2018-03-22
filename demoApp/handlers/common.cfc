/*----------------------------------------------------------------------------------------------------------
		FileName    : common.cfc
		Created By  : Megha Kedia
		DateCreated : 20-March-2018
		Description : added events that are common to all the portals.

------------------------------------------------------------------------------------------------------------*/
component extends="coldbox.system.EventHandler"{

	property name = "authentication" inject = "id:authentication";
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
	    			Function Name: loginPage
	    			Description: set the view for the loginPage.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function loginPage( event, rc, prc ){
		if (structKeyExists(url,"logOut")){
			authentication.doLogout();
		}
		if (structkeyExists(form,"submitLogin")){
			prc.aErrorMessages = authentication.userValidation(rc.email,rc.password);
			if (ArrayisEmpty(prc.aErrorMessages)){
				prc.isUserLoggedIn = authentication.doLogin(rc.email, rc.password);
			}
		}
		event.setView( view = "common/loginPage", layout = "funcky" );
	}

/*----------------------------------------------------------------------------------
	    			Function Name: forgetPassword
	    			Description: set the view for forgetPassword.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function forgetPassword( event, rc, prc ){
		event.setView( view = "common/forgetPassword", layout = "funcky" );
	}

/*----------------------------------------------------------------------------------
	    			Function Name: resetPassword
	    			Description: set the view for reset password.
	    			Arguments: event, rc, prc
	    			Return Type: none
------------------------------------------------------------------------------------*/
	function resetPassword( event, rc, prc ){
		event.setView( view = "common/resetPassword", layout = "noNavigation" );
	}
}
