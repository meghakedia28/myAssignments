/*----------------------------------------------------------------------------------------------------------
FileName    : setQuizService.cfc
Created By  : Megha Kedia
DateCreated : 13-March-2018
Description : contains functions which is related to quiz services.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true"{
	// Properties
	/**
	 * Constructor
	 */
	setQuizService function init(){
		return this;
	}


/*------------------------------------------------------------------------------------------------------------
Function Name  : checkStartDateTime
Description    : validates the start time of the test,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function checkStartDateTime(required struct data){
		local.stStatus = {status = {} , message = {}};
		if (!(structKeyExists(arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		if (arguments.data.startDateTime == ""){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty.";
		}
		else if (!(isValid("regex",arguments.data.startDateTime,"^\d{4}\/\d{2}\/\d{2} \d{2}:\d{0,2}$" ))) {
			local.stStatus.status = "error";
			local.stStatus.message = "<p>Please select a valid date time<br/>
										of pattern 'YYYY/MM/DD HH:MM'. </p>";
 	 	}
 	   	else {
	  		try {
	   	 	 	local.quizCountService  = new query();
	 	   	 	local.quizCountService.setName("quizCount");
	 	   	 	local.quizCountService.addParam(name = "id",
	 				value = "#arguments.data.quizId#",cfsqltype = "cf_sql_bigint");
	   		 	local.quizCountService.addParam(name = "startDate",
	   				value = "#arguments.data.startDateTime#",cfsqltype = "cf_sql_date");
	  	   		local.quizCountService.setSQL("SELECT	 [quiz].[quizId]
	  	   									   FROM 	 [quiz]
											   WHERE 	 ( CONVERT(VARCHAR(8), [quiz].[startDateTime], 1)) =
		 												 ( CONVERT(VARCHAR(8), :startDate , 1))
	 	 		 							   AND		 [quiz].[quizId] <> :id");
	  	  		quizCount = local.quizCountService.execute().getResult();

	  	  		if (quizCount.recordCount != 0){
	 	   			local.stStatus.status = "error";
	 	  	 		local.stStatus.message = "<p>This date is already selected for a quiz.<br/>
	 		 									 Please select another date.</p>";
	 	 	 	}
	   		 	else {
	   		  		if (now() >= arguments.data.startDateTime){
	  	   		 		local.stStatus.status = "error";
		   		 		local.stStatus.message = "<p>The date selected is old.<br/>
	 	   		 									 Please select a future date.</p>";
		 	  	 	}
		  	 	 	else {
		   		 		local.stStatus.status = "success";
		  	 	 		local.stStatus.message = "This date is new and will be added once you click DONE";
		  		 	}
	 			}
	  		}
  			catch (database db){
 				application.errorLogService(db,1);
	 			local.stStatus.status = "fail";
	 			local.stStatus.message = "Some unexpected error has occured. Please try again later.";
	 		}
			catch (any e){
				application.errorLogService(e);
		 		local.stStatus.status = "fail";
		 		local.stStatus.message = "Some unexpected error has occured. Please try again later.";
			}
		}
		return local.stStatus;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : checkEndDateTime
Description    : checks if the end time field is empty or not,
Arguments      : string element,
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function checkEndDateTime (required string element){
		local.stStatus = {status = {} , message = {}};
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

/*------------------------------------------------------------------------------------------------------------
Function Name  : checkQuizName
Description    : validates the quiz name,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function checkQuizName (required struct data){
		local.stStatus = {status = {} , message = {}};
		if (!(structKeyExists (arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		if (arguments.data.quizName == ""){
			local.stStatus.status = "error";
			local.stStatus.message = "You can't leave this empty.";
		}
		else if (!(isValid("regex",arguments.data.quizName,"^[a-zA-Z0-9 ]{1,30}$" ))){
			local.stStatus.status = "error";
			local.stStatus.message = "<p>Please enter a valid quiz name: <br/>
					 use (a-z) OR (A-Z) OR (0-9) <br/>between 1 to 30 characters.</p>";
		}
		else {
			try {
				local.quizNameService  = new query();
	 	   	 	local.quizNameService.setName("quizNameCount");
	 	   	 	local.quizNameService.addParam(name = "id",value = "#arguments.data.quizId#",
	 	   	 		cfsqltype = "cf_sql_bigint");
	   		 	local.quizNameService.addParam(name = "name",value = "#arguments.data.quizName#",
	   		 		cfsqltype = "cf_sql_varchar");
	  	   		local.quizNameService.setSQL("SELECT 	[quiz].[quizId]
	  	   									  FROM		[quiz]
											  WHERE 	[quiz].[name] = :name
											  AND		[quiz].[quizId] <> :id");
	  	  		quizNameCount = local.quizNameService.execute().getResult();

	  	  		if (quizNameCount.recordCount != 0){
					local.stStatus.status = "error";
					local.stStatus.message = "This quiz name already exists";
				}
				else{
					local.stStatus.status = "success";
					local.stStatus.message = "This quiz name is new and will be added once you click DONE";
				}
			}
			catch (database db){
				application.errorLogService(db,1);
				local.stStatus.status = "fail";
				local.stStatus.message = "Some unexpected error has occured.";
			}
			catch (any e){
				application.errorLogService(e);
				local.stStatus.status = "fail";
				local.stStatus.message = "Some unexpected error has occured.";
			}
		}
		return local.stStatus;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : validateInsertController
Description    : controller which validates and then call insert function to insert data into database,
Arguments      : struct data,
				 numeric id.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validateInsertController(required struct data, numeric id = 0 ){
		local.insertionStruct = {successfull = {}, message = {}};
	 	try {
	 		local.errorStruct = validateAllFields(data);
	 		 if ((structKeyExists(errorStruct,"errorId")) AND (structIsEmpty(local.errorStruct.errorId))){
		 	 	if ((structKeyExists(arguments.data,"quizId")) && (arguments.data.quizId)) {
		 	 		local.insertion = updateQuiz(arguments.data);
		 	 	}
		 	 	else {
		 	 		local.insertion = insertQuizDetails(arguments.data, arguments.id);
		 	 	}
		 		if (insertion){
		 			local.insertionStruct.successfull = "true";
		  			local.insertionStruct.message = "Quiz has been successfully set.";
			 	}
			 	else {
			 		local.insertionStruct.successfull = "false";
			 		local.insertionStruct.message = "Error occured while insertion of data";
			 	}
			 	return local.insertionStruct;
			}
				return local.errorStruct;
		}
		catch (any e){
			application.errorLogService(e);
			local.insertionStruct.successfull = "false";
			local.insertionStruct.message = "Error occured while insertion of data";
			return local.insertionStruct;
		}
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : validateAllFields
Description    : performs validation for all the fields,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function validateAllFields (required struct data){
		local.errorStruct = {elementId = {},errorId = {}};
		if (!(structKeyExists(arguments.data,"quizId"))){
			arguments.data.quizId = 0;
		}
		if (structKeyExists(arguments.data,"quizName")){
			local.checkQuizNameStatus = checkQuizName(arguments.data);
			if ((structKeyExists(checkQuizNameStatus, "status")) AND
				(local.checkQuizNameStatus.status == "error")){
				local.errorStruct.elementId.quizName = arguments.data.quizName;
				local.errorStruct.errorId.error_quizname = local.checkQuizNameStatus.message;
			}
		}
		if (structKeyExists(arguments.data,"startDateTime")){
			local.checkStartDateTimeStatus = checkStartDateTime(arguments.data);
			if ((structKeyExists(checkStartDateTimeStatus,"status")) AND
				(local.checkStartDateTimeStatus.status == "error")) {

				local.errorStruct.elementId.startDateTime = data.startDateTime;
				local.errorStruct.errorId.error_startdatetime = local.checkStartDateTimeStatus.message;
			}
		}
		if (structKeyExists(arguments.data,"endDateTime")){
			local.checkEndDateTimeStatus = checkEndDateTime(arguments.data.endDateTime);
			if ((structKeyExists(checkEndDateTimeStatus,"status")) AND
				(local.checkEndDateTimeStatus.status == "error")) {

				local.errorStruct.elementId.endDateTime = arguments.data.endDateTime;
				local.errorStruct.errorId.error_enddatetime = local.checkEndDateTimeStatus.message;
			}
		}
		if (data.quizId == 0){
			if (structKeyExists(arguments.data,"questionId")){
				local.checkQuestionListStatus = checkQuestionList(arguments.data.questionId);
				if (local.checkQuestionListStatus.status == "error"){
					local.errorStruct.elementId.questionId = "";
					local.errorStruct.errorId.error_questions = local.checkQuestionListStatus.message;
				}
			}
			else {
				local.errorStruct.elementId.questionId = "";
				local.errorStruct.errorId.error_questions =
					"You should select atleast one question to set the quiz.";
			}
		}
		return local.errorStruct;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : checkQuestionList
Description    : checks if atleast one question is selected or not,
Arguments      : string element.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function checkQuestionList (required string element){
		local.stStatus = {status = {} , message = {}};
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
/*------------------------------------------------------------------------------------------------------------
Function Name  : insertQuizDetails
Description    : performs insertion of data in database,
Arguments      : struct data,
				numeric id
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function insertQuizDetails (required struct data, required numeric id){
		try {
 			transaction {
 				local.insertService  = new query();
				local.insertService.addParam(name = "quizName",value = "#arguments.data.quizName#",
					cfsqltype = "cf_sql_varchar");
				local.insertService.addParam(name = "startDateTime",value = "#arguments.data.startDateTime#",
					cfsqltype = "cf_sql_datetime");
				local.insertService.addParam(name = "id",value = "#arguments.id#",
					cfsqltype = "cf_sql_bigint");
				local.insertService.setSQL("INSERT INTO [quiz]
											VALUES (:quizName,
													:startDateTime,
													:startDateTime,
													:id)");
				local.insertService.execute().getResult();

				local.getQuizIdService = new query();
				local.getQuizIdService.addParam(name = "quizName",value = "#arguments.data.quizName#",
					cfsqltype = "cf_sql_varchar");
				local.getQuizIdService.setName("getQuizId");
				local.getQuizIdService.setSQL("SELECT [quiz].[quizId] FROM [quiz]	WHERE [name] = :quizName");
				getQuizId = local.getQuizIdService.execute().getResult();

				if (getQuizId.recordCount == 1){
					local.getEndDateTimeService = new query();
					local.getEndDateTimeService.addParam(name = "quizName",value = "#arguments.data.quizName#",
						cfsqltype = "cf_sql_varchar");
					local.getEndDateTimeService.setName("getEndDateTime");
					local.getEndDateTimeService.setSQL("SELECT [endDateTime] FROM [QUIZ]
															WHERE [name] = :quizName");
					getEndDateTime = local.getEndDateTimeService.execute().getResult();

					local.addTimeService = new query();
					local.addTimeService.setName("addEndDateTime");
					local.addTimeService.setSQL("SELECT DATEADD (n, #arguments.data.endDateTime#,
													'#getEndDateTime.endDateTime#') 'RESULT'");
					addEndDateTime = local.addTimeService.execute().getResult();


					local.updateService = new query();
					local.updateService.addParam(name = "result", value = "#addEndDateTime.RESULT#",
						cfsqltype = "cf_sql_datetime");
					local.updateService.addParam(name = "id", value = "#getQuizId.quizId#",
						cfsqltype = "cf_sql_bigint");
					local.updateService.setSQL("UPDATE [quiz] SET [endDateTime] = :result
													WHERE [quizId] = :id");
					local.updateService.execute().getResult();

					local.idList = listToArray (data.questionId);
					for (ind in idList){
						local.insertQuizQuestionService = new query();
						local.insertQuizQuestionService.addParam(name = "ind", value = "#ind#",
							cfsqltype = "cf_sql_numeric");
						local.insertQuizQuestionService.addParam(name = "id", value = "#getQuizId.quizId#",
							cfsqltype = "cf_sql_bigint");
						local.insertQuizQuestionService.setSQL("INSERT INTO [quizQuestion]
																VALUES ( :ind,:id )");
						local.insertQuizQuestionService.execute().getResult();
					}
				}
				else {
					return false;
				}
					return true;
 			}
		}
		catch (database db){
			application.errorLogService(db,1);
		}
		catch (any e){
			application.errorLogService(e);
		}
		return false;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchQuizList
Description    : query to fetch all the quiz list,
Arguments      : numeric userId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchQuizList (required numeric userId){
		local.quizListService = new query();
		local.quizListService.addParam(name = "userId",value = "#arguments.userId#",
			cfsqltype = "cf_sql_bigint");
		local.quizListService.setName("quizList");
		local.quizListService.setSQL("SELECT 	[quiz].[quizId],
											 	[quiz].[name],
											 	[quiz].[startDateTime],
											 	[quiz].[endDateTime],
											 	[quiz].[userId]
									  FROM 	 	[quiz]
									  WHERE  	[quiz].[userId] = :userId
								      ORDER BY  [quiz].[startDateTime] DESC");
		quizList = local.quizListService.execute().getResult();
		return  quizList;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : getQuizList
Description    : performance insertion of data into data base,
Arguments      : numeric userId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getQuizList(required numeric userId){
		local.quizList = fetchQuizList(arguments.userId);
		local.dataArray = ArrayNew(2);
		local.result["data"] = {};
		local.count = 1;
		for (row in quizList){
			local.dataArray[count][1] = encodeForHTML(row.name);
			local.dataArray[count][2] = dateFormat(row.startDateTime,'yyyy/mm/dd') &
				' ' & timeFormat(row.startDateTime,'HH:nn:ss');
			local.dataArray[count][3] = dateFormat(row.endDateTime,'yyyy/mm/dd') &
				' ' & timeFormat(row.endDateTime,'HH:nn:ss');
			local.dataArray[count][4] = "<a href = ../faculty/quizQuestions?Id=#row.quizId#>Questions</a>";
 	 		if (now() < row.startDateTime){
 	 			local.dataArray[count][5] = "<button type = 'button' class = 'btn btn-success btn-sm'
												id = 'edit' name = 'edit' data-toggle = 'modal'
												data-target = '##rowEdit' data-id = '#row.quizId#'>
												<i class = 'glyphicon glyphicon-pencil'>&nbsp
												</i>Edit</button>"&
												"<button type = 'button' class = 'btn btn-danger btn-sm'
												id = 'delete' name = 'delete' data-toggle = 'modal'
												data-target = '##rowDelete' data-id = '#row.quizId#'>
												<i class = 'glyphicon glyphicon-trash'>&nbsp
												</i>Delete</button>";
 	 		}
  	 		else {
				local.dataArray[count][5] = "<button type = 'button' class = 'btn btn-success btn-sm' disabled>
 												<i class = 'glyphicon glyphicon-pencil'>&nbsp
												</i>Edit</button>"&
												"<button type = 'button' class = 'btn btn-danger btn-sm'
												disabled>
												<i class = 'glyphicon glyphicon-trash'>&nbsp
												</i>Delete</button>";
			}
			local.count = local.count + 1;
		}
		local.result.data = local.dataArray;
		return local.result;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : addFilter
Description    : formates quizList,
Arguments      : numeric userId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function addFilter(required numeric userId){
		local.getList = fetchQuizList(arguments.userId);
		local.dataStruct = {};
		for (row in getList){
			local.dataStruct["#row.quizId#"] = encodeForHTML(row.name);
		}
		return local.dataStruct;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchQuizDetails
Description    : executes query to get the quiz details,
Arguments      : struct formData.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchQuizDetails (numeric quizId = 0, string currentTime = 0){
		local.quizDetailsService = new query();
		local.quizDetailsService.setName("getDetails");
		local.commonSelect = " ,[quiz].[quizId],
					  		   [quiz].[startDateTime],
					           [quiz].[endDateTime] FROM [quiz]";
		if (arguments.quizId == 0 AND arguments.currentTime != 0){
			local.quizDetailsService.addParam(name = "currentTime", value = "#arguments.currentTime#");
			local.sql = "SELECT TOP(1) [quiz].[name] AS quizName,
									   [user].[firstName],
 									   [user].[lastName],
 									   [subject].[name] AS subjectName"
 									   & local.commonSelect &
 						" INNER JOIN   [user]
 					      ON 		   [quiz].[userId] 			 = [user].[userId]
						  INNER JOIN   [userSubject]
						  ON 		   [user].[userId]  		 = [userSubject].[userId]
						  INNER JOIN   [subject]
						  ON 		   [userSubject].[subjectId] = [subject].[subjectId]
						  WHERE 	   [quiz].[endDateTime]      >= : currentTime
						  ORDER BY 	   [quiz].[startDateTime]";
		}
		else {
			local.quizDetailsService.addParam(name = "quizId", value = "#arguments.quizId#",
			cfsqltype = "cf_sql_bigint");
			local.sql = "SELECT [quiz].[name],
								[quiz].[userId]" &
								local.commonSelect &
						" WHERE [quiz].[quizId] = :quizId";
		}
		local.quizDetailsService.setSQL(local.sql);
		getDetails = local.quizDetailsService.execute().getResult();
		return getDetails;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : getQuizDetails
Description    : formates the query returned from the fetchQuizDetails,
Arguments      : numeric quizId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getQuizDetails(required numeric quizId){
		local.quizList = fetchQuizDetails(arguments.quizId);
		local.data = {};
		for (row in quizList){
			data["quizName"] = row.name;
			data["startDateTime"] = dateTimeFormat(row.startDateTime, "yyyy/mm/dd HH:nn");
			data["endDateTime"] = dateDiff('n',row.startDateTime, row.endDateTime);
			data["quizId"] = row.quizId;
		}
		return data;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : deleteQuiz
Description    : remove the future quiz from database
Arguments      : numeric quizId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function deleteQuiz (required numeric quizId){
		try{
			transaction{
				local.checkTimeService = new query();
				local.checkTimeService.addParam(name = "quizId", value = "#arguments.quizId#",
					cfsqltype = "cf_sql_bigint");
				local.checkTimeService.setName("check");
				local.checkTimeService.setSQL("SELECT 	[startDateTime]
											   FROM 	[quiz]
											   WHERE 	[quiz].[quizId] = :quizId");
				check = local.checkTimeService.execute().getResult();
				if (check.startDateTime > now()){
					local.deleteQuestions = new query();
					local.deleteQuestions.addParam(name = "quizId", value = "#arguments.quizId#",
						cfsqltype = "cf_sql_bigint");
					local.deleteQuestions.setSQL("DELETE
												  FROM 	[quizQuestion]
												  WHERE [quizQuestion].[quizId] = :quizId");
					local.deleteQuestions.execute().getResult();

					local.deleteQuiz = new query();
					local.deleteQuiz.addParam(name = "quizId", value = "#arguments.quizId#",
						cfsqltype = "cf_sql_bigint");
					local.deleteQuiz.setSQL("DELETE
											 FROM 	[quiz]
											 WHERE 	[quiz].[quizId] = :quizId");
					local.deleteQuiz.execute().getResult();
				}//end of if
				else {
					return false;
				}//end of else
				return true;
			}//end of transaction
		}//end of try
		catch (database db){
			application.errorLogService(db,1);
		}
		catch (any e){
			application.errorLogService(e);
		}
		return false;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : updateQuiz
Description    : updates the modification made to the quiz details,
Arguments      : struct data.
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function updateQuiz(required struct data){
		try{
			transaction{
				local.queryDate = new Query();
				local.queryDate.setName("addDateTime");
				local.queryDate.addParam(name = "startDateTime",
					value = "#arguments.data.startDateTime#", cfsqltype = "cf_sql_varchar");
				local.queryDate.addParam(name = "endDateTime",
					value = "#arguments.data.endDateTime#", cfsqltype = "cf_sql_varchar");
				local.queryDate.setSQL("SELECT DATEADD (n, #arguments.data.endDateTime#,
														'#arguments.data.startDateTime#') 'RESULT'");
				addDateTime = local.queryDate.execute().getResult();

				local.updateQuizService = new query();
				local.updateQuizService.addParam(name = "quizName",
					value = "#arguments.data.quizName#", cfsqltype = "cf_sql_varchar");
				local.updateQuizService.addParam(name = "startDateTime",
					value = "#arguments.data.startDateTime#", cfsqltype = "cf_sql_varchar");
				local.updateQuizService.addParam(name = "result",
					value = "#addDateTime.RESULT#", cfsqltype = "cf_sql_varchar");
				local.updateQuizService.addParam(name = "quizId",
					value = "#arguments.data.quizId#", cfsqltype = "cf_sql_varchar");
				local.updateQuizService.setSQL("UPDATE  [quiz]
												SET 	[quiz].[name] 			= :quizName,
														[quiz].[startDateTime]  = :startDateTime,
														[quiz].[endDateTime] 	= :result
												WHERE 	[quiz].[quizId] 		= :quizId");
				local.updateQuizService.execute().getResult();

				return true;
			}
		}
		catch (database db){
			application.errorLogService(db,1);
		}
		catch (any e){
			application.errorLogService(e);
		}
		return false;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : deleteQuizQuestion
Description    : remove the question from the quiz,
Arguments      : numeric questionId,
				numeric quizId.
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function deleteQuizQuestion (required numeric questionId, required numeric quizId){
		try {
			local.deleteQuizQuestionService = new query();
			local.deleteQuizQuestionService.addParam(name = "quizId", value = "#arguments.quizId#",
				cfsqltype = "cf_sql_bigint");
			local.deleteQuizQuestionService.addParam(name = "questionId", value = "#arguments.questionId#",
				cfsqltype = "cf_sql_bigint");
			local.deleteQuizQuestionService.setSQL("DELETE
													FROM 		[quizQuestion]
													WHERE 		[quizQuestion].[quizId] 	= :quizId
													AND 		[quizQuestion].[questionId] = :questionId");
			local.deleteQuizQuestionService.execute().getResult();
		}
		catch (database db){
			application.errorLogService(db,1);
			return false;
		}
		catch (any e){
			application.errorLogService(e);
			return false;
		}
		return true;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : fetchQuizQuestions
Description    : fetches all the questions associated with a quiz,
Arguments      : numeric quizId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchQuizQuestions(required numeric quizId){
		local.questionListService = new Query();
		local.questionListService.setName("questionList");
		local.questionListService.addParam(name = "quizId",
			value = "#arguments.quizId#", cfsqltype = "cf_sql_bigint");
		local.questionListService.setSQL("SELECT [quizQuestion].[quizId],   [questionBank].[questionId],
												 [questionBank].[question], [questionBank].[option1],
												 [questionBank].[option2],  [questionBank].[option3],
												 [questionBank].[option4],  [questionBank].[correctAnswer]
										  FROM   [quizQuestion]
										  JOIN   [questionBank]
										  ON     [quizQuestion].[questionId] = [questionBank].[questionId]
										  WHERE  [quizQuestion].[quizId]     = :quizId");
		questionList = local.questionListService.execute().getResult();
		return questionList;
		}

/*------------------------------------------------------------------------------------------------------------
Function Name  : getQuizQuestions
Description    : formates all the questions associated with a quiz,
Arguments      : numeric quizId.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getQuizQuestions(required numeric quizId){
		local.quizQuestionList = fetchQuizQuestions(arguments.quizId);
		local.dataArray = ArrayNew(2);
		local.result["data"] = {};
		local.quizDetails = fetchQuizDetails(arguments.quizId);
		local.i = 1;
		for (row in quizQuestionList ){
			local.dataArray[i][1] = encodeForHTML(row.question);
			local.dataArray[i][2] = encodeForHTML(row.option1);
			local.dataArray[i][3] = encodeForHTML(row.option2);
			local.dataArray[i][4] = encodeForHTML(row.option3);
			local.dataArray[i][5] = encodeForHTML(row.option4);
			local.answer = encodeForHtml(row.correctAnswer);
				if (local.answer EQ "option1"){
					local.dataArray[i][6] = "Option A";
				}
				else if (local.answer EQ "option2"){
					local.dataArray[i][6] = "Option B";
				}
				else if (local.answer EQ "option3"){
					local.dataArray[i][6] = "Option C";
				}
				else if (local.answer EQ "option4"){
					local.dataArray[i][6] = "Option D";
				}
			if (now() < quizDetails.startDateTime){
				local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-danger btn-sm'
				id = 'delete' name = 'delete' data-toggle = 'modal' data-target = '##rowDelete'
				data-id = '#row.questionId#'>
				<i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>";
			}
			else {
				local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-danger btn-sm'
				data-toggle = 'modal' disabled>
				<i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>";
			}
			local.i = local.i + 1;
		}
		local.result.data = local.dataArray;
		return result;
	}
/*------------------------------------------------------------------------------------------------------------
Function Name  : addQuizQuestions
Description    : addes new questions to the already set quiz,
Arguments      : struct data.
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function addQuizQuestions (required struct data){
			try{
				local.idList = listToArray (arguments.data.questionId);
				for (ind in idList){
					local.queryService = new query();
					local.queryService.addParam(name = "questionId", value = "#ind#",
						cfsqltype = "cf_sql_bigint");
					local.queryService.addParam(name = "quizId", value = "#arguments.data.quizId#",
						cfsqltype = "cf_sql_bigint" );
					local.queryService.setSQL("INSERT INTO [quizQuestion]
											   VALUES 	   (:questionId, :quizId)");
					local.queryService.execute().getResult();
				}
			}
			catch (database db){
				application.errorLogService(db,1);
				return false;
			}
			catch (any e){
				application.errorLogService(e);
				return false;
			}
		return true;
	}
}