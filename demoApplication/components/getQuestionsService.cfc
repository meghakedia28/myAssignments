<!---
NAME : getQuestionsService.cfc
CREATED BY : megha Kedia
USE: used to view all the question in the faculty portal depending upon the conditions, on where to view
 the set of question changes --->

<cfcomponent output = "false">
	<!---getQuestions : get question list for a user and for a perticular quiz--->
	<cffunction name = "getQuestions" access = "public" returntype = "Query"
				hint = "get question list set by a perticular user">
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfargument name = "quizId" required = "false" type = "numeric" default = "0">
		<cfquery name = "questions">
			Select questionId,question,option1,option2,option3,option4,correctAnswer
			FROM [questionBank]
			WHERE [questionBank].[userId] = <cfqueryparam value = "#arguments.userId#" cfsqltype = "cf_sql_bigint" />
			AND [questionBank].[questionId] NOT IN
			(SELECT [questionId] FROM [quizQuestion] WHERE [quizQuestion].[quizId] =
			 <cfqueryparam value = "#arguments.quizId#" cfsqltype = "cf_sql_bigint">)
		</cfquery><!---this subquery is written by keeping the folowing condition in mind :
					while viewing quiz(for upcoming quies) the questions can be added or deleted,
					(in viewQuizQuestion.cfm), their the feature of "addQuestions" will contain
					only those question which are not set for the quiz,
					hence the query is filtered by quizId also in this case only--->
		<cfreturn questions>
	</cffunction>
	<!---viewQuestionBank : get all the questions set by a faculty, then formats them to send to the datatable--->
	<cffunction name = "viewQuestionBank" access = "remote" returntype = "Struct"
				returnformat = "JSON" hint = "use the getQuestion and formate it before returning">
		<cfargument name = "userId" required = "true" type = "numeric" >
		<cfset var result["data"] = {}>
		<cfset var listOfData = getQuestions (arguments.userId) />
		<cfset var dataArray = ArrayNew(2)>
		<cfset var i = 1>
		<cfset var answer = "">
		<cfloop query = #local.listOfData# >
				<cfset local.dataArray[i][1] = encodeForHtml(listOfData.question)>
				<cfset local.dataArray[i][2] = encodeForHtml(listOfData.option1)>
				<cfset local.dataArray[i][3] = encodeForHtml(listOfData.option2)>
				<cfset local.dataArray[i][4] = encodeForHtml(listOfData.option3)>
				<cfset local.dataArray[i][5] = encodeForHtml(listOfData.option4)>
				<cfset local.answer = encodeForHtml(listOfData.correctAnswer)>
				<cfif local.answer EQ "option1">
					<cfset local.dataArray[i][6] = "Option A">
				<cfelseif local.answer EQ "option2">
					<cfset local.dataArray[i][6] = "Option B">
				<cfelseif local.answer EQ "option3">
					<cfset local.dataArray[i][6] = "Option C">
				<cfelseif local.answer EQ "option4">
					<cfset local.dataArray[i][6] = "Option D">
				</cfif>
				<cfif createObject("component","demoApplication/components/editDeleteQuestionsService").checkEditability(listOfData.questionId) >
					<cfset local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-success btn-sm'
						id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
						data-id = '#listOfData.questionId#'><i class = 'glyphicon glyphicon-pencil'>
						</i>edit</button>"&"<button type = 'button' class = 'btn btn-danger btn-sm'
						id = 'delete' name = 'delete' data-toggle = 'modal' data-target = '##rowDelete'
						data-id = '#listOfData.questionId#' ><i class = 'glyphicon glyphicon-remove'>
						</i>Delete</button>" />
				<cfelse>
					<cfset local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-success btn-sm' disabled>
						<i class = 'glyphicon glyphicon-pencil'></i>edit</button>"&
						"<button type = 'button' class = 'btn btn-danger btn-sm' data-toggle = 'modal' disabled>
						<i class = 'glyphicon glyphicon-remove'></i>Delete</button>"/>
				</cfif>
			<cfset local.i = local.i+1 />
 		</cfloop>
		<cfset result.data = local.dataArray >
		<cfreturn result>
	</cffunction>
	<!---formatQuizQuestion : used to get the "addQuestion" feature in (viewQuizQuestion.cfm in viewQuiz.cfm)
		here only the questions which are not set in the quiz will be available to add--->
	<cffunction name = "formatQuizQuestion" access = "remote" returntype = "Struct"
				returnformat = "JSON" hint = "format of question list while settinf quiz">
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfargument name = "quizId" required = "false" type = "numeric" default = "0">
		<cfset var listOfData = getQuestions (arguments.userId, arguments.quizId) />
		<cfset var result["data"] = {}>
		<cfset var dataArray = ArrayNew(2)>
		<cfset var answer = "">
		<cfset var i = 1>
		<cfloop query = #local.listOfData# >
				<cfset local.dataArray[i][1] = "<input type = 'checkbox' class = 'question'
												name = 'questionId'  id = 'questionId_#listOfData.questionId#'
												value = '#listOfData.questionId#'></input>">
				<cfset local.dataArray[i][2] = encodeForHtml(listOfData.question)>
				<cfset local.dataArray[i][3] = encodeForHtml(listOfData.option1)>
				<cfset local.dataArray[i][4] = encodeForHtml(listOfData.option2)>
				<cfset local.dataArray[i][5] = encodeForHtml(listOfData.option3)>
				<cfset local.dataArray[i][6] = encodeForHtml(listOfData.option4)>
				<cfset local.answer = encodeForHtml(listOfData.correctAnswer)>
				<cfif local.answer EQ "option1">
					<cfset local.dataArray[i][7] = "Option A">
				<cfelseif local.answer EQ "option2">
					<cfset local.dataArray[i][7] = "Option B">
				<cfelseif local.answer EQ "option3">
					<cfset local.dataArray[i][7] = "Option C">
				<cfelseif local.answer EQ "option4">
					<cfset local.dataArray[i][7] = "Option D">
				</cfif>
			<cfset local.i = local.i+1 />
 		</cfloop>
		<cfset result.data = local.dataArray>
		<cfreturn result>
	</cffunction>
	<!---getQuestionDetails : used to get the question and format it to display in datatables--->
	<cffunction name = "getQuestionDetails" access = "remote" returntype = "Struct"
				returnformat = "JSON" hint = "to populate the data ">
		<cfargument name = "questionId" required = "true" type = "numeric" >
		<cfargument name = "userId" required = "true" type = "numeric">
		<cfset getQuestionList = getQuestions(arguments.userId)>
		<cfquery dbtype = "query" name = "getDetails">
			Select * FROM getQuestionList
			WHERE questionId = <cfqueryparam value = "#arguments.questionId#" cfsqltype = "cf_sql_bigint">
		</cfquery>
		<cfset var data = {}>
		<cfloop query = "getDetails">
			<cfset local.data["question"] = getDetails.question>
			<cfset local.data["optiona"] = getDetails.option1>
			<cfset local.data["optionb"] = getDetails.option2>
			<cfset local.data["optionc"] = getDetails.option3>
			<cfset local.data["optiond"] = getDetails.option4>
			<cfset local.data["answer"] = getDetails.correctAnswer>
			<cfset local.data["questionId"] = getDetails.questionId>
		</cfloop>
		<cfreturn data>
	</cffunction>
</cfcomponent>