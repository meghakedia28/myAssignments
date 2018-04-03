/*-------------------------------------------------------------------------------------------------------------
FileName    : Application.cfc
Created By  : Megha Kedia
DateCreated : 18-March-2018
Description : application level settings.

--------------------------------------------------------------------------------------------------------------*/

component{
	// Application properties
	this.name = "demoApp";
	this.applicationTimeout = createtimespan(0, 4, 0, 0);
	this.datasource = "demoProject";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 3, 0, 0);
	this.setClientCookies = true;
	this.sessioncookie.timeout = createTimeSpan(0, 3, 0, 0);
	this.sessioncookie.secure = true;
	this.authcookie.timeout = createTimeSpan(0, 3, 0, 0);
  	this.sessioncookie.disableupdate = true;
	this.authcookie.disableupdate = true;
	this.mappings[ '/coldbox' ] = 'D:/Assignments/myAssignments/demoApp/coldbox/';
	this.invokeImplicitAccessor = true;

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE 	 = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY 		 = "";

	// Java Integration
	this.javaSettings = {
		loadPaths 					= [ ".\lib" ],
		loadColdFusionClassPath 	= true,
		reloadOnChange 				= false
	};

	// application start
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		application.mailFrom = "megha.kedia28@gmail.com";
		application.errorLogService = logError;
		return true;
	}

	// application end
	public boolean function onApplicationEnd( struct appScope ){
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
	}

	// request start
	public boolean function onRequestStart( string targetPage ){
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate(required string targetPage){
		try{
			local.text = "Missing template: "&arguments.targetPage;
			application.errorLogService(text = local.text);
			include "gobalErrorHandler.cfm";
		}
		catch(any e){
			return false;
		}
   		return true;
	}
	public void function OnError (required exception, required string eventName){
		local.text = "Event Name: " & arguments.Eventname;
		fileObj = fileOpen("D:\Assignments\myAssignments\logs\demoApp.txt","append");
		fileWriteLine(fileObj, local.text);
		fileClose( fileObj );
		local.text = "Message: " & arguments.Exception;
		fileObject = fileOpen("D:\Assignments\myAssignments\logs\demoApp.txt","append");
		fileWriteLine(fileObject, local.text);
		fileClose( fileObject );
		if (!(arguments.EventName IS "onSessionEnd") || (arguments.EventName IS "onApplicationEnd")){
 			writeOutput("<h2>An unexpected error occurred.</h2>" &
 						"<p>Please wait for some time and try again</p>");
		}
	}

	public function logError(any errors, numeric dbError = 0, string text = ""){
		if (arguments.text == ""){
			if (arguments.dbError == 1){
				dbFileObj = fileOpen("D:\Assignments\myAssignments\logs\dbError.txt","append");
				fileWriteLine(dbFileObj, "#errors.message# #errors.detail# #errors.ExtendedInfo#");
				fileClose( dbFileObj );
			}
			fileObj = fileOpen("D:\Assignments\myAssignments\logs\error.txt","append");
			fileWriteLine(fileObj, "#errors.message# #errors.detail# #errors.ExtendedInfo#");
			fileClose( fileObj );
		}
		else{
			fileObj = fileOpen("D:\Assignments\myAssignments\logs\demoApp.txt","append");
			fileWriteLine(fileObj, arguments.text);
			fileClose( fileObj );
		}
	}
}