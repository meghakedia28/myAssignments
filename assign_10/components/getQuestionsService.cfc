<cfcomponent output="false">
	<cffunction name="getQuestions" access="public" returntype="Query" hint="get question list set by a perticular user">
		<cfargument name="userId" required="true" type="numeric">
		<cfargument name="quizId" required="false" type="numeric" default="0">
		<cfquery name = "questions">
			Select questionId,question,option1,option2,option3,option4,correctAnswer
			FROM [questionBank]
			WHERE [questionBank].[userId] =<cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_bigint" />
			AND [questionBank].[questionId] NOT IN
			(SELECT [questionId] FROM [quizQuestion] WHERE [quizQuestion].[quizId] =
			 <cfqueryparam value="#arguments.quizId#" cfsqltype="cf_sql_bigint">)
		</cfquery>
		<cfreturn questions>
	</cffunction>
	<cffunction name="viewQuestionBank" access="remote" returntype="Struct" returnformat="JSON" hint="use the getQuestion and formate it before returning">
		<cfargument name="userId" required="true" type="numeric" >
		<cfset var result["data"]={}>
		<cfset var listOfData = getQuestions (arguments.userId) />
		<cfset dataArray=ArrayNew(2)>
		<cfset var i = 1>
		<cfloop query = #local.listOfData# >
				<cfset dataArray[i][1] = encodeForHtml(listOfData.question)>
				<cfset dataArray[i][2] = encodeForHtml(listOfData.option1)>
				<cfset dataArray[i][3] = encodeForHtml(listOfData.option2)>
				<cfset dataArray[i][4] = encodeForHtml(listOfData.option3)>
				<cfset dataArray[i][5] = encodeForHtml(listOfData.option4)>
				<cfset answer = encodeForHtml(listOfData.correctAnswer)>
				<cfif answer EQ 'option1'>
					<cfset dataArray[i][6] = 'Option A'>
				<cfelseif answer EQ 'option2'>
					<cfset dataArray[i][6] = 'Option B'>
				<cfelseif answer EQ 'option3'>
					<cfset dataArray[i][6] = 'Option C'>
				<cfelseif answer EQ 'option4'>
					<cfset dataArray[i][6] = 'Option D'>
				</cfif>
				<cfif createObject("component",'assign_10/components/editDeleteQuestionsService').checkEditability(listOfData.questionId) >
					<cfset dataArray[i][7] ="<button type='button' class='btn btn-success btn-sm' id = 'edit' name='edit' data-toggle='modal' data-target='##rowEdit' data-id='#listOfData.questionId#'><i class= 'glyphicon glyphicon-pencil'></i>edit</button>"&
					"<button type='button' class='btn btn-danger btn-sm' id = 'delete' name='delete' data-toggle='modal' data-target='##rowDelete' data-id='#listOfData.questionId#' ><i class= 'glyphicon glyphicon-remove'></i>Delete</button>" />
				<cfelse>
					<cfset dataArray[i][7] = "<button type='button' class='btn btn-success btn-sm' disabled><i class= 'glyphicon glyphicon-pencil'></i>edit</button>"&
					"<button type='button' class='btn btn-danger btn-sm' data-toggle='modal' disabled><i class= 'glyphicon glyphicon-remove'></i>Delete</button>"/>
				</cfif>
			<cfset local.i = local.i+1 />
 		</cfloop>
		<cfset result.data = dataArray >
		<cfreturn result>
	</cffunction>
	<cffunction name="setQuizQuestion" access="remote" returntype="Struct" returnformat="JSON" hint="format of question list while settinf quiz">
		<cfargument name="userId" required="true" type="numeric">
		<cfargument name="quizId" required="false" type="numeric" default="0">
		<cfset var listOfData = getQuestions (arguments.userId, arguments.quizId) />
		<cfset var result["data"]={}>
		<cfset dataArray=ArrayNew(2)>
		<cfset var i = 1>
		<cfloop query = #local.listOfData# >
				<cfset dataArray[i][1] = "<input type='checkbox' class='question' name='questionId'  id ='questionId_#listOfData.questionId#' value='#listOfData.questionId#'></input>">
				<cfset dataArray[i][2] = encodeForHtml(listOfData.question)>
				<cfset dataArray[i][3] = encodeForHtml(listOfData.option1)>
				<cfset dataArray[i][4] = encodeForHtml(listOfData.option2)>
				<cfset dataArray[i][5] = encodeForHtml(listOfData.option3)>
				<cfset dataArray[i][6] = encodeForHtml(listOfData.option4)>
				<cfset dataArray[i][7] = encodeForHtml(listOfData.correctAnswer)>
			<cfset local.i = local.i+1 />
 		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>
	<cffunction name="getQuestionDetails" access="remote" returntype="Struct" returnformat="JSON" hint="to populate the data in modal">
		<cfargument name="questionId" required="true" type="numeric" >
		<cfargument name="userId" required="true" type="numeric">
		<cfset getQuestionList = getQuestions(arguments.userId)>
		<cfquery dbtype="query" name="getDetails">
			Select * FROM getQuestionList
			WHERE questionId = <cfqueryparam value="#arguments.questionId#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfset var data = {}>
		<cfloop query="getDetails">
			<cfset data["question"] = getDetails.question>
			<cfset data["optiona"] = getDetails.option1>
			<cfset data["optionb"] = getDetails.option2>
			<cfset data["optionc"] = getDetails.option3>
			<cfset data["optiond"] = getDetails.option4>
			<cfset data["answer"] = getDetails.correctAnswer>
			<cfset data["questionId"] = getDetails.questionId>
		</cfloop>
		<cfreturn data>
	</cffunction>
</cfcomponent>