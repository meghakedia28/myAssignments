<cfcomponent output="false">
	<cffunction name="fetchQuizlist" output="false" access="remote" returntype="Query">
		<cfargument name="userId" required="true" type="numeric">
		<cfquery name="quizList">
			SELECT * FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_bigint">
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn  quizList>
	</cffunction>
	<cffunction name="getQuizList" access="remote" output="false" returntype="Struct" returnformat="JSON">
		<cfargument name="userId" required="true" type="numeric">
		<cfset var dataArray=ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var quizList = fetchQuizlist(arguments.userId) />
		<cfset var i = 1>
		<cfloop query="#quizList#">
			<cfset dataArray[i][1] = encodeForHTML(quizList.name) />
			<cfset dataArray[i][2] = DateFormat(quizList.startDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(quizList.startDateTime,'HH:nn:ss') />
			<cfset dataArray[i][3] = DateFormat(quizList.endDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(quizList.endDateTime,'HH:nn:ss') />
			<cfset dataArray[i][4] = "<a href='quizQuestions.cfm?Id=#quizList.quizId#'>Questions</a>" />
			<cfif now() LT quizList.startDateTime>
				<cfset dataArray[i][5] = "<button type='button' class='btn btn-success btn-sm' id = 'edit' name='edit' data-toggle='modal' data-target='##rowEdit' data-id='#quizList.quizId#'><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
				"<button type='button' class='btn btn-danger btn-sm' id = 'delete' name='delete' data-toggle='modal' data-target='##rowDelete' data-id='#quizList.quizId#'><i class= 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			<cfelse>
				<cfset dataArray[i][5] = "<button type='button' class='btn btn-success btn-sm'  disabled><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
				"<button type='button' class='btn btn-danger btn-sm' disabled><i class= 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			</cfif>
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>
	<cffunction name="fetchQuizQuestionList" output="false" access="public" returntype="query" >
		<cfargument name="quizId" required="true" type="numeric">
		<cfquery name="questionList">
			SELECT [quizQuestion].[quizId], [questionBank].[questionId], [questionBank].[question],
			 [questionBank].[option1], [questionBank].[option2], [questionBank].[option3], [questionBank].[option4],
			 [questionBank].[correctAnswer]
			 FROM [quizQuestion] JOIN [questionBank] ON [quizQuestion].[questionId] = [questionBank].[questionId]
			WHERE [quizQuestion].[quizId] = <cfqueryparam value="#arguments.quizId#" cfsqltype="cf_sql_bigint"  >
		</cfquery>
		<cfreturn questionList>
	</cffunction>
	<cffunction name="getQuizQuestionList" access="remote" output="false" returntype="Struct" returnformat="JSON">
		<cfargument name="quizId" required="true" type="numeric">
		<cfargument name="userId" required="true" type="numeric">
		<cfset var dataArray=ArrayNew(2)>
		<cfset var result["data"] = {}>
		<cfset var quizQuestionList = fetchQuizQuestionList(arguments.quizId) />
		<cfset quizlist = fetchQuizlist(userId)>
		<cfquery dbtype="query" name="quizDetails">
			SELECT * FROM quizList
			WHERE quizId = <cfqueryparam value="#arguments.quizId#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfset var i = 1>
		<cfloop query="#quizQuestionList#">
			<cfset dataArray[i][1] = encodeForHTML(quizQuestionList.question) />
			<cfset dataArray[i][2] = encodeForHTML(quizQuestionList.option1) />
			<cfset dataArray[i][3] = encodeForHTML(quizQuestionList.option2) />
			<cfset dataArray[i][4] = encodeForHTML(quizQuestionList.option3) />
			<cfset dataArray[i][5] = encodeForHTML(quizQuestionList.option4) />
			<cfset answer = encodeForHtml(quizQuestionList.correctAnswer)>
				<cfif answer EQ 'option1'>
					<cfset dataArray[i][6] = 'Option A'>
				<cfelseif answer EQ 'option2'>
					<cfset dataArray[i][6] = 'Option B'>
				<cfelseif answer EQ 'option3'>
					<cfset dataArray[i][6] = 'Option C'>
				<cfelseif answer EQ 'option4'>
					<cfset dataArray[i][6] = 'Option D'>
				</cfif>
			<cfif now() LT quizDetails.startDateTime>
				<cfset dataArray[i][7] = "<button type='button' class='btn btn-danger btn-sm' id = 'delete' name='delete' data-toggle='modal' data-target='##rowDelete' data-id='#quizQuestionList.questionId#'><i class= 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			<cfelse>
				<cfset dataArray[i][7] ="<button type='button' class='btn btn-danger btn-sm' data-toggle='modal' disabled><i class= 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			</cfif>
			<cfset local.i = local.i + 1 />
		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>

</cfcomponent>