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
	studentResultService function init(){

		return this;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchStudentsResults
Description    : fetchs the result set to display in students portal,
Arguments      : none.
Return Type    : none.
------------------------------------------------------------------------------------------------------------*/

	function fetchStudentsResults(){
		local.resultsService = new query();
		local.resultsService.setName("results");
		local.resultsService.setSQL ("SELECT sd.[quizId], sd.[score], sd.[userId],
											 quiz.[name], quiz.[startDateTime],
											 RANK() OVER (PARTITION BY sd.[quizId]
											 ORDER BY sd.[score] DESC) AS rank
											 FROM [scoreDetails] AS sd
											 JOIN [quiz] AS quiz
											 ON sd.[quizId] = quiz.[quizId]");
		results = local.resultsService.execute().getResult();
		return results;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchAStudentResult
Description    : fetchs the result set for single student to display in students portal,
Arguments      : numeric studentId.
Return Type    : struct.
------------------------------------------------------------------------------------------------------------*/

	function fetchAStudentResult(required numeric studentId){
		local.getAllResults = fetchStudentsResults();
		local.resultsService = new query();
		local.resultsService.addParam(name = "studentId", value = "#arguments.studentId#",
			cfsqltype = "cf_sql_bigint");
		local.resultsService.setName("results");
		local.resultsService.setDBType("query");
		local.resultsService.setAttributes(sourceQuery = getAllResults);
		local.sql = "SELECT [score], [name], [startDateTime], rank FROM sourceQuery
						WHERE [userId] = :studentId";
		local.resultsService.setSQl(local.sql);
		results = local.resultsService.execute().getresult();
		return results;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : getAStudentResult
Description    : fetchs the result set and formats it,
Arguments      : numeric studentId.
Return Type    : struct.
------------------------------------------------------------------------------------------------------------*/

	function getAStudentResult(required numeric studentId){
		local.dataSet = fetchAStudentResult(arguments.studentId);
		local.dataArray = ArrayNew(2);
		local.result["data"] = {};
		local.i = 1;
		for (row in dataSet ){
			local.dataArray[i][1] = encodeForHTML(row.name);
			local.dataArray[i][2] = encodeForHTML(row.startDateTime);
			local.dataArray[i][3] = encodeForHTML(row.score) & "%";
			local.dataArray[i][4] = encodeForHTML(row.rank);
			local.i = local.i + 1;
		}
		local.result.data = local.dataArray;
		return local.result;
	}
}