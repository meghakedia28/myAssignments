<cfcomponent output="false">
	<cfset this.name = "My_Application"/>
	<cfset this.applicationTimeout = createtimespan(0,2,0,0)/>
	<cfset this.datasource = "registrationForm"/>
	<cfset this.sessionManagement = "yes"/>
	<cfset this.sessionTimeout = createtimespan(0,0,10,0) />
	<cfset this.sessioncookie.disableupdate = true>
	<cfset this.sessioncookie.httponly = true>
 	<cfset this.sessioncookie.secure = true>
 	<cfset this.setclientcookie = true>
 	<cfset this.sessioncookie.timeout = createTimespan(0,0,10,0)>
	<cfset this.loginStorage = "session">
	
	<!---On application start--->
		<cffunction name="OnApplicationStart" returnType="boolean"  >
			<cfset application.utility = createObject("component",'assign_9.components.utility')/>
			<cfreturn true/>
		</cffunction> 
	<!---On session start--->
		<cffunction name="OnSessionStart" returntype="boolean">
			
			<cfset session.structOfError = {struct1={}, struct2={}}>
			<cfreturn true>
		</cffunction>
	<!---On Request Start--->
		<cffunction name="OnRequestStart" returnType="boolean"  >
			<cfargument name="targetPage" type="string" required="true" >
			<cfif isDefined('url.restartApp')>
				<cfset this.OnApplicationStart() />
			</cfif>
			<cfreturn true/>
		</cffunction>	
	<!---On error--->
		<cffunction name="OnError" returntype="void" access="public" >
			<cfargument name="Exception" required=true/> 
    		<cfargument name="EventName" type="String" required=true/> 
				<cflog file="#This.Name#" type="error" 
					text="Event Name: #Arguments.Eventname#" > 
				<cflog file="#This.Name#" type="error" 
					text="Message: #Arguments.Exception#"> 
			<!--- Display an error message if there is a page context. ---> 
				<cfif NOT (Arguments.EventName IS "onSessionEnd") OR 
								(Arguments.EventName IS "onApplicationEnd")> 
					<cfoutput> 
						<h2>An unexpected error occurred.</h2> 
						<p>Please provide the following information to technical support:</p> 
						<p>Error Event: #Arguments.EventName#</p> 
						<p>Error details:<br> 
							<cfdump var=#Arguments.Exception#></p> 
					</cfoutput> 
				</cfif> 
		</cffunction>
	<!---On missing template--->
		<cffunction name="onMissingTemplate" returnType="boolean"> 
   			 <cfargument type="string" name="targetPage" required=true/> 
					<cftry> 
        				<!--- Log all errors. ---> 
        					<cflog type="error" file="error" text="Missing template: #Arguments.targetPage#">       				
        					 <cfinclude template= "gobalErrorHandler.cfm" >
        				<cfreturn true /> 
           				<cfcatch> 
            				<cfreturn false /> 
        				</cfcatch> 
    				</cftry> 
		</cffunction>
</cfcomponent>