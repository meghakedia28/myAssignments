<cfcomponent output="false">
	<cfset this.name = "Demo"/>
	<cfset this.applicationTimeout = #createtimespan(0,0,0,5)#/>
	<cfset this.sessionManagement = "true"/>
	<cfset this.sessionTimeout = #createtimespan(0,0,0,5)# />
 	<cfset this.setclientcookies = "true" />
	<cfset this.sessioncookie.secure = "true" />
	<cfset this.loginStorage = "session">

	<cffunction name="OnApplicationStart" returntype="void">
		<cfdump var = 'OnApplicationStart'>
	</cffunction>
	<cffunction name="OnSessionStart" returntype="void"  >
		<cfdump var = 'OnSessionStart'>
	</cffunction>
	<cffunction name="OnRequest" returntype="void"  >
		<cfdump var = 'OnRequest'>
	</cffunction>
	<cffunction name="OnRequestStart" returntype="void"  >
		<cfdump var = 'OnRequestStart'>
	</cffunction>
</cfcomponent>