/**
* I am a new handler
*/
component extends="coldbox.system.EventHandler"{

	property name = "authen" inject = "id:authen";
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
	* loginPage
	*/
	function loginPage( event, rc, prc ){
		if (structKeyExists(url,"logOut")){
			authen.doLogout();
		}
		if (structkeyExists(form,"submitLogin")){
			prc.aErrorMessages = authen.userValidation(rc.email,rc.password);
			if (ArrayisEmpty(prc.aErrorMessages)){
				prc.isUserLoggedIn = authen.doLogin(rc.email, rc.password);
			}
		}
		event.setView( view = "common/loginPage", layout = "funcky" );
	}

	/**
	* forgetPassword
	*/
	function forgetPassword( event, rc, prc ){
		event.setView( view = "common/forgetPassword", layout = "funcky" );
	}

	/**
	* resetPassword
	*/
	function resetPassword( event, rc, prc ){
		event.setView( view = "common/resetPassword", layout = "noNavigation" );
	}
}
