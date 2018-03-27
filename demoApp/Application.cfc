/**
* Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.ortussolutions.com
* ---
*/
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

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}
	public function logError(required any errors, numeric dbError = 0){
		if (arguments.dbError == 1){
			dbFileObj = fileOpen("D:\Assignments\myAssignments\logs\dbError.txt","append");
			fileWrite(dbFileObj, "#errors.message# #errors.detail# #errors.ExtendedInfo#");
			fileWrite(dbFileObj, "#errors.queryError#");
			fileClose( dbFileObj );
		}
		fileObj = fileOpen("D:\Assignments\myAssignments\logs\error.txt","append");
		fileWrite(fileObj, "#errors.message# #errors.detail# #errors.ExtendedInfo#");
		fileClose( fileObj );
	}
}