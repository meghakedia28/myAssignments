/*----------------------------------------------------------------------------------------------------------
FileName    : testService.cfc
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : controller to display messages on test.cfm.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true"{
	// Properties
	/**
	 * Constructor
	 */
	testService function init(){
		return this;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : displayTestMessage
Description    : checks and executes all the condition and then sends a structure which contains
				the codes to display the test information depending on condition,
Arguments      : struct data.
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function displayTestMessage(required struct data){
		local.setTest = {};
		local.quizService = createObject("component","demoApp.models.faculty.setQuizService");
		local.resultService = createObject("component","demoApp.models.faculty.resultService");
		local.currentTime = dateTimeFormat(now(),'yyyy/mm/dd HH:nn:ss');
		local.testDetails = quizService.fetchQuizDetails(currentTime = currentTime);
		local.setTest.currentTime = local.currentTime;
		if (local.testDetails.quizId != ''){
			local.setTest.noTest = "false";
			local.testScore = resultService.fetchScoreIds(userId = session.stLoggedInUser.userId,
														  quizId = testDetails.quizId);
			if (local.testScore.recordCount == 0){
				local.setTest.testCompleted = "false";
			}
			else{
				local.setTest.testCompleted = "true";
			}
			if (structKeyExists(arguments.data,"submitEnd") AND (testScore.recordCount != 0)){
				local.setTest.submit = "true";
			}
			if ((local.currentTime >= local.testDetails.startDateTime)
					AND (local.currentTime <= local.testDetails.endDateTime)){
				local.setTest.onGoingTest = "true";
				if (local.testScore.recordCount == 0){
					local.setTest.completed = "false";
				}
				else if (!(structKeyExists(data,"submitEnd"))){
					local.setTest.completed = "true";
				}
			}
			else{
				local.setTest.onGoingTest = "false";
			}
		}
		else{
			local.setTest.noTest = "true";
		}
		if (structKeyExists(local,"testDetails") AND (testDetails.recordCount != 0)){
			local.setTest.quizDetails = local.testDetails;
		}
		return local.setTest;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : checkTestTime
Description    : validates and check the test start
Arguments      : none.
Return Type    : boolean.
------------------------------------------------------------------------------------------------------------*/

	function checkTestTime (){
		local.currentTime = dateTimeFormat(now(),"yyyy-mm-dd HH:nn:ss");
		local.quizObject = createObject("component","demoApp.models.faculty.setQuizService");
		local.testDetails = quizObject.fetchQuizDetails(currentTime = currentTime);
		local.startTime = testDetails.startDateTime;
		local.endTime = testDetails.endDateTime;
		try{
 			transaction{
				local.resultObject = createObject("component","demoApp.models.faculty.resultService");
				local.checkScoreExists = resultObject.fetchScoreIds(userId = session.stLoggedInUser.userId,
																	quizId = testDetails.quizId);
				if (!((local.currentTime >= local.startTime)
						AND (local.currentTime <= local.endTime) AND (local.checkScoreExists.recordCount == 0))){
					return false;
				}
				else{
					if (local.checkScoreExists.recordCount == 0){
						session.stQuizStarts = {"quizId" = testDetails.quizId ,
												"startTime" = testDetails.startDateTime,
												"endTime" = testDetails.endDateTime };
					}
				}
			return true;
			 }
		}
		catch (database db){
		  	application.errorLogService(db,1);
	  	}
 		catch(any e){
			application.errorLogService(e);
 		}
 		return false;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : testStartValidation
Description    : validates test information before the test starts in testStart.cfm
Arguments      : none.
Return Type    : struct.
------------------------------------------------------------------------------------------------------------*/

	function testStartValidation(){
		local.results = {};
		if (structKeyExists(session,"stQuizStarts")){
			local.results.quizStructExists = "true";
			if (!(session.stQuizStarts.endTime > now()) && (session.stQuizStarts.startTime < now())){
				destroySession();
				local.results.relocate = "true";
			}
			local.resultObject = createObject("component","demoApp.models.faculty.resultService");
			local.checkScoreExists = resultObject.fetchScoreIds(userId = session.stLoggedInUser.userId,
											 					quizId = session.stQuizStarts.quizId);
			if ((session.stQuizStarts.endTime < now()) || (checkScoreExists.recordCount != 0)){
				local.results.endTest = "true";
			}
			else{
				local.results.relocate = "false";
				local.results.endTest = "false";
			}
		}
		else{
			local.results.quizStructExists = "false";
		}
		return local.results;
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : destroySession
Description    : removes the quizDetails from session
Arguments      : none.
Return Type    : none.
------------------------------------------------------------------------------------------------------------*/

	function destroySession(){
		if (structKeyExists(session, "stQuizStarts")){
			structdelete(session, "stQuizStarts");
		}
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : generateInsertReport
Description    : generates the report and stores in database
Arguments      : numeric quizQuestionId,
				 numeric quizId,
				 numeric userId,
				 string userAnswer
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function generateInsertReport(  required numeric quizQuestionId,
						    		required numeric quizId,
									required numeric userId,
									required string userAnswer){
	try{
		transaction{
			local.reportService = new query();
			local.reportService.setName("getAnswer");
			local.reportService.addParam(name = "quizQuestionId", value = "#arguments.quizQuestionId#",
				cfsqltype = "cf_sql_bigint");
			local.reportService.setSQL ("SELECT [questionBank].[correctAnswer]
										 FROM	[questionBank]
										 JOIN 	[quizQuestion]
										 ON		[questionBank].[questionId] = [quizQuestion].[questionId]
										 WHERE	[quizQuestion].[quizQuestionId] = :quizQuestionId");
			getAnswer = local.reportService.execute().getResult();

			local.score = 0;
			local.comparison = compare(getAnswer.correctAnswer, arguments.userAnswer);
			if (local.comparison == 0){
				local.score = 1;
			}
			if (arguments.userAnswer != ""){
			local.report = arguments.quizQuestionId & "," &
						   getAnswer.correctAnswer & "," &
						   arguments.userAnswer & ";";
			}
			else{
				local.report = arguments.quizQuestionId & "," &
						   getAnswer.correctAnswer & ",0" & ";";
			}
			local.totalScoreService = new query();
			local.totalScoreService.setName("getTotalScore");
			local.totalScoreService.addParam(name = "quizId", value = "#arguments.quizId#",
				cfsqltype = "cf_sql_bigint");
			local.totalScoreService.setSQL ("SELECT [quizQuestion].[quizQuestionId]
											 FROM	[quizQuestion]
										 	 WHERE	[quizQuestion].[quizId] = :quizId");
			getTotalScore = local.totalScoreService.execute().getResult();
			local.totalScore = getTotalScore.recordCount;

			local.checkScoreService = new query();
			local.checkScoreService.setName("getScoreDetails");
			local.checkScoreService.addParam(name = "quizId", value = "#arguments.quizId#",
				cfsqltype = "cf_sql_bigint");
			local.checkScoreService.addParam(name = "userId", value = "#arguments.userId#",
				cfsqltype = "cf_sql_bigint");
			local.checkScoreService.setSQL ("SELECT [scoreDetails].[scoreId],
													[scoreDetails].[answerReport],
													[scoreDetails].[score]
											 FROM	[scoreDetails]
										 	 WHERE	[scoreDetails].[quizId] = :quizId
										 	 AND	[scoreDetails].[userId] = :userId");
			getScoreDetails = local.checkScoreService.execute().getResult();
			local.countGetScore = getScoreDetails.recordCount;
			if (local.countGetScore == 0 ){
				local.percentageScore = precisionEvaluate((score/totalScore)*100.0);
				local.insertReportService = new query();
				local.insertReportService.addParam(name = "quizId", value = "#arguments.quizId#",
					cfsqltype = "cf_sql_bigint");
				local.insertReportService.addParam(name = "userId", value = "#arguments.userId#",
					cfsqltype = "cf_sql_bigint");
				local.insertReportService.addParam(name = "percentageScore", value = "#local.percentageScore#",
					cfsqltype = "cf_sql_decimal", scale = "2");
				local.insertReportService.addParam(name = "report", value = "#local.report#",
					cfsqltype = "cf_sql_varchar");
				local.insertReportService.setSQL ("INSERT INTO [scoreDetails]
												   VALUES
												   (:quizId,
												    :userId,
												    :report,
												    :percentageScore)");
				local.insertReportService.execute().getResult();
			}
			else{
				local.answerRecord = getScoreDetails.answerReport;
				local.currentScore = getScoreDetails.score;
				local.answerRecord = local.answerRecord & local.report;
				if (local.score == 1){
					local.currentScore = ceiling((currentScore * local.totalScore) / 100.0);
					local.currentScore = local.currentScore + 1;
					local.currentScore = precisionEvaluate((local.currentScore/local.totalScore)*100.0);
				}
				local.insertReportService = new query();
				local.insertReportService.addParam(name = "quizId", value = "#arguments.quizId#",
					cfsqltype = "cf_sql_bigint");
				local.insertReportService.addParam(name = "userId", value = "#arguments.userId#",
					cfsqltype = "cf_sql_bigint");
				local.insertReportService.addParam(name = "currentScore", value = "#local.currentScore#",
					cfsqltype = "cf_sql_decimal", scale = "2");
				local.insertReportService.addParam(name = "answerRecord", value = "#local.answerRecord#",
					cfsqltype = "cf_sql_varchar");
				local.insertReportService.setSQL ("UPDATE [scoreDetails]
												   SET    [scoreDetails].[answerReport] = :answerRecord,
												   		  [scoreDetails].[score] 		= :currentScore
												   WHERE  [scoreDetails].[quizId]		= :quizId
												   AND	  [scoreDetails].[userId] 		= :userId");
				local.insertReportService.execute().getResult();
				}
			}
			return true;
		}
		catch(database db){
			application.errorLogService(db,1);
			return false;
		}
		catch(any e){
			application.errorLogService(e);
			return false;
		}
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : testEnd
Description    : calls insertion to insert last question,
				then generates the report if the question is skipped
Arguments      : struct data
Return Type    : boolean
------------------------------------------------------------------------------------------------------------*/

	function testEnd (required struct data){
		local.skipped = 0;
		local.insert = generateInsertReport(quizQuestionId = arguments.data.quizQuestionId,
													quizId = arguments.data.quizId,
													userId = arguments.data.userId,
												userAnswer = arguments.data.userAnswer);
		try{
			transaction{
				local.getQuizQuestionIds =  new query();
				local.getQuizQuestionIds.addparam (name = "quizId", value = "arguments.data.quizId",
					cfsqltype = "cf_sql_bigint");
				local.getQuizQuestionIds.setName("getIds");
				local.getQuizQuestionIds.setSQL("SELECT [quizQuestion].[quizQuestionId],
														[questionBank].[correctAnswer]
												 FROM   [quizQuestion]
												 JOIN	[questionBank]
												 ON		[questionBank].[questionId] = [quizQuestion].[questionId]
												 WHERE  [quizQuestion].[quizId] = :quizId");
				getIds = local.getQuizQuestionIds.execute().getResult();

				local.getReportService =  new query();
				local.getReportService.addparam (name = "quizId", value = "arguments.data.quizId",
					cfsqltype = "cf_sql_bigint");
				local.getReportService.addparam (name = "userId", value = "arguments.data.userId",
					cfsqltype = "cf_sql_bigint");
				local.getReportService.setName("getReport");
				local.getReportService.setSQL("SELECT   [scoreId],
														[answerReport]
											   FROM	    [scoreDetails]
											   WHERE	[scoreDetails].[quizId] = :quizId
											   AND		[scoreDetails].[userId] = :userId");
				getReport = local.getReportService.execute().getResult();

				for(row in getIds){
					local.id = row.quizQuestionId & ",";
					local.report = "";
					if (getReport.recordCount != 0){
						local.match = findNoCase(id,getReport.answerReport);
						if (local.match == 0){
							local.skipped = 1;
							local.report &= id & "row.correctAnswer" & ",0,;";
						}
					}
					else{
						local.skipped = 1;
						local.report &= id & "row.correctAnswer" & ",0,;";
					}
				}
				if (local.skipped == 1){
					local.report = getReport.answerReport & local.report;
					local.updateReportService =  new query();
					local.updateReportService.addparam (name = "scoreId", value = "getReport.scoreId",
						cfsqltype = "cf_sql_bigint");
					local.updateReportService.addparam (name = "newReport", value = "local.report",
						cfsqltype = "cf_sql_varchar");
					local.updateReportService.setSQL("UPDATE [scoreDetails]
													  SET [answerReport] = :newReport
													  WHERE [scoreDetails].[scoreId] = :scoreId");
					local.updateReportService.execute().getResult();
				}
			return true;
			}
		}
		catch(database db){
			application.errorLogService(db,1);
			return false;
		}
		catch(any e){
			application.errorLogService(e);
			return false;
		}
	}

/*------------------------------------------------------------------------------------------------------------
Function Name  : getScore
Description    : returns the score after the quiz
Arguments      : numeric quizId,
				 numeric userId
Return Type    : integer
------------------------------------------------------------------------------------------------------------*/

	function getScore(required numeric quizId, required numeric userId){
		local.scoreService =  new query();
		local.scoreService.setName("userScore");
		local.scoreService.addparam (name = "quizId", value = "#arguments.quizId#",
			 cfsqltype = "cf_sql_bigint");
		local.scoreService.addparam (name = "userId", value = "#arguments.userId#",
			 cfsqltype = "cf_sql_bigint");
		local.scoreService.setSQL("SELECT 	[score]
								   FROM 	[scoreDetails]
								   WHERE 	[scoreDetails].[quizId] = :quizId
								   AND		[scoreDetails].[userId] = :userId");
		userScore = local.scoreService.execute().getResult();
		return userScore.score;
	}
}