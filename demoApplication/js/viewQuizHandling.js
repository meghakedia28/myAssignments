$.noConflict();
var quizTable;
jQuery(document).ready(function($) {
	var userId = $('#userId').val();
	$('#startTime').datetimepicker({
		 formatDate:'Y/m/d',
		 minDate:0
	});
	quizTable = $('#quiz').DataTable({
         "ajax": {
 			"url" : "../components/viewQuizListService.cfc?method=formatQuizList",
 			"data" :{
 				userId : userId
 					}
 				}
		 });
 		var buttons = new $.fn.dataTable.Buttons(quizTable, {
    		buttons: [
    		          {
					    extend: 'csvHtml5',
					    title: 'List of quiz',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					   }
					},
					{
						extend: 'pdfHtml5',
						title: 'List of quiz',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					  }
				   }
				]
    		}).container().appendTo($('#buttons'));	
 		$("input,select").focus(function(){
 			$(this).css("border","");
 			$(this).next(".error-msg").text("");
 		});
 		$("input,select").focusout(function(){
 			validate(this);
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
 									$("#error_quizname").html(obj.MESSAGE);
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
 										$("#error_starttime").html(obj.MESSAGE);
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
 		$('#rowEdit').on('show.bs.modal', function (event) {
 			  $('.error-msg').text("");
 			  var button = $(event.relatedTarget) 
 			  var quizId = button.data('id') 
 			  var userId = $('#userId').val();
 			 $.ajax({
 				url: "../components/getQuizDetails.cfc?method=quizDetails",
 				data:{
 					quizId: quizId,
 					userId: userId
 				},
 			  success : function(result){
 				  var obj = $.parseJSON(result);
 				  $('#quizName').val(obj.quizName);
 				  $('#startTime').val(obj.startTime);
 				  $('#endTime').val(obj.endTime);
 				  $('#update').val(obj.quizId);
 			  	}
 			  });
 			});
 		$('#rowDelete').on('show.bs.modal', function (event) {
 			 var button = $(event.relatedTarget) 
 			 var quizId = button.data('id') 
 			 $('#confirm').val(quizId);
 			});
 		});
 	function deleteRow(data) {
 		event.preventDefault();
 		var quizId = $(data).val();
 		var userId = $('#userId').val();
 		$.ajax({
 				url : "../components/enterQuiz.cfc?method=deleteQuiz",
 				data : {
 					quizId : quizId,
 					userId : userId
 				},
 				success : function(result) {
 					if (result){
 						$('.close').click(); 
 						quizTable.ajax.reload();
 						return true;
 					}
					else {
						$.alert({
                            title: 'Alert!',
                            content: 'quiz has not been deleted, please try agin later.'
                        });
						return false;
					}
 				}
 			});
 	}
 	function updateRow(data){
 		event.preventDefault();
 		var quizId = $(data).val();
 		 var quizName = validate('#quizName','#error_quizname');
 		 var startTime = validate('#startTime','error_starttime');
 		 var endTime = validate('#endTime','#error_endtime');
 		 var userId = $('#userId').val();
 		 if(quizName && startTime && endTime) {
 			$.ajax({
 					url : "../components/enterQuiz.cfc?method=updateQuiz&" + $("#editForm").serialize(),
 					data : {
 						quizId : quizId,
 						userId : userId
 					},
 					success : function(result) {
 						var obj = $.parseJSON(result);
 						if (obj.SUCCESSFULL != null && obj.SUCCESSFULL == true){
 							$('.close').click(); 
 							quizTable.ajax.reload();
 							$(".error-msg").text("");
 							return true;
 						}
 						if (obj.ERRORID != null){
							for (keys in obj.ERRORID){
								var id = '#'+(keys.toLowerCase());
								$(id).text(obj.ERRORID[keys]);
							}
						}
 					}
 				});
 		 }
 		 else{
 			return false;
 		 }
 	}
 	function validate(){
 		var name = wordCheck("#quizName","#error_quizname");
 		var start = checkEmpty("#startTime","#error_starttime");
 		var end = checkEmpty("#endTime","#error_endtime");
 		if (name && start && end )
 		return true;
 		else
 		return false;
 			}
 	function wordCheck(elementId,errorId){
 		var word = $(elementId).val();
 		var regword = /^[a-zA-Z0-9 ]{1,30}$/;
 		if ( word == "" || word == null){
 			$(errorId).text("You can't leave this empty.");
 			$(elementId).css("border","2px solid red");
 			return false;
 		}
 		else if (!(regword.test(word))){
 			$(errorId).html("<p>Please enter your valid quiz name:<br/> use (a-z) OR (A-Z) OR (0-9) <br/>between 1 and 30 characters.</p>");
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