jQuery(document).ready(function($){
	var id = $('#userId').val();
	var table = $("#questions").DataTable({
		"ajax": {
			url : "../components/getQuestionsService.cfc?method=formatQuizQuestion",
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
				url : "../components/enterQuiz.cfc?method=insertQuizDetailsController&"+$("#quizForm").serialize(),
				data : {},
					success : function(result){
						var obj = $.parseJSON(result);
						if (obj.SUCCESSFULL != null){						
							if(obj.SUCCESSFULL){
								$.confirm({
	                                title: 'Success!',
	                                content: obj.MESSAGE,
	                                buttons: {
	                                    Ok : function () {
	                                    		$("#quizForm").trigger('reset');
	            								$(".error-msg").text("");
	            							}
	                                    }
									});	
							}
							else {
								$.confirm({
		                            title: 'Error!',
		                            content: obj.MESSAGE
								});
							}
						}
						if (obj.ERRORID != null){
							for (keys in obj.ERRORID){
								var id = '#'+(keys.toLowerCase());
								$(id).html(obj.ERRORID[keys]);
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
					else if (obj.STATUS == "fail"){
						$.confirm({
                            title: 'Error!',
                            content: obj.MESSAGE
						});
						return false;
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
						else if (obj.STATUS == "fail"){
							$.confirm({
	                            title: 'Error!',
	                            content: obj.MESSAGE
							});
							return false;
						}
						else {
							$("#error_starttime").html(obj.MESSAGE);
							$("#startTime").css("border","2px solid red");
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