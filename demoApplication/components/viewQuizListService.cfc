<!---
NAME : viewQuizListService.cfc
CREATED BY : megha Kedia
USE: used to get the list of quiz and quiz questions--->

<cfcomponent output = "false">
	<!---getQuizlist : used to get the list of all quiz set by a faculty--->
	<cffunction name = "getQuizlist" output = "false" access = "remote" returntype = "query">
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfquery name = "quizList">
			SELECT * FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam
			value = "#arguments.userId#" cfsqltype = "cf_sql_bigint">
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn  quizList>
	</cffunction>
	<!---formatQuizList : format the quiz list to be displayed in datatable --->
	<cffunction name = "formatQuizList" access = "remote" output = "false" returntype = "Struct" returnformat = "JSON">
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfset var dataArray = ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var quizList = getQuizlist(arguments.userId) />
		<cfset var i = 1>
		<cfloop query = "#quizList#">
			<cfset local.dataArray[i][1] = encodeForHTML(quizList.name) />
			<cfset local.dataArray[i][2] = DateFormat(quizList.startDateTime,'yyyy/mm/dd') &
				' ' & TimeFormat(quizList.startDateTime,'HH:nn:ss') />
			<cfset local.dataArray[i][3] = DateFormat(quizList.endDateTime,'yyyy/mm/dd') &
				' ' & TimeFormat(quizList.endDateTime,'HH:nn:ss') />
			<cfset local.dataArray[i][4] = "<a href = 'quizQuestions.cfm?Id=#quizList.quizId#'>Questions</a>" />
			<cfif now() LT quizList.startDateTime>
				<cfset local.dataArray[i][5] = "<button type = 'button' class = 'btn btn-success btn-sm'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit' data-id = '#quizList.quizId#'>
					<i class = 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
					"<button type = 'button' class = 'btn btn-danger btn-sm' id = 'delete'
					name = 'delete' data-toggle = 'modal' data-target = '##rowDelete' data-id = '#quizList.quizId#'>
					<i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			<cfelse>
				<cfset local.dataArray[i][5] = "<button type = 'button' class = 'btn btn-success btn-sm'  disabled>
					<i class = 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
					"<button type = 'button' class = 'btn btn-danger btn-sm' disabled>
					<i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			</cfif>
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = local.dataArray>
		<cfreturn result>
	</cffunction>
	<!---getQuizQuestionList : get the quiz questions for a perticular test--->
	<cffunction name = "getQuizQuestionList" output = "false" access = "public" returntype = "query" >
		<cfargument name = "quizId" required = "true" type = "numeric">
		<cfquery name = "questionList">
			SELECT [quizQuestion].[quizId], [questionBank].[questionId], [questionBank].[question],
			 [questionBank].[option1], [questionBank].[option2], [questionBank].[option3], [questionBank].[option4],
			 [questionBank].[correctAnswer]
			 FROM [quizQuestion] JOIN [questionBank] ON [quizQuestion].[questionId] = [questionBank].[questionId]
			WHERE [quizQuestion].[quizId] = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint"  >
		</cfquery>
		<cfreturn questionList>
	</cffunction>
	<!---formatQuizQuestionList : format the quiz questions set by a quiz--->
	<cffunction name = "formatQuizQuestionList" access = "remote" output = "false" returntype = "Struct" returnformat = "JSON">
		<cfargument name = "quizId" required = "true" type = "numeric">
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfset var dataArray = ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var quizQuestionList = getQuizQuestionList(arguments.quizId) />
		<cfset quizlist = getQuizlist(userId)>
		<cfquery dbtype = "query" name = "quizDetails">
			SELECT * FROM quizList
			WHERE quizId = <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">
		</cfquery>
		<cfset var i = 1>
		<cfloop query = "#quizQuestionList#">
			<cfset local.dataArray[i][1] = encodeForHTML(quizQuestionList.question) />
			<cfset local.dataArray[i][2] = encodeForHTML(quizQuestionList.option1) />
			<cfset local.dataArray[i][3] = encodeForHTML(quizQuestionList.option2) />
			<cfset local.dataArray[i][4] = encodeForHTML(quizQuestionList.option3) />
			<cfset local.dataArray[i][5] = encodeForHTML(quizQuestionList.option4) />
			<cfset var answer = encodeForHtml(quizQuestionList.correctAnswer)>
				<cfif local.answer EQ "option1">
					<cfset local.dataArray[i][6] = "Option A">
				<cfelseif local.answer EQ "option2">
					<cfset local.dataArray[i][6] = "Option B">
				<cfelseif local.answer EQ "option3">
					<cfset local.dataArray[i][6] = "Option C">
				<cfelseif local.answer EQ "option4">
					<cfset local.dataArray[i][6] = "Option D">
				</cfif>
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