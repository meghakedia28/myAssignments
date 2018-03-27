/*----------------------------------------------------------------------------------------------------------
						FileName    : quizValidation.cfc
						Created By  : Megha Kedia
						DateCreated : 15-March-2018
						Description : does validation related to setting a quiz.

------------------------------------------------------------------------------------------------------------*/

jQuery(document).ready(function($){
	var id = $('#userId').val();
	var table = $("#questions").DataTable({
		"columnDefs": [ {
		      "targets"  : [0],
		      "orderable": false,
		      "searchable": false
		    }],
		"order": [],
		"ajax": {
			url : "../?event=faculty.setQuizQuestions",
			data :{
				userId : id,
				action : "setQuiz"
			}
		}
	});
	var newDate = new Date();
	$('#startDateTime').datetimepicker({
		formatDate : 'Y/m/d',
		formateTime :'hh:ii',
		minDateTime: new Date(newDate.getTime())
	});
	$("#quizForm").submit(function(event){	
		event.preventDefault();
		var valid = validate();
		var url = "../?event=faculty.submitQuizForm";
		if (valid) {
			$("#error_questions").text("");
			gobalAjaxHandler(url, $("#quizForm").serialize(), submitQuizStatus);
		}
	});
	$(".inputField").focus(function(){
		$(this).css("border","");
		$(this).next(".error-msg").text("");
	});
	$("#quizName").focusout(function(){
		var quiz = $("#quizName").val();
		var validate = quizName("#quizName","#error_quizname");
		var url = "../?event=faculty.checkTestName";
		var data = {quizName : quiz};
		if (validate){
			gobalAjaxHandler(url, data, quizNameStatus);
		}
	});
	
	$("#startDateTime").focusout(function(){
		var start = $("#startDateTime").val();
		if (start == "" || start == null && !(1)){
			showErrorMessage("#startDateTime", "#error_startdatetime", "You can't leave this empty.");
			return false;
		}
		else{
			var url = "../?event=faculty.checkTestTime";
			var data = {startDateTime : start };
			gobalAjaxHandler(url, data, startDateTimeStatus);
		}
	});
	$("#endDateTime").focusout(function(){
		var end = $("#endTime").val();
		if(end == "" || end == null){
			showErrorMessage("#endDateTime", "#error_enddatetime", "You can't leave this empty." );
			return false;
		}
	});
});

/*--------------------------------------------------------------------------------------
Function Name  : checkBoxEmpty
Description    : checks if atleast one question is selected to set the quiz.
Arguments	   : elementId,
				errorId
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function checkBoxEmpty(elementId,errorId){
	var n = $('[name="questionId"]').length
	var q = $('[name="questionId"]')
	var c = 0
	for (i=0;i<n;i++){
		if(q[i].checked){
			c = c+1;
			break;
		}
	}
	if (c == 0) {
		$(errorId).html("You should select atleast one questions before setting a quiz");
		return false;
	}
	else {
		$(errorId).text("");
		return true;
	}
}

/*--------------------------------------------------------------------------------------
Function Name  : validate
Description    : validates all the fields.
Arguments	   : none
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function validate(){
	var name = quizName("#quizName","#error_quizname");
	var start = checkEmpty("#startDateTime","#error_startdatetime");
	var end = checkEmpty("#endDateTime","#error_enddatetime");
	var question = checkBoxEmpty("[name='questionId']","#error_questions");
	if (name && start && end && question)
		return true;
	else
		return false;
}
