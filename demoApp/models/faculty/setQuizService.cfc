/**
* I am a new Model Object
*/
component singleton = "true" accessors = "true"{
	// Properties
	/**
	 * Constructor
	 */
	setQuizService function init(){
		return this;
	}

	/**
	* checkstartDateTime
	*/
	function checkstartDateTime(required struct data){
		var stStatus = {status = {} , message = {}};
		if (NOT(structKeyExists(arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		if (arguments.data.startDateTime == ''){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty.";
			return local.stStatus;
		}
		else if (NOT(isValid("regex",arguments.data.startDateTime,"^\d{4}\/\d{2}\/\d{2} \d{2}:\d{0,2}$" ))) {
			local.stStatus.status = "error";
			local.stStatus.message = "<p>Please select a valid date time<br/>of pattern 'YYYY/MM/DD HH:MM'.</p>";
 	  		return local.stStatus;
 	 	}
 	   	else {
	  		try {
	   	 	 	var queryService  = new query();
	 	   	 	local.queryService.setName("quizCount");
	 	   	 	local.queryService.addParam(name = "id",
	 			value = "#arguments.data.quizId#",cfsqltype = "cf_sql_bigint");
	   		 	local.queryService.addParam(name = "startDate",
	   			value = "#arguments.data.startDateTime#",cfsqltype = "cf_sql_date");
	  	   		var result = local.queryService.execute(sql = "SELECT [quiz].[quizId] FROM [quiz]
					WHERE ( CONVERT(VARCHAR(8), [quiz].[startDateTime], 1) ) =
		 			( CONVERT(VARCHAR(8), :startDate , 1))
	 	 		 	AND [quiz].[quizId] <> :id");
	  	  		quizCount = local.result.getResult();
	  	  		if (quizCount.RecordCount != 0){
	 	   			local.stStatus.status = "error";
	 	  	 		local.stStatus.message = "<p>This date is already selected for a quiz.<br/>
	 		 									 Please select another date.</p>";
	   		 		return local.stStatus;
	 	 	 	}//end of if
	   		 	else {
	   		  		if (now() GTE #arguments.data.startDateTime#){
	  	   		 		local.stStatus.status = "error";
		   		 		local.stStatus.message = "<p>The date selected is old.<br/>
	 	   		 		please select a future date.</p>";
		  	 	 		return local.stStatus;
		 	  	 	}//end of if
		  	 	 	else {
		   		 		local.stStatus.status = "success";
		  	 	 		local.stStatus.message = "This date is new and will be added once you click DONE";
		   		 		return local.stStatus;
		  		 	}//end of else
	 			} //end of else
	  		}//end  of try
  			catch (database db){
 				writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
	 					type = "Error");
	 			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
	 			local.stStatus.status = "fail";
	 			local.stStatus.message = "Some unexpected error has occured. Please try again later.";
	 			return local.stStatus;
	 		}
			catch (any e){
				writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
					type = "Error");
		 		local.stStatus.status = "fail";
		 		local.stStatus.message = "Some unexpected error has occured. Please try again later.";
				return local.stStatus;
			}//end of catch
		}//end of else
	}//end of checkstartDateTime

	function checkendDateTime (required string element){
		var stStatus = {status = {} , message = {}};
		if (arguments.element == ''){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty.";
		}
		else{
			local.stStatus.status = "success";
			local.stStatus.message = "This field is not empty.";
		}
		return local.stStatus;
	}

	function checkQuizName (required struct data){
		var stStatus = {status = {} , message = {}};
		if (NOT(structKeyExists (arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		if (arguments.data.quizName == ''){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty.";
			return local.stStatus;
		}
		else if (NOT(isValid("regex",arguments.data.quizName,"^[a-zA-Z0-9 ]{1,30}$" ))){
			local.stStatus.status = "error";
			local.stStatus.message = "<p>Please enter your valid quiz name: <br/>
					 use (a-z) OR (A-Z) OR (0-9) <br/>between 1 to 30 characters.</p>";
			return local.stStatus;
		}
		else {
			try {
				var queryService  = new query();
	 	   	 	local.queryService.setName("quizNameCount");
	 	   	 	local.queryService.addParam(name = "id",value = "#arguments.data.quizId#",cfsqltype = "cf_sql_bigint");
	   		 	local.queryService.addParam(name = "name",value = "#arguments.data.quizName#",cfsqltype = "cf_sql_varchar");
	  	   		var result = local.queryService.execute(sql = "SELECT [quiz].[quizId] FROM [quiz]
							WHERE [quiz].[name] = :name AND [quiz].[quizId] <> :id");
	  	  		quizNameCount = local.result.getResult();
	  	  		if (quizNameCount.RecordCount != 0){
					local.stStatus.status = "error";
					local.stStatus.message = "This quiz name already exists";
					return local.stStatus;
				}
				else{
					local.stStatus.status = "success";
					local.stStatus.message = "This quiz name is new and will be added once you click DONE";
					return local.stStatus;
				}
			}//end of try
			catch (database db){
				writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#", type = "Error");
				writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
				local.stStatus.status = "fail";
					local.stStatus.message = "Some unexpected error has occured.";
					return local.stStatus;
			}
			catch (any e){
				writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#", type = "Error");
				local.stStatus.status = "fail";
				local.stStatus.message = "Some unexpected error has occured.";
				return local.stStatus;
			}//end of catch
		}//end of else
	}//


	function validateAllFields (required struct data){
		var errorStruct = {elementId = {},errorId = {}};
		if (NOT(structKeyExists(arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		if (structKeyExists(arguments.data,"quizName")){
			var checkQuizNameStatus = checkQuizName(arguments.data);
			if ((structKeyExists(checkQuizNameStatus, "status")) AND
				(local.checkQuizNameStatus.status == "error")){
				local.errorStruct.elementId.quizName = arguments.data.quizName;
				local.errorStruct.errorId.error_quizname = local.checkQuizNameStatus.message;
			}//end of if
		}//end of if
		if (structKeyExists(arguments.data,"startDateTime")){
			var checkstartDateTimeStatus = checkstartDateTime(arguments.data);
			if ((structKeyExists(checkstartDateTimeStatus,"status")) AND
				(local.checkstartDateTimeStatus.status == "error")) {

				local.errorStruct.elementId.startDateTime = data.startDateTime;
				local.errorStruct.errorId.error_startDateTime = local.checkstartDateTimeStatus.message;
			}//end of if
		}//end of if
		if (structKeyExists(arguments.data,"endDateTime")){
			var checkendDateTimeStatus = checkendDateTime(arguments.data.endDateTime);
			if ((structKeyExists(checkendDateTimeStatus,"status")) AND
				(local.checkendDateTimeStatus.status == "error")) {

				local.errorStruct.elementId.endDateTime = arguments.data.endDateTime;
				local.errorStruct.errorId.error_endDateTime = local.checkendDateTimeStatus.message;
			}

		}//end of if
		if (data.quizId == 0){
			if (structKeyExists(arguments.data,"questionId")){
				var checkQuestionListStatus = checkQuestionList(arguments.data.questionId);
				if (local.checkQuestionListStatus.status == "error"){
					local.errorStruct.elementId.questionId = "";
					local.errorStruct.errorId.error_questions = local.checkQuestionListStatus.message;
				}//end of if
			}//end of if
			else {
				local.errorStruct.elementId.questionId = "";
				local.errorStruct.errorId.error_questions =
					"You should select atleast one question to set the quiz.";
			}//end of else
		}//end of if
		return local.errorStruct;
	}

	function checkQuestionList (required string element){
		var stStatus = {status = {} , message = {}};
		if (arguments.element == ''){
			local.stStatus.status = "error";
			local.stStatus.message =
				"You should select atleast one question to set the quiz.";
		}
		else {
			local.stStatus.status = "success";
			local.stStatus.message =  "question are selected.";
		}
		return local.stStatus;
	}

	function insertQuizDetails (required struct data, required numeric id){
		try {
 			transaction {
 				var queryService  = new query();
				local.queryService.addParam(name = "quizName",value = "#arguments.data.quizName#",cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "startDateTime",value = "#arguments.data.startDateTime#",cfsqltype = "cf_sql_datetime");
				local.queryService.addParam(name = "id",value = "#arguments.id#",cfsqltype = "cf_sql_bigint");
				local.queryService.setSQL("INSERT INTO [quiz] VALUES ( :quizName, :startDateTime, :startDateTime, :id)");
				local.queryService.execute().getResult();

				var secondQueryService = new query();
				local.secondQueryService.addParam(name = "quizName",value = "#arguments.data.quizName#",cfsqltype = "cf_sql_varchar");
				local.secondQueryService.setName("getQuizId");
				local.secondQueryService.setSQL("SELECT [quiz].[quizId] FROM [quiz]	WHERE [name] = :quizName");
				getQuizId = local.secondQueryService.execute().getResult();
				if (getQuizId.recordCount == 1){
					var thirdQueryService = new query();
					local.thirdQueryService.addParam(name = "quizName",value = "#arguments.data.quizName#",
						cfsqltype = "cf_sql_varchar");
					local.thirdQueryService.setName("getEndDateTime");
					local.thirdQueryService.setSQL("SELECT [endDateTime] FROM [QUIZ]
							WHERE [name] = :quizName");
					getEndDateTime = local.thirdQueryService.execute().getResult();

					var fourthQueryService = new query();
					local.fourthQueryService.setName("addEndDateTime");
					local.fourthQueryService.setSQL("SELECT DATEADD
							(n, #arguments.data.endDateTime#,'#getEndDateTime.endDateTime#') 'RESULT'");
					addEndDateTime = local.fourthQueryService.execute().getResult();

					var fifthQueryService = new query();
					local.fifthQueryService.addParam(name = "result", value = "#addEndDateTime.RESULT#",
						cfsqltype = "cf_sql_datetime");
					local.fifthQueryService.addParam(name = "id", value = "#getQuizId.quizId#",
						cfsqltype = "cf_sql_bigint");
					local.fifthQueryService.setSQL("UPDATE [quiz] SET [endDateTime] = :result
							WHERE [quizId] = :id");
					local.fifthQueryService.execute().getResult();

					var idList = listToArray (data.questionId);
					for (ind in idList){
						var sixthQueryService = new query();
						local.sixthQueryService.addParam(name = "ind", value = "#ind#",
							cfsqltype = "cf_sql_numeric");
						local.sixthQueryService.addParam(name = "id", value = "#getQuizId.quizId#",
							cfsqltype = "cf_sql_bigint");
						local.sixthQueryService.setSQL("INSERT INTO [quizQuestion]
								VALUES ( :ind,:id )");
						local.sixthQueryService.execute().getResult();
					}//end of for
				}//end of if
				else {
					return false;
				}//end of else
					return true;
 			}//end transaction
		}//end of try
		catch (database db){
			WriteLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
				 type = "Error");
			WriteLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			return false;
		}//end of catch
		catch (any e){
			WriteLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
				type = "Error");
			return false;
		}//end of catch
	}

	function getQuizList (required numeric userId){
		var queryService = new query();
		local.queryService.addParam(name = "userId",value = "#arguments.userId#",
			cfsqltype = "cf_sql_bigint");
		local.queryService.setName("quizList");
		local.queryService.setSQL("SELECT * FROM [quiz] WHERE [quiz].[userId] = :userId
			ORDER BY [quiz].[startDateTime] DESC");
		quizList = local.queryService.execute().getResult();
		return  quizList;
	}

	function getQuizDetails (required numeric quizId){
		var queryService = new query();
		local.queryService.addParam(name = "quizId", value = "#arguments.quizId#",
			cfsqltype = "cf_sql_bigint");
		local.queryService.setName("getDetails");
		local.queryService.setSQL("SELECT * FROM [quiz]	WHERE [quiz].[quizId] = :quizId");
		getDetails = local.queryService.execute().getResult();
		return getDetails;
	}

	function deleteQuiz (required numeric quizId){
		try{
			transaction{
				var queryService = new query();
				local.queryService.addParam(name = "quizId", value = "#arguments.quizId#",
					cfsqltype = "cf_sql_bigint");
				local.queryService.setName("check");
				local.queryService.setSQL("SELECT [startDateTime] FROM [quiz] WHERE [quiz].[quizId] = :quizId");
				check = local.queryService.execute().getResult();
				if (check.startDateTime > now()){
					var deleteQuestions = new query();
					local.deleteQuestions.addParam(name = "quizId", value = "#arguments.quizId#",
						cfsqltype = "cf_sql_bigint");
					local.deleteQuestions.setSQL("DELETE FROM [quizQuestion]
							WHERE [quizQuestion].[quizId] = :quizId");
					local.deleteQuestions.execute().getResult();

					var deleteQuiz = new query();
					local.deleteQuiz.addParam(name = "quizId", value = "#arguments.quizId#",
						cfsqltype = "cf_sql_bigint");
					local.deleteQuiz.setSQL("DELETE FROM [quiz]	WHERE [quiz].[quizId] = :quizId");
					local.deleteQuiz.execute().getResult();
				}//end of if
				else {
					return false;
				}//end of else
				return true;
			}//end of transaction
		}//end of try
		catch (database db){
			writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
				type = "Error");
			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			return false;
		}
		catch (any e){
			writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
				type = "Error");
			return false;
		}
	}

	function updateQuiz(required struct data){
		try{
			transaction{
				var queryDate = new Query();
				local.queryDate.setName("addDateTime");
				local.queryDate.addParam(name = "startDateTime",
					value = "#arguments.data.startDateTime#", cfsqltype = "cf_sql_varchar");
				local.queryDate.addParam(name = "endDateTime",
					value = "#arguments.data.endDateTime#", cfsqltype = "cf_sql_varchar");
				local.queryDate.setSQL("SELECT DATEADD (n, #arguments.data.endDateTime#,'#arguments.data.startDateTime#') 'RESULT'");
				addDateTime = local.queryDate.execute().getResult();

				var queryService = new query();
				local.queryService.addParam(name = "quizName",
					value = "#arguments.data.quizName#", cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "startDateTime",
					value = "#arguments.data.startDateTime#", cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "result",
					value = "#addDateTime.RESULT#", cfsqltype = "cf_sql_varchar");
				local.queryService.addParam(name = "quizId",
					value = "#arguments.data.quizId#", cfsqltype = "cf_sql_varchar");
				local.queryService.setSQL("UPDATE [quiz]
						SET [quiz].[name] = :quizName, [quiz].[startDateTime] = :startDateTime,
						[quiz].[endDateTime] = :result WHERE [quiz].[quizId] = :quizId");
				local.queryService.execute().getResult();

				return true;
			}//end of transaction
		}//end of try
		catch (database db){
			writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
				type = "Error");
			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			return false;
		}
		catch (any e){
			writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
				type = "Error");
			return false;
		}
	}

	function deleteQuizQuestion (required numeric questionId, required numeric quizId){
		try {
			var queryService = new query();
			local.queryService.addParam(name = "quizId", value = "#arguments.quizId#", cfsqltype = "cf_sql_bigint");
			local.queryService.addParam(name = "questionId", value = "#arguments.questionId#",
				cfsqltype = "cf_sql_bigint");
			local.queryService.setSQL("DELETE FROM [quizQuestion]
					WHERE [quizQuestion].[quizId] = :quizId
					AND [quizQuestion].[questionId] = :questionId");
			local.queryService.execute().getResult();
		}
		catch (database db){
			writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
				type = "Error");
			writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
			return false;
		}
		catch (any e){
			writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
				type = "Error");
			return false;
		}
		return true;
	}

	function getQuizQuestions(required numeric quizId){
		var queryDate = new Query();
		local.queryDate.setName("questionList");
		local.queryDate.addParam(name = "quizId",
			value = "#arguments.quizId#", cfsqltype = "cf_sql_bigint");
		local.queryDate.setSQL("SELECT [quizQuestion].[quizId], [questionBank].[questionId],
			[questionBank].[question], [questionBank].[option1], [questionBank].[option2],
			[questionBank].[option3], [questionBank].[option4], [questionBank].[correctAnswer]
			FROM [quizQuestion] JOIN [questionBank]
			ON [quizQuestion].[questionId] = [questionBank].[questionId]
			WHERE [quizQuestion].[quizId] = :quizId");
		questionList = local.queryDate.execute().getResult();
		return questionList;
		}

	function addQuizQuestions (required struct data){
			try{
				var idList = listToArray (arguments.data.questionId);
				for (ind in idList){
					var queryService = new query();
					local.queryService.addParam(name = "questionId", value = "#ind#",
						cfsqltype = "cf_sql_bigint");
					local.queryService.addParam(name = "quizId", value = "#arguments.data.quizId#",
						cfsqltype = "cf_sql_bigint" );
					local.queryService.setSQL("INSERT INTO [quizQuestion] VALUES ( :questionId, :quizId)");
					local.queryService.execute().getResult();
				}//end of for
			}
			catch (database db){
				writeLog (file = "dbErrors", text = "#db.message# #db.detail# #db.ExtendedInfo#",
				 	type = "Error");
				writeLog (file = "dbErrors", type = "error", text = "#db.queryError#");
				return false;
			}
			catch (any e){
				writeLog (file = "error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
					type = "Error");
				return false;
			}
		return true;
	}
}