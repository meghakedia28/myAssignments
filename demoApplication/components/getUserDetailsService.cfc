<!---
NAME : getUserDetailsService.cfc
CREATED BY : megha Kedia
USE: get the details of user by id and roles --->

<cfcomponent output = "false">
	<!---getUserDetails : get the details of the user by its salt--->
	<cffunction name = "getUserDetails" access = "public" output = "false" returntype = "query">
		<cfargument name = "Id" required = "true" type = "string" >
		<cfquery name = "userDetails">
			SELECT [active], [firstName], [lastName], [reset] FROM [user]
			WHERE [salt] = <cfqueryparam value = "#arguments.Id#" cfsqltype = "cf_sql_varchar" >
		</cfquery>
		<cfreturn userDetails >
	</cffunction>
	<!---getStudentsDetails : get the details of all the students--->
	<cffunction name = "getStudentsDetails" output = "false" returntype = "query">
		<cfquery name="studentsDetails">
			SELECT [user].[userId], [user].[firstName], [user].[lastName], [user].[emailid], [user].[contactNumber]
			FROM [user] JOIN [role] ON [user].[roleId] = [role].[roleId]
			WHERE [role].[name] = <cfqueryparam value = 'student' cfsqltype = "cf_sql_varchar"> AND
			 [user].[active] = <cfqueryparam value = "1" cfsqltype = "cf_sql_integer">
		</cfquery>
	<cfreturn studentsDetails>
	</cffunction>

	<!---getUserDetails : get user details by its id--->
	<cffunction name = "getUserDetailsById" access = "public" output = "false" returntype = "query">
		<cfargument name = "Id" required = "true" type = "numeric" >
		<cfquery name = "userDetails">
			SELECT [active], [firstName], [lastName], [reset] FROM [user]
			WHERE [userId] = <cfqueryparam value = "#arguments.Id#" cfsqltype = "cf_sql_varchar" >
		</cfquery>
		<cfreturn userDetails >
	</cffunction>
	<cffunction name = "getFacultyList" access = "remote" returntype = "any" returnformat = "JSON">
		<cfquery name = "fetchListOfFaculties">
			 SELECT [user].[userId], [user].[active], [user].[firstName], [user].[lastName],
			 		[user].[emailid], [user].[contactNumber], [subject].[name]
			        FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
					JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
					WHERE [user].[roleId] = 2
		</cfquery>
		<cfset var result["data"] = {}>
		<cfset var dataArray = ArrayNew(2)>
		<cfset i = 1>
			<cfloop query = #fetchListOfFaculties#>
				<cfset local.dataArray[i][1] = encodeForHtml(fetchListOfFaculties.name)>
				<cfset local.dataArray[i][2] = encodeForHtml(fetchListOfFaculties.firstName & " " & fetchListOfFaculties.lastName)>
				<cfset local.dataArray[i][3] = encodeForHtml(fetchListOfFaculties.emailid)>
				<cfif fetchListOfFaculties.active EQ 1 >
					<cfset local.dataArray[i][4] = "true" />
				<cfelse>
					<cfset local.dataArray[i][4] = "false" />
				</cfif>
				<cfset local.dataArray[i][5] = encodeForHtml(fetchListOfFaculties.contactNumber)>
				<cfset local.dataArray[i][6] = "<button type = 'button' class = 'btn btn-success btn-md'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
					data-id = '#fetchListOfFaculties.userId#'><i class = 'glyphicon glyphicon-pencil'>&nbsp</i>
					edit</button>" />
				<cfset i = i+1 />
	 		</cfloop>
		<cfset local.result.data = dataArray>
		<cfreturn local.result>
	</cffunction>
	<cffunction name = "getStudentsList" access = "remote" returntype = "any" returnformat = "JSON">
		<cfquery name = "fetchListOfStudents">
			SELECT [user].[userId], [user].[active], [user].[firstName], [user].[lastName],
			[user].[emailid], [user].[contactNumber] FROM [user]
			WHERE [user].[roleId] = 3;
		</cfquery>
		<cfset var result["data"] = {}>
		<cfset var dataArray = ArrayNew(2)>
		<cfset i = 1>
			<cfloop query = #fetchListOfStudents# >
				<cfset local.dataArray[i][1] = encodeForHtml(fetchListOfStudents.firstName & ' ' & fetchListOfStudents.lastName)>
				<cfset local.dataArray[i][2] = encodeForHtml(fetchListOfStudents.emailid)>
				<cfif fetchListOfStudents.active EQ 1 >
					<cfset local.dataArray[i][3] = "Yes" />
				<cfelse>
					<cfset local.dataArray[i][3] = "No" />
				</cfif>
				<cfset local.dataArray[i][4] = encodeForHtml(fetchListOfStudents.contactNumber) />
				<cfset local.dataArray[i][5] = "<button type = 'button' class = 'btn btn-success btn-md'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
					data-id = '#fetchListOfStudents.userId#'><i class = 'glyphicon glyphicon-pencil'>&nbsp</i>edit</button>" />
				<cfset i = i+1 />
 			</cfloop>
		<cfset local.result.data = dataArray>
		<cfreturn local.result>
	</cffunction>
</cfcomponent>