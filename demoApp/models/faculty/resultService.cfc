/*----------------------------------------------------------------------------------------------------------
						FileName    : resultService.cfc
						Created By  : Megha Kedia
						DateCreated : 23-March-2018
						Description : contains functions which is related to result services.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	resultService function init(){

		return this;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchFacultyResultSet
Description    : fetches the result set for faculties,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchFacultyResultSet(required struct data){
		if (structKeyExists(arguments.data,'listOfQuizId')){
			var quizIds = #listToArray(arguments.data.listOfQuizId, ",", false)#;
		}
		var resultSetService = new query();
		local.resultSetService.addParam(name = "userId", value = "#arguments.data.userId#",
		 cfsqltype = "cf_sql_bigint");
		local.resultSetService.setName("resultSet");
		 var sql = "SELECT [quiz].[name], [quiz].[startDateTime], [quiz].[endDateTime],
						[quiz].[quizId], [user].[firstName], [user].[lastName], [scoreDetails].[score],
						[scoreDetails].[scoreId], [scoreDetails].[userId], RANK () OVER
						(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
						FROM [scoreDetails] JOIN [quiz] ON [quiz].[quizId] =
						[scoreDetails].[quizId] JOIN [user] ON [user].[userId] = [scoreDetails].[userId]
						WHERE [quiz].[userId] = :userId";

		if (structKeyExists(data,"studentsId")){
			local.resultSetService.addParam(name = "studentsId", value = "#arguments.data.studentsId#",
			cfsqltype = "cf_sql_bigint");
			var sql &= " AND [scoreDetails].[userId] = :studentsId";
		}
		if (structKeyExists(arguments.data, 'listOfQuizId')){
				local.sql = sql & " AND quiz.quizId IN (0";
				for (id in local.quizIds){
					local.sql = sql & ", #id#";
				}
				local.sql = sql & " )";
			}
		local.sql = sql & " ORDER BY [quiz].[startDateTime] DESC, RANK, [user].[firstName]";
		local.resultSetService.setSQL(local.sql);
		resultSet = local.resultSetService.execute().getResult();
		return resultSet;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : getFacultyResultSet
Description    : fetches the result set and formates it,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getFacultyResultSet(required struct data){
		var resultSet = fetchFacultyResultSet(data);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var count = 1;
		for (row in resultSet){
			local.dataArray[count][1] = encodeForHTML(row.name);
			local.dataArray[count][2] = dateFormat(row.startDateTime,'yyyy/mm/dd') & ' '
				& timeFormat(row.startDateTime,'HH:nn:ss');
			local.dataArray[count][3] = dateFormat(row.endDateTime,'yyyy/mm/dd') & ' '
				& timeFormat(row.endDateTime,'HH:nn:ss');
			local.dataArray[count][4] = encodeForHTML(row.firstName) &' '& encodeForHTML(row.lastName);
			local.dataArray[count][5] =
				"<a href = '../faculty/studentsReport?Id=#row.scoreId#'>#row.score# %</a>";
			local.dataArray[count][6] = encodeForHTML(row.RANK);
			local.count = local.count + 1;
		}
		local.result.data = dataArray;
		return local.result;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : checkStartDateTime
Description    : validates the start time of the test,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	//function getFacultyResultSet(required struct dataSet){
//		var resultSet = fetchFacultyResultSet(arguments.dataSet);
//		var dataArray = ArrayNew(2);
//		var result["data"] = {} ;
//		var count = 1;
//		for (row in resultSet){
//			local.dataArray[count][1] = encodeForHTML(row.name);
//			local.dataArray[count][2] = dateFormat(row.startDateTime,'yyyy/mm/dd') & ' ' &
//			timeFormat(row.startDateTime,'HH:nn:ss');
//			local.dataArray[count][3] = dateFormat(row.endDateTime,'yyyy/mm/dd') & ' ' &
//			timeFormat(row.endDateTime,'HH:nn:ss');
//			local.dataArray[count][4] = encodeForHTML(row.firstName) &' '& encodeForHTML(row.lastName);
//			local.dataArray[count][5] =	"<a href = '#arguments.dataSet.event.buildLink( "faculty.studentsReport?Id=#row.scoreId#" )#'>#row.score# %</a>";
//			local.dataArray[count][6] = encodeForHTML(row.RANK);
//			local.count = local.count + 1;
//		}
//		local.result.data = dataArray;
//		return local.result;
//	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : checkStartDateTime
Description    : validates the start time of the test,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchScoreIds(required numeric userId){
		var scoreIdService = new query();
		local.scoreIdService.addParam (name = "userId", value = "#arguments.userId#",
			cfsqltype = "cf_sql_bigint");
		local.scoreIdService.setName("scoreIds");
		local.scoreIdService.setSQL ("SELECT [scoreDetails].[scoreId] FROM [scoreDetails] JOIN [quiz]
											ON [scoreDetails].[quizId] = [quiz].[quizId]
											WHERE [quiz].[userId] = :userId");
		scoreIds = local.scoreIdService.execute().getResult();
		return scoreIds;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchResultDetails
Description    : fetches details for a perticular result,
Arguments      : numeric scoreId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchResultDetails (required numeric scoreId){
		var resultDetailsService = new query();
		local.resultDetailsService.addParam (name = "scoreId", value = "#arguments.scoreId#",
			cfsqltype = "cf_sql_bigint");
		local.resultDetailsService.setName("resultDetails");
		local.resultDetailsService.setSQL ("SELECT [user].[firstName], [user].[lastName] , [quiz].[quizId],
												[quiz].[name] FROM [scoreDetails] JOIN
												[quiz] ON [scoreDetails].[quizId] = [quiz].[quizId]
												JOIN [user] ON [user].[userId] = [scoreDetails].[userId]
												WHERE [scoreDetails].[scoreId] = :scoreId");
		resultDetails = local.resultDetailsService.execute().getResult();
		return resultDetails;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : generateReport
Description    : generates report of students for a perticular quiz,
Arguments      : numeric scoreId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function generateReport(required numeric scoreId){
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var option = '';
		var fetchReportService = new query();
		local.fetchReportService.addParam (name = "scoreId", value = "#arguments.scoreId#",
			cfsqltype = "cf_sql_bigint");
		local.fetchReportService.setName("fetchReport");
		local.fetchReportService.setSQL ("SELECT [scoreDetails].[answerReport] FROM [scoreDetails]
												WHERE [scoreDetails].[scoreId] = :scoreId");
		fetchReport = local.fetchReportService.execute().getResult();
		var i = 1;
		var reportList = listToArray(#fetchReport.answerReport#, ";",true,true);
		for (set in reportList){
			if (set != ''){
				var arr = listToArray (#set#, ",",true,true);
			 	var reportDetailsService = new query();
				local.reportDetailsService.addParam (name = "id", value = "#arr[1]#",
					cfsqltype = "cf_sql_bigint");
				local.reportDetailsService.setName("fetchReportDetails");
				local.reportDetailsService.setSQL ("SELECT [question], [option1], [option2],
														[option3], [option4], [correctAnswer]
				  										FROM [questionBank] Right JOIN [quizQuestion]
				  										ON [questionBank].[questionId] =
				  										[quizQuestion].[questionId]
				  										WHERE [quizQuestion].[quizQuestionId] = :id");
				fetchReportDetails = local.reportDetailsService.execute().getResult();

				if (fetchReportDetails.recordCount != 0){
				  	local.dataArray[i][1] = encodeForHTML(fetchReportDetails.question);
				  	local.option = arr[2];
				  	local.dataArray[i][2] = fetchReportDetails[option];
				    local.option = arr[3];
				    if (arr[3] != 0){
					    local.dataArray[i][3] = fetchReportDetails[option];
					}
					else{
				    	local.dataArray[i][3] = '';
				    }
			    	local.i = local.i +1;
			    }
			}
		}
		result.data = dataArray;
		return result;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : getStudentResultSet
Description    : fetchs the faculty resulty set and formates it,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getStudentResultSet(required struct data){
		var resultSet = fetchFacultyResultSet(data);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var count = 1;
		for (row in resultSet){
			local.dataArray[count][1] = encodeForHTML(row.name);
			local.dataArray[count][2] = dateFormat(row.startDateTime,'yyyy/mm/dd') & ' ' &
				timeFormat(row.startDateTime,'HH:nn:ss');
			local.dataArray[count][3] = encodeForHTML(row.score) & ' %';
			local.dataArray[count][4] = encodeForHTML(row.RANK);
			local.count = local.count + 1;
		}
		local.result.data = dataArray;
		return local.result;
	}
}