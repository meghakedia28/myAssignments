<!----------------------------------------------------------------------------------------------------------
							FileName    : Main.cfc
							Created By  : Megha Kedia
							DateCreated : 29-March-2018
							Description : contains main level functions.
------------------------------------------------------------------------------------------------------------>

<cfcomponent output="false" extends="coldbox.system.EventHandler">

	<!--- Default Action --->
	<cffunction name="loginPage" returntype="void" output="false" hint="My main event">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset prc.welcomeMessage = "Welcome to ColdBox!">
		<cfset event.setView("common/loginPage")>
	</cffunction>

	<!--- Do Something Action --->
	<cffunction name="doSomething" returntype="void" output="false" hint="Do Something">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset relocate( "common.loginPage" )>
	</cffunction>

<!------------------------------------------- GLOBAL IMPLICIT EVENTS ONLY ------------------------------------------>
<!--- In order for these events to fire, you must declare them in the ColdBox.cfc --->

	<cffunction name="onAppInit" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

	</cffunction>

	<cffunction name="onRequestStart" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

	</cffunction>

	<cffunction name="onRequestEnd" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

	</cffunction>

	<cffunction name="onSessionStart" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

	</cffunction>

	<cffunction name="onSessionEnd" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset local.sessionScope = event.getValue("sessionReference")>
		<cfset local.applicationScope = event.getValue("applicationReference")>

	</cffunction>

	<cffunction name="onException" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfscript>
			//Grab Exception From private request collection, placed by ColdBox Exception Handling
			local.exception = prc.exception;
			//Place exception handler below:
			setNextEvent("main.fail");
		</cfscript>
	</cffunction>
	<cffunction name="fail" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<!--- <cfscript> --->
<!--- 			event.setView( view = "main/fail", layout = "commonLayout" ); --->
<!--- 		</cfscript> --->
	</cffunction>
	<cffunction name="pageNotFound" returntype="void" output="false">
		<cfscript>
			event.renderData( data="<h1>Page Not Found</h1>", statusCode=404);
			event.setView("main/pageNotFound").setHTTPHeader("404", "Page Not Found");
		</cfscript>
	</cffunction>
	<cffunction name="onMissingTemplate" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfscript>
			//Grab missingTemplate From request collection, placed by ColdBox
			local.missingTemplate = event.getValue("missingTemplate");
			event.renderData( data="<h1>Page Not Found</h1>", statusCode=404);
			event.setView("main/pageNotFound").setHTTPHeader("404", "Page Not Found");
		</cfscript>
	</cffunction>
	<cffunction name="onError" returntype="void" output="false">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfargument name="faultaction">
		<cfargument name="exception">
		<cfscript>
			prc.response = getInstance("ResponseObject");
			prc.response.setError(true);
			prc.response.addMessage("Error executing resource #arguments.exception.message#");

			arguments.event.setHTTPHeader(statusCode="500",
				statusText="Error executing resource #arguments.exception.message#").renderData( data=prc.response.getDataPackage(), type="json");
		</cfscript>
	</cffunction>
</cfcomponent>