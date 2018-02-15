<cfcomponent output="false">
	<cfset resultSet["data"] = {} />
	<cffunction name="getQuestions" access="public" returntype="Query">
		<cfargument name="userId" required="true" type="numeric">
		<cfquery name = "questions">
			Select questionId,question,option1,option2,option3,option4,correctAnswer
			FROM [questionBank]
			WHERE userId =<cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_bigint" />
		</cfquery>
		<cfreturn questions>
	</cffunction>
	<cffunction name="viewQuestionBank" access="remote" returntype="Struct" returnformat="JSON">
		<cfargument name="id" required="true" type="numeric" >
		<cfset var result["data"]={}>
		<cfset var listOfData = getQuestions (arguments.id) />
		<cfset dataArray=ArrayNew(2)>
		<cfset var i = 1>
		<cfloop query = #local.listOfData# >
				<cfset dataArray[i][1] = encodeForHtml(listOfData.question)>
				<cfset dataArray[i][2] = encodeForHtml(listOfData.option1)>
				<cfset dataArray[i][3] = encodeForHtml(listOfData.option2)>
				<cfset dataArray[i][4] = encodeForHtml(listOfData.option3)>
				<cfset dataArray[i][5] = encodeForHtml(listOfData.option4)>
				<cfset dataArray[i][6] = encodeForHtml(listOfData.correctAnswer)>
				<cfif createObject("component",'assign_10/components/editDeleteQuestionsService').checkEditability(listOfData.questionId) >
					<cfset dataArray[i][7] = "<button type='button' class='btn btn-success btn-md' id = 'edit' name='edit' data-toggle='modal' data-target='##rowEdit' data-id='#listOfData.questionId#'><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>edit</button>" />
				<cfelse>
					<cfset dataArray[i][7] = "<button type='button' class='btn btn-success btn-md' disabled><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>edit</button>" />
				</cfif>
			<cfset local.i = local.i+1 />
 		</cfloop>
		<cfset result.data = dataArray >
		<cfreturn result>
	</cffunction>
	<cffunction name="setQuizQuestion" access="remote" returntype="Struct" returnformat="JSON">
		<cfargument name="id" required="true" type="query">
		<cfset dataArray=ArrayNew(2)>
		<cfset var i = 1>
		<cfloop query = #arguments.listOfData# >
				<cfset dataArray[i][1] = "<input type='checkbox' class='question' name='questionId'  id ='questionId_#listOfData.questionId#' value='#listOfData.questionId#'></input>">
				<cfset dataArray[i][2] = encodeForHtml(listOfData.question)>
				<cfset dataArray[i][3] = encodeForHtml(listOfData.option1)>
				<cfset dataArray[i][4] = encodeForHtml(listOfData.option2)>
				<cfset dataArray[i][5] = encodeForHtml(listOfData.option3)>
				<cfset dataArray[i][6] = encodeForHtml(listOfData.option4)>
				<cfset dataArray[i][7] = encodeForHtml(listOfData.correctAnswer)>
			<cfset local.i = local.i+1 />
 		</cfloop>
		<cfreturn dataArray>
	</cffunction>
</cfcomponent>