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
</cfcomponent>