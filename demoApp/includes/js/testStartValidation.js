/*----------------------------------------------------------------------------------------------------------
						FileName    : testStartValidation.cfc
						Created By  : Megha Kedia
						DateCreated : 13-March-2018
						Description : validation for tests and displays questions.

------------------------------------------------------------------------------------------------------------*/

var count = 1;
var quizId = $("#quizId").val();
var userId = $("#userId").val();
var quizQuestionId;
var total;
var loaderUrl = location.protocol + '//' + location.host; 
$(document).ready(function(){
	var url = "../?event=student.getQuestions";
	var data = {quizId : quizId};
	gobalAjaxHandler(url, data, getFirstQuestion);
	var serverTime = new Date($('#nowTime').val()).getTime();
	var startTime = new Date($('#startTime').val()).getTime();
	var endTime = new Date($('#endTime').val()).getTime();
	var timer  = (endTime - serverTime)/1000 ;
	timedCount();

/*--------------------------------------------------------------------------------------
Function Name  : timedCount
Description    : calculate time and starts counter for test
Arguments	   : none
Return Type	   : none
------------------------------------------------------------------------------------------*/

    function timedCount()
	{
    	var hours = parseInt( timer / 3600 ) % 24;
    	var minutes = parseInt( timer / 60 ) % 60;
    	var seconds = timer % 60;
    	var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);       
    	$('#timer').html(result);
        if(timer == 0 )
		{
        	setConfirmUnload(false);
            $("#startTest").submit();
            location.replace(loaderUrl + "/demoApp/index.cfm/?event=student.tests&submitEnd&quizId="+quizId);
			
		}
        timer = timer - 1;
        setTimeout(function()
		{
		 timedCount()
		},
		1000);
    }

/*--------------------------------------------------------------------------------------
Function Name  : setConfirmUnload
Description    : confirm message onload
Arguments	   : on
Return Type	   : none
------------------------------------------------------------------------------------------*/

    function setConfirmUnload(on) {
        window.onbeforeunload = (on) ? unloadMessage : null;
   }

/*--------------------------------------------------------------------------------------
Function Name  : unloadMessage
Description    : navigation message is shown
Arguments	   : on
Return Type	   : string
------------------------------------------------------------------------------------------*/

    function unloadMessage() {
        return 'You have started giving the test. If you navigate away from this page the changes made will be lost.';
   }
    $(':input').bind(
            'change', function() { setConfirmUnload(true); 
    });
    $("#startTest").submit(function(event) {
		event.preventDefault();
		setConfirmUnload(false);
	 	 if(timer == 0 || confirm("Do you really want to submit the test?")){
	 		var result = $("#startTest").serializeArray();
	 		var answer = result[5].value;
	 		count++;
	 		var url = "../?event=student.getNext";
	 		var data = {
						quizId : quizId,
						userAnswer : answer,
						quizQuestionId : quizQuestionId,
						userId : userId
						}
	 		gobalAjaxHandler(url, data, submitStatus);
	 	 }
	 	 else {
	 		 return false;
	 	 }
	});
});

/*--------------------------------------------------------------------------------------
Function Name  : submitStatus
Description    : relocate after submitting the test
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function submitStatus(result){
	var obj = $.parseJSON(result);
	if (obj){
		location.replace(loaderUrl + "/demoApp/index.cfm/?event=student.tests&submitEnd&quizId="+quizId);
	}
	else{
		location.replace(loaderUrl + "/demoApp/index.cfm/?event=student.tests&error");
	}
}

/*--------------------------------------------------------------------------------------
Function Name  : getFirstQuestion
Description    : success funtion for ajax call to get the first question
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function getFirstQuestion(result){
	var obj = $.parseJSON(result);
	$("#questionNumber").text(count+".");
	$("#question").text(obj.question);
	$("#optionAName").text(obj.optiona);
	$("#optionBName").text(obj.optionb);
	$("#optionCName").text(obj.optionc);
	$("#optionDName").text(obj.optiond);
	total = obj.total;
	$("#info").text("Question "+count+" out of "+obj.total+ ".");
	quizQuestionId = obj.quizQuestionId;
}

/*--------------------------------------------------------------------------------------
Function Name  : getNextQuestions
Description    : ajax call to get the next question
Arguments	   : none
Return Type	   : none
------------------------------------------------------------------------------------------*/

function getNextQuestions(){
	count = count + 1;
	var result = $("#startTest").serializeArray();
	var answer = result[5].value;
	$("input[name = 'answer']").prop("checked",false);
	if (count == total){
		$("#nextQuestion").remove();
	}
	var url = "../?event=student.getNext";
	var data = {
				quizId : quizId,
				rowNumber : count,
				userAnswer : answer,
				quizQuestionId : quizQuestionId,
				userId : userId
			}
	gobalAjaxHandler(url, data, getNextQuestionStatus);
}

/*--------------------------------------------------------------------------------------
Function Name  : getNextQuestionStatus
Description    : success function for ajax call to get the next question
Arguments	   : result
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function getNextQuestionStatus (result){
	var obj = $.parseJSON(result);
	$("#question").text(obj.question);
	$("#optionAName").text(obj.optiona);
	$("#optionBName").text(obj.optionb);
	$("#optionCName").text(obj.optionc);
	$("#optionDName").text(obj.optiond);
	quizQuestionId = obj.quizQuestionId;
	$("#info").text("Question "+count+" out of "+total+ ".");
	return true;
}