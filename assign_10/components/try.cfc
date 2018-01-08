<cfcomponent output="false">
	<cfset variables.aStruct = {name={}, id={}}>
	<cffunction name="a" access="remote" output="false" returntype="struct" returnformat="JSON">
		<cfset b()>
		<cfset c()>
		<cfdump var = #aStruct#>
		<cfreturn aStruct>
	</cffunction>
	<cffunction name="b" access="remote" output="false" returnformat="JSON" returntype="struct">
		<cfset variables.aStruct.name.bNAme= "bbb" />
		<cfset variables.aStruct.id.bId = "ibb">
		<cfreturn variables.aStruct >
	</cffunction>
	<cffunction name="c" access="public" output="false" returntype="struct">
		<cfset variables.aStruct.name.cNAme= "ccc" />
		<cfset variables.aStruct.id.cId = "icc">
		<cfreturn variables.aStruct >
	</cffunction>
</cfcomponent>