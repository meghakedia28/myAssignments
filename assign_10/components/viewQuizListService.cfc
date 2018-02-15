<cfcomponent output="false">
	<cffunction name="fetchQuizlist" output="false" access="public" returntype="Query">
		<cfargument name="id" required="true" type="numeric">
		<cfquery name="quizList">
			SELECT * FROM [quiz] WHERE [quiz].[userId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint">
			ORDER BY [quiz].[startDateTime] DESC;
		</cfquery>
		<cfreturn  quizList>
	</cffunction>
	<cffunction name="getQuizList" access="remote" output="false" returntype="Struct" returnformat="JSON">
		<cfargument name="id" required="true" type="numeric">
		<cfset dataArray=ArrayNew(2)>
		<cfset result["data"] = {}>
		<cfset quizList = fetchQuizlist(arguments.id) />
		<cfset i = 1>
		<cfloop query="#quizList#">"#DateFormat(now(),'yyyy/mm/dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#"
			<cfset dataArray[i][1] = encodeForHTML(quizList.name) />
			<cfset dataArray[i][2] = DateFormat(quizList.startDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(quizList.startDateTime,'HH:nn:ss') />
			<cfset dataArray[i][3] = DateFormat(quizList.endDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(quizList.endDateTime,'HH:nn:ss') />
			<cfset dataArray[i][4] = "<button type='button' class='btn btn-success btn-md' id = 'questionId' name='questionId'  data-toggle='modal' data-target='##quizQuestionList' >Questions</button>" />
			<cfif now() LT quizList.startDateTime>
				<cfset dataArray[i][5] = "<button type='button' class='btn btn-success btn-md' id = 'edit' name='edit' data-toggle='modal' data-target='##rowEdit' data-id='#quizList.quizId#'><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
				"<button type='button' class='btn btn-danger btn-md' id = 'delete' name='delete' data-toggle='modal' data-target='##rowDelete' data-id='#quizList.quizId#'><i class= 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			<cfelse>
				<cfset dataArray[i][5] = "<button type='button' class='btn btn-success btn-md' data-toggle='modal' disabled><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
				"<button type='button' class='btn btn-danger btn-md' data-toggle='modal' disabled><i class= 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>">
			</cfif>
			<cfset i = i + 1 />
		</cfloop>
		<cfset result.data = dataArray>
		<cfreturn result>
	</cffunction>
	<cffunction name="getQuestionList" output="false" access="public" returntype="query" >
		<cfargument name="Id" required="true" type="numeric">
		<cfquery name="questionList">
			SELECT [quizQuestion].[quizId], [questionBank].[questionId], [questionBank].[question],
			 [questionBank].[option1], [questionBank].[option2], [questionBank].[option3], [questionBank].[option4]
			 FROM [quizQuestion] JOIN [questionBank] ON [quizQuestion].[questionId] = [questionBank].[questionId]
			WHERE [quizQuestion].[quizId] = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_bigint"  >
		</cfquery>
		<cfreturn questionList>
	</cffunction>
</cfcomponent>