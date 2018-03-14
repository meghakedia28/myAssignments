<cfcomponent output = "false">
	<!---getStudentsDetails : get the details of all the students--->
	<cffunction name = "studentsDetails" output = "false" returntype = "query">
		<cfquery name="studentsDetails">
			SELECT [user].[userId], [user].[firstName], [user].[lastName], [user].[emailid], [user].[contactNumber]
			FROM [user] JOIN [role] ON [user].[roleId] = [role].[roleId]
			WHERE [role].[name] = 'student' and active = 1
		</cfquery>
	<cfreturn studentsDetails>
	</cffunction>
	<cffunction name = "getStudentsDetails" output = "false" returntype = "Struct" returnformat = "JSON">
		<cfset var dataArray = ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var getList = studentsDetails() />
		<cfset var i = 1>
		<cfloop query = "#getList#">
			<cfset local.dataArray[i][1] = encodeForHTML(getList.firstName) & " " & encodeForHTML(getList.lastName) />
			<cfset local.dataArray[i][2] = encodeForHTML(getList.emailid) />
			<cfset local.dataArray[i][3] = encodeForHTML(getList.contactNumber) />
			<cfset local.dataArray[i][4] = "<a href = 'studentsResult.cfm?Id=#getList.scoreId#'>#resultSet.score# %</a>"/>
			<cfif now() LT quizDetails.startDateTime>
				<cfset local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-danger btn-sm'
				id = 'delete' name = 'delete' data-toggle = 'modal' data-target = '##rowDelete'
				data-id = '#quizQuestionList.questionId#'><i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			<cfelse>
				<cfset local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-danger btn-sm'
				data-toggle = 'modal' disabled><i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			</cfif>
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = local.dataArray>
		<cfreturn result>
	</cffunction>
</cfcomponent>