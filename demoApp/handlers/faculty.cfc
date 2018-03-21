/**
* I am a new handler
*/
component extends="coldbox.system.EventHandler"{

	property name = "questionsService" inject = "id:questionsService";
	property name = "viewQuestions" inject = "id:viewQuestions";
	property name = "modifyQuestionService" inject = "id:modifyQuestionService";
	property name = "quizService" inject = "id:quizService";
	property name = "resultService" inject = "id:resultService";
	property name = "userDetails" inject = "id:userDetailsService";
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	* home
	*/
	function home( event, rc, prc ){
		event.setView( view = "faculty/home", layout = "facultyFront" );
	}

	/**
	* addQuestions
	*/
	function addQuestions( event, rc, prc ){
		event.setView( view = "faculty/addQuestions", layout = "facultyFront" );
	}

	/**
	* questionBank
	*/
	function questionBank( event, rc, prc ){
		event.setView( view = "faculty/questionBank", layout = "facultyFront" );
	}

	/**
	 *
	 **/
	function quizQuestions( event,rc, prc){
		var getListQuery = quizService.getquizList(#session.stLoggedInUser.UserId#);
		var getList = #valueList(getListQuery.quizId,",")#;
		if ((NOT (structKeyExists(rc,"Id"))) || (NOT (listFindNoCase(getList, rc.Id)))){
		 	event.setView( view = "faculty/viewQuiz", layout = "facultyFront");
		}
		else {
			prc.quizDetails = quizService.getQuizDetails(rc.Id);
			event.setView( view = "faculty/quizQuestions", layout = "facultyFront");
		}
	}

	/**
	* results
	*/
	function results( event, rc, prc ){
		event.setView( view = "faculty/results", layout = "facultyFront" );
	}
	/**
	* setQuiz
	*/
	function setQuiz( event, rc, prc ){
		var getResult =
		event.setView( view = "faculty/setQuiz", layout = "facultyFront" );
	}
	/**
	* studentsProfile
	*/
	function studentsProfile( event, rc, prc ){
		event.setView( view = "faculty/studentsProfile", layout = "facultyFront" );
	}
	/**
	* studentsReport
	*/
	function studentsReport( event, rc, prc ){
		var getIds = resultService.fetchScoreIds(#session.stLoggedInUser.UserId#);
		var scoreIdsList = valueList(getIds.scoreId,",");
		if ((NOT (structKeyExists(rc,"Id"))) || (NOT (listFindNoCase(scoreIdsList, rc.Id)))){
			event.setView( view = "faculty/results", layout = "facultyFront" );
		}
		else {
			prc.scoreDetails = resultService.fetchResultDetails(rc.Id);
			event.setView( view = "faculty/studentsReport", layout = "facultyFront" );
		}
	}
	/**
	* studentsResult
	*/
	function studentsResult( event, rc, prc ){
		event.setView( view = "faculty/studentsResult", layout = "facultyFront" );
	}
	/**
	* viewQuiz
	*/
	function viewQuiz( event, rc, prc ){
		event.setView( view = "faculty/viewQuiz", layout = "facultyFront" );
	}
	/**
	 * enterQuestions
	 **/
	function enterQuestions(event, rc, prc){
		if (event.isAjax()){
			var row = questionsService.validateAllFields(rc);
			event.renderData(format="json", data = SerializeJSON(row));
		}
		else{
			event.norender();
		}
	}

	function viewQuizList(event,rc,prc){
		var quizList = quizService.getQuizList(rc.userId);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var count = 1;
		for (row in quizList){
			local.dataArray[count][1] = encodeForHTML(row.name);
			local.dataArray[count][2] = DateFormat(row.startDateTime,'yyyy/mm/dd') &
				' ' & TimeFormat(row.startDateTime,'HH:nn:ss');
			local.dataArray[count][3] = DateFormat(row.endDateTime,'yyyy/mm/dd') &
				' ' & TimeFormat(row.endDateTime,'HH:nn:ss');
			local.dataArray[count][4] = "<a href = '#event.buildLink( "faculty.quizQuestions?Id=#row.quizId#" )#'>Questions</a>";
			if (now() < row.startDateTime){
				local.dataArray[count][5] = "<button type = 'button' class = 'btn btn-success btn-sm'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
					data-id = '#row.quizId#'>
					<i class = 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
					"<button type = 'button' class = 'btn btn-danger btn-sm' id = 'delete'
					name = 'delete' data-toggle = 'modal' data-target = '##rowDelete'
					data-id = '#row.quizId#'>
					<i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>";
			}
			else {
				local.dataArray[count][5] = "<button type = 'button' class = 'btn btn-success btn-sm'  disabled>
					<i class = 'glyphicon glyphicon-pencil'>&nbsp</i>Edit</button>"&
					"<button type = 'button' class = 'btn btn-danger btn-sm' disabled>
					<i class = 'glyphicon glyphicon-trash'>&nbsp</i>Delete</button>";
			}
			local.count = local.count + 1;
		}
		local.result.data = local.dataArray;
		event.renderData(format = "json", data = serializeJSON(local.result));
	}

	/**
	 * viewQuestionBank
	 **/
	 function viewQuestionBank(event,rc,prc){
	 	var data = viewQuestions.getAllQuestions(rc);
	 	var dataArray = arrayNew(2);
		var i = 1;
		var result["data"] = {};
		var answer = "";
		for ( row in data ) {
			local.dataArray[i][1] = encodeForHtml(row.question);
			local.dataArray[i][2] = encodeForHtml(row.option1);
			local.dataArray[i][3] = encodeForHtml(row.option2);
			local.dataArray[i][4] = encodeForHtml(row.option3);
			local.dataArray[i][5] = encodeForHtml(row.option4);
			local.answer = encodeForHtml(row.correctAnswer);
			if (local.answer == "option1"){
				local.dataArray[i][6] = "Option A";
			}
			else if (local.answer == "option2"){
				local.dataArray[i][6] = "Option B";
			}
			else if (local.answer == "option3"){
				local.dataArray[i][6] = "Option C";
			}
			else if (local.answer == "option4"){
				local.dataArray[i][6] = "Option D";
			}
			if (modifyQuestionService.checkEditability(row.questionId)){
				local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-success btn-sm'
							id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
							data-id = '#row.questionId#'><i class = 'glyphicon glyphicon-pencil'>
							</i>edit</button>"&"<button type = 'button' class = 'btn btn-danger btn-sm'
							id = 'delete' name = 'delete' data-toggle = 'modal' data-target = '##rowDelete'
							data-id = '#row.questionId#' ><i class = 'glyphicon glyphicon-remove'>
							</i>Delete</button>";
		 	}
			else {
		  		local.dataArray[i][7] = "<button type = 'button' class = 'btn btn-success btn-sm' disabled>
			 			<i class = 'glyphicon glyphicon-pencil'></i>edit</button>"&
			 			"<button type = 'button' class = 'btn btn-danger btn-sm' data-toggle = 'modal' disabled>
			 			<i class = 'glyphicon glyphicon-remove'></i>Delete</button>";
 			}
 			local.i = local.i+1;
 		}
 		local.result["data"] = local.dataArray;
 		event.renderData(format = "json", data = serializeJSON(result));
 	 }//end of viewQuestionBank

 	 /**
 	 * viewQuestions
 	 **/

 	 function populateQuestionInModal(event, rc, prc){
 	 	var getDetails = viewQuestions.getSingleQuestion(rc.questionId);
 	 	var data = {};
 	 	for ( row in getDetails ) {
 			local.data["question"] = row.question;
	 		local.data["optiona"] = row.option1;
 			local.data["optionb"] = row.option2;
 			local.data["optionc"] = row.option3;
  			local.data["optiond"] = row.option4;
	 		local.data["answer"] = row.correctAnswer;
	 		local.data["questionId"] = row.questionId;
	  	}
	  	event.renderData(format="json", data = serializeJSON(local.data));
	 } //end of populateQuestionInModal

	 /**
 	 *deleteRow
	 **/
 	 function deleteRow(event,rc,prc){
 		var status = modifyQuestionService.deleteRecord(rc.questionId);
 		return status;
 	 }//end of deleteRow
 	 /**
  	 *editRow
	  **/
	function editRow(event,rc,prc){
		 var status = modifyQuestionService.modifyRecord(rc);
		event.renderData(format = "json", data = serializeJSON(status));
	 }

	 function setQuizQuestions(event,rc,prc){
	 	var listOfData = viewQuestions.getAllQuestions(rc);
	 	var result["data"] = {};
	 	var dataArray = ArrayNew(2);
		var answer = "";
		var i = 1;
		for (row in listOfData){
			local.dataArray[i][1] = "<input type = 'checkbox' class = 'question'
										name = 'questionId'  id = 'questionId_#row.questionId#'
										value = '#row.questionId#'></input>";
 	 		local.dataArray[i][2] = encodeForHtml(row.question);
 	 		local.dataArray[i][3] = encodeForHtml(row.option1);
 	 		local.dataArray[i][4] = encodeForHtml(row.option2);
 	 		local.dataArray[i][5] = encodeForHtml(row.option3);
 	 		local.dataArray[i][6] = encodeForHtml(row.option4);
 	 		local.answer = encodeForHtml(row.correctAnswer);
	  		if (local.answer == "option1"){
 	 			local.dataArray[i][7] = "Option A";
  	 		}
	  		else if (local.answer == "option2"){
	  			local.dataArray[i][7] = "Option B";
	  		}
	  		else if (local.answer == "option3"){
	  			local.dataArray[i][7] = "Option C";
	  		}
	  		else if (local.answer == "option4"){
	  			local.dataArray[i][7] = "Option D";
	  		}
	  		local.i = local.i+1;
	  	}//end of for
	  	local.result["data"] = local.dataArray;
	  	event.renderData(format = "json", data = serializeJSON(result));
	   }
	 function checkTestTime(event,rc,prc){
	    var data = quizService.checkStartTime(rc);
	 	event.renderData(format = "json", data = serializeJSON(data));
	 }
	 function checkTestName(event,rc,prc){
	 	var data = quizService.checkQuizName(rc);
	 	event.renderData(format = "json", data = serializeJSON(data));
	 }

	function validateInsertController (event,rc,prc){
		var insertionStruct = {successfull = {}, message = {}};
	 	try {
	  		 var errorStruct = quizService.validateAllFields(rc);
		 	 if ((structKeyExists(errorStruct,"errorId")) AND (structIsEmpty(local.errorStruct.errorId))){
		 	 	var insertion = quizService.insertQuizDetails(rc,session.stLoggedInUser.userId);
		 		if (insertion){
		 			local.insertionStruct.successfull = "true";
		  			local.insertionStruct.message = "Quiz has been successfully set";
		  			event.renderData(format = "json", data = serializeJSON(local.insertionStruct));
			 	}
			 	else {
			 		local.insertionStruct.successfull = "false";
			 		local.insertionStruct.message = "Error occured while insertion of data";
			 		event.renderData(format = "json", data = serializeJSON(local.insertionStruct));
			 	}//end of else
			}//end of if
			else {
				event.renderData(format = "json", data = serializeJSON(local.errorStruct));
			}//end of else
		}//end of try
		catch (any e){
			writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
					type = "Error");
			local.insertionStruct.successfull = "false";
			local.insertionStruct.message = "Error occured while insertion of data";
			event.renderData(format = "json", data = serializeJSON(local.insertionStruct));
		}//end of catch
	}

	function populateModel (event,rc,prc){
		var data = {};
		var getDetails = quizService.getQuizDetails(arguments.rc.quizId);
		for (row in getDetails){
			data["quizName"] = row.name;
			data["startTime"] = DateTimeFormat(row.startDateTime, "yyyy/mm/dd HH:nn");
			data["endTime"] = DateDiff('n',row.startDateTime, row.endDateTime);
			data["quizId"] = row.quizId;
		}
		event.renderData(format = "json", data = serializeJSON(local.data));
	}

	function removeQuiz (event,rc,prc){
		var status = quizService.deleteQuiz(rc.quizId);
		event.renderData(format = "json", data = serializeJSON(local.status));
	}

	function updateRow(event,rc,prc){
		var insertionStruct = {successfull = {}, message = {}};
		try {
			var errorStruct = quizService.validateAllFields(rc);
			if (structKeyExists(errorStruct,"errorId") AND structIsEmpty(local.errorStruct.errorId)){
				var update = quizService.updateQuiz(rc);
				if (update){
					local.insertionStruct.successfull = "true";
		  			local.insertionStruct.message = "Quiz has been successfully set";
		  			event.renderData(format = "json", data = serializeJSON(local.insertionStruct));
				}//end of if
				else{
					local.insertionStruct.successfull = "false";
			 		local.insertionStruct.message = "Error occured while insertion of data";
			 		event.renderData(format = "json", data = serializeJSON(local.insertionStruct));
				}//end of else
			}//end of if
			else {
				event.renderData(format = "json", data = serializeJSON(local.errorStruct));
				}//end of else
			}//end of try
		catch (any e){
			writeLog (file="error", text = "#e.message# #e.detail# #e.ExtendedInfo#",
					type = "Error");
			local.insertionStruct.successfull = "false";
			local.insertionStruct.message = "Error occured while insertion of data";
			event.renderData(format = "json", data = serializeJSON(local.insertionStruct));
		}//end of catch
	}//end of updateRow

	function getQuizQuestionList(event,rc,prc){
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var quizQuestionList = quizService.getQuizQuestions(rc.quizId);
		var quizDetails = quizService.getQuizDetails(rc.quizId);
		var i = 1;
		for (row in quizQuestionList ){
			local.dataArray[i][1] = encodeForHTML(row.question);
			local.dataArray[i][2] = encodeForHTML(row.option1);
			local.dataArray[i][3] = encodeForHTML(row.option2);
			local.dataArray[i][4] = encodeForHTML(row.option3);
			local.dataArray[i][5] = encodeForHTML(row.option4);
			var answer = encodeForHtml(row.correctAnswer);
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
		event.renderData(format = "json", data = serializeJSON(local.result));
	}

	function removeQuizQuestion(event,rc,prc){
		var status = quizService.deleteQuizQuestion(rc.questionId, rc.quizId);
		event.renderData(format = "json", data = serializeJSON(status));
	}

	function updateQuizQuestion(event,rc,prc){
		var status = quizService.addQuizQuestions(rc);
		event.renderData(format = "json", data = serializeJSON(status));
	}

	function viewResults( event, rc, prc ){
		var resultSet = resultService.fetchFacultyResultSet(rc);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var count = 1;
		for (row in resultSet){
			local.dataArray[count][1] = encodeForHTML(row.name);
			local.dataArray[count][2] = DateFormat(row.startDateTime,'yyyy/mm/dd') & ' '
			& TimeFormat(row.startDateTime,'HH:nn:ss');
			local.dataArray[count][3] = DateFormat(row.endDateTime,'yyyy/mm/dd') & ' '
			& TimeFormat(row.endDateTime,'HH:nn:ss');
			local.dataArray[count][4] = encodeForHTML(row.firstName) &' '& encodeForHTML(row.lastName);
			local.dataArray[count][5] =
				"<a href = '#event.buildLink( "faculty.studentsReport?Id=#row.scoreId#" )#'>#row.score# %</a>";
			local.dataArray[count][6] = encodeForHTML(row.RANK);
			local.count = local.count + 1;
		}
		result.data = dataArray;
		event.renderData(format = "json", data = serializeJSON(local.result));
	}

	function applyQuizFilter(event,rc,prc){
		var getList = quizService.getQuizList(rc.userId);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var i = 1;
		for (row in getList){
			local.dataArray[i][1] =
				"<input type = 'checkbox' name = 'quizId' id = 'quizId' value = '#row.quizId#'></input>";
			local.dataArray[i][2] = encodeForHTML(row.name);
			local.i = local.i + 1;
		}
		result.data = dataArray;
		event.renderData(format = "json", data = serializeJSON(local.result));
	}

	function viewReport (event,rc,prc){
		var report = resultService.generateReport(rc.scoreId);
		event.renderData(format = "json", data = serializeJSON(local.report));
	}

	function viewStudents (event,rc,prc){
		var results = userDetails.getStudentsDetails();
		event.renderData(format = "json", data = serializeJSON(local.results));
	}

	function individualResultSet(event,rc,prc){
		var score = resultService.getStudentResultSet(rc);
		event.renderData(format = "json", data = serializeJSON(local.score));
	}
}
