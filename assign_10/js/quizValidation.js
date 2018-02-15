$.noConflict();
jQuery(document).ready(function($){
	var id = $('#userId').val();
	var table = $("#questions").DataTable({
		"ajax": {
			url : "../components/getQuestionsService.cfc?method=getQuestions",
			data :{
				userId : id
			}
		}
	});
	$('#startTime').datetimepicker({
		 formatDate:'Y/m/d',
		minDate:0
	});
	$("#quizForm").submit(function(event){	
	var valid = validate();
		event.preventDefault();
		if (valid) {
			$.ajax({
				url : "../components/enterQuiz.cfc?method=validateAllFields&"+$("#quizForm").serialize(),
				data : {},
					success : function(result){
						var obj = $.parseJSON(result);
						if (obj.SUCCESSFULL != null){						
							alert (obj.MESSAGE);
							if(obj.SUCCESSFULL == true){
								$("#quizForm").trigger('reset');
								$(".error-msg").text("");
							}
						}
						if (obj.ERRORID != null){
							for (keys in obj.ERRORID){
								var id = '#'+(keys.toLowerCase());
								$(id).text(obj.ERRORID[keys]);
							}
						}
					}
				}) ;
			}
		});
	$("input,select").focus(function(){
		$(this).css("border","");
		$(this).next(".error-msg").text("");
	});
	$("#quizName").focusout(function(){
		var quiz = $("#quizName").val();
		var validate = wordCheck("#quizName","#error_quizname");
		if (validate){
			$.ajax({
				url : "../components/enterQuiz.cfc?method=checkQuizName",
				data : {
					name : quiz
				},
				success : function(result) {
					var obj = $.parseJSON(result);
					if (obj.STATUS == "success"){
						return true;
					}
						else {
							$("#error_quizname").text(obj.MESSAGE);
							return false;
						}
				}
			});
		}
	});
	
	$("#startTime").focusout(function(){
		var start = $("#startTime").val();
		if ( start == "" || start == null){
			$("#error_starttime").text("You can't leave this empty.");
			$("#startTime").css("border","2px solid red");
			return false;
		}
		else{
			$.ajax({
				url : "../components/enterQuiz.cfc?method=checkStartTime",
					data : {
						startDate : start
					},
					success: function(result) {
						var obj = $.parseJSON(result);
						if (obj.STATUS == "success"){
							return true;
						}
							else {
								$("#error_starttime").text(obj.MESSAGE);
								return false;
							}
					}	
				});	
			}
		});
	$("#endTime").focusout(function(){
		var end = $("#endTime").val();
		if(end == "" || end == null){
			$("#error_endtime").text("You can't leave this empty.");
			$("#endTime").css("border","2px solid red");
			return false;
		}
	});
});
function wordCheck(elementId,errorId){
	var word = $(elementId).val();
	var regword = /^[a-zA-Z0-9 ]{1,30}$/;
	if ( word == "" || word == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else if (!(regword.test(word))){
		$(errorId).text("Please enter your valid quiz name: use (a-z) OR (A-Z) OR (0-9) \nbetween 1 and 30 characters.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function checkEmpty(elementId,errorId){
	var start = $(elementId).val();
	if(start == "" || start == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}	
	else
		return true;
}
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
		$(errorId).text("You should select atleast some questions before setting a quiz");
		return false;
	}
	else {
		$(errorId).text("");
		return true;
	}
}
function validate(){
	var name = wordCheck("#quizName","#error_quizname");
	var start = checkEmpty("#startTime","#error_starttime");
	var end = checkEmpty("#endTime","#error_endtime");
	var question = checkBoxEmpty("[name='questionId']","#error_questions");
	if (name && start && end && question)
	return true;
	else
	return false;
		}
