<cfcomponent output="false">
	<cfset this.name = "DemoApplication"/>
	<cfset this.applicationTimeout = #createtimespan(0,7,0,0)#/>
	<cfset this.datasource = "demoProject"/>
	<cfset this.sessionManagement = true/>
	<cfset this.sessionTimeout = #createtimespan(0,5,0,0)# />
 	<cfset this.setclientcookies = true />
	<cfset this.sessioncookie.secure = true />

	<cffunction name="OnApplicationStart" returntype="boolean">
		<cfreturn true>
	</cffunction>
	<cffunction name="OnSessionStart" returntype="void"  >
	</cffunction>
	<cffunction name="OnRequestStart" returntype="boolean"  >
		<cfargument name="targetPage" type="string" required="true" >
			<cfreturn true>
	</cffunction>
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
		<!---On error--->
	<!--- <cffunction name="OnError" returntype="void" access="public" > --->
<!--- 		<cfargument name="Exception" required=true/> --->
<!---    		<cfargument name="EventName" type="String" required=true/> --->
<!--- 			<cflog file="#This.Name#" type="error" --->
<!--- 				text="Event Name: #Arguments.Eventname#" > --->
<!--- 			<cflog file="#This.Name#" type="error" --->
<!--- 				text="Message: #Arguments.Exception#"> --->
<!--- 		<!--- Display an error message if there is a page context. ---> --->
<!--- 			<cfif NOT (Arguments.EventName IS "onSessionEnd") --->
<!--- 					OR (Arguments.EventName IS "onApplicationEnd")> --->
<!--- 				<cfoutput> --->
<!--- 					<h2>An unexpected error occurred.</h2> --->
<!--- 					<p>Please wait for some time and try again:</p> --->
<!--- 				</cfoutput> --->
<!--- 			</cfif> --->
<!--- 	</cffunction> --->
</cfcomponent>