/**
* I am a new Model Object
*/
component singleton = "true" accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	resultService function init(){

		return this;
	}

	/**
	* facultyResultSet
	*/
	function fetchFacultyResultSet(required struct data){
		if (structKeyExists(arguments.data,'listOfQuizId')){
			var quizIds = #listToArray(arguments.data.listOfQuizId, ",", false)#;
		}
		var queryService = new query();
		local.queryService.addParam(name = "userId", value = "#arguments.data.userId#",
		 cfsqltype = "cf_sql_bigint");
		local.queryService.setName("resultSet");
		 var sql = "SELECT [quiz].[name], [quiz].[startDateTime], [quiz].[endDateTime],
				[quiz].[quizId],
				[user].[firstName], [user].[lastName], [scoreDetails].[score], [scoreDetails].[scoreId],
				[scoreDetails].[userId], RANK () OVER
				(PARTITION BY [scoreDetails].[quizId] ORDER BY [scoreDetails].[score] DESC ) AS RANK
				FROM [scoreDetails] JOIN [quiz] ON [quiz].[quizId] = [scoreDetails].[quizId] JOIN [user]
				ON [user].[userId] = [scoreDetails].[userId]
				Where [quiz].[userId] = :userId";
		if (structKeyExists(data,"studentsId")){
			local.queryService.addParam(name = "studentsId", value = "#arguments.data.studentsId#",
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
		local.queryService.setSQL(local.sql);
		resultSet = local.queryService.execute().getResult();
		return resultSet;
	}

	//function getFacultyResultSet(required struct dataSet){
//		var resultSet = fetchFacultyResultSet(arguments.dataSet);
//		var dataArray = ArrayNew(2);
//		var result["data"] = {} ;
//		var count = 1;
//		for (row in resultSet){
//			local.dataArray[count][1] = encodeForHTML(row.name);
//			local.dataArray[count][2] = DateFormat(row.startDateTime,'yyyy/mm/dd') & ' ' &
//			TimeFormat(row.startDateTime,'HH:nn:ss');
//			local.dataArray[count][3] = DateFormat(row.endDateTime,'yyyy/mm/dd') & ' ' &
//			TimeFormat(row.endDateTime,'HH:nn:ss');
//			local.dataArray[count][4] = encodeForHTML(row.firstName) &' '& encodeForHTML(row.lastName);
//			local.dataArray[count][5] =	"<a href = '#arguments.dataSet.event.buildLink( "faculty.studentsReport?Id=#row.scoreId#" )#'>#row.score# %</a>";
//			local.dataArray[count][6] = encodeForHTML(row.RANK);
//			local.count = local.count + 1;
//		}
//		local.result.data = dataArray;
//		return local.result;
//	}

	function fetchScoreIds(required numeric userId){
		var queryService = new query();
		local.queryService.addParam (name = "userId", value = "#arguments.userId#",
			cfsqltype = "cf_sql_bigint");
		local.queryService.setName("scoreIds");
		local.queryService.setSQL ("SELECT [scoreDetails].[scoreId] FROM [scoreDetails] JOIN [quiz]
				ON [scoreDetails].[quizId] = [quiz].[quizId]
				WHERE [quiz].[userId] = :userId");
		scoreIds = local.queryService.execute().getResult();
		return scoreIds;
	}

	function fetchResultDetails (required numeric scoreId){
		var queryService = new query();
		local.queryService.addParam (name = "scoreId", value = "#arguments.scoreId#",
			cfsqltype = "cf_sql_bigint");
		local.queryService.setName("resultDetails");
		local.queryService.setSQL ("SELECT [user].[firstName], [user].[lastName] , [quiz].[quizId], [quiz].[name]
				FROM [scoreDetails] JOIN [quiz] ON [scoreDetails].[quizId] = [quiz].[quizId]
				JOIN [user] ON [user].[userId] = [scoreDetails].[userId]
				WHERE [scoreDetails].[scoreId] = :scoreId");
		resultDetails = local.queryService.execute().getResult();
		return resultDetails;
	}

	function generateReport(required numeric scoreId){
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var option = '';
		var queryService = new query();
		local.queryService.addParam (name = "scoreId", value = "#arguments.scoreId#",
			cfsqltype = "cf_sql_bigint");
		local.queryService.setName("fetchReport");
		local.queryService.setSQL ("SELECT [scoreDetails].[answerReport] FROM [scoreDetails]
			WHERE [scoreDetails].[scoreId] = :scoreId");
		fetchReport = local.queryService.execute().getResult();
		var i = 1;
		var reportList = listToArray(#fetchReport.answerReport#, ";",true,true);
		for (set in reportList){
			if (set != ''){
				var arr = listToArray (#set#, ",",true,true);
			 	var queryService = new query();
				local.queryService.addParam (name = "id", value = "#arr[1]#", cfsqltype = "cf_sql_bigint");
				local.queryService.setName("fetchReportDetails");
				local.queryService.setSQL ("SELECT [question], [option1], [option2], [option3], [option4], [correctAnswer]
				  		FROM [questionBank] Right JOIN [quizQuestion]
				  		ON [questionBank].[questionId] = [quizQuestion].[questionId]
				  		WHERE [quizQuestion].[quizQuestionId] = :id");
				fetchReportDetails = local.queryService.execute().getResult();
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

	function getStudentResultSet(required struct data){
		var resultSet = fetchFacultyResultSet(data);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var count = 1;
		for (row in resultSet){
			local.dataArray[count][1] = encodeForHTML(row.name);
			local.dataArray[count][2] = DateFormat(row.startDateTime,'yyyy/mm/dd') & ' ' &
			TimeFormat(row.startDateTime,'HH:nn:ss');
			local.dataArray[count][3] = encodeForHTML(row.score) & ' %';
			local.dataArray[count][4] = encodeForHTML(row.RANK);
			local.count = local.count + 1;
		}
		local.result.data = dataArray;
		return local.result;
	}
}