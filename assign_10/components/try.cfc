<cfcomponent output="false">
	<cfset variables.aStruct = {name={}, id={}}>
	<cffunction name="a" access="remote" output="false" returntype="struct" returnformat="JSON">
		<cfset obj = b()>
	</cffunction>
	<cffunction name="b" access="remote" output="false" returnformat="JSON" returntype="struct">
		<cfset variables.aStruct.name.bNAme= "bbb" />
		<cfset avriables.aStruct.id.bId = "idd">
	</cffunction>
</cfcomponent>