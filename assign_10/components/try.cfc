<cfcomponent >
	<cffunction name="accessFac" access="remote"  returntype="Any" returnformat="JSON">
		<cfquery name="retData">
			select * from [user] where roleId = 2
		</cfquery>
		<cfreturn serializeJSON(retData)>
	</cffunction>
</cfcomponent>