$.noConflict();
var quizTable;
jQuery(document).ready(function($) {
	var userId = $('#userId').val();
	$('#startDateTime').datetimepicker({
		 formatDate:'Y/m/d',
		 minDate:0
	});
	quizTable = $('#quiz').DataTable({
		"columnDefs": [ {
		      "targets"  : [4],
		      "orderable": false
		    }],
		"order": [], 
		"ajax": {
 			"url" : "../?event=faculty.viewQuizList",
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
 		$(".form-control").focus(function(){
 			$(this).css("border","");
 			$(this).next(".error-msg").text("");
 		});
 		$(".form-control").focusout(function(){
 			validate(this);
 		});
 			$(".form-control").focus(function(){
 				$(this).css("border","");
 				$(this).next(".error-msg").text("");
 			});
 			$("#quizName").focusout(function(){
 				var quiz = $("#quizName").val();
 				var quizId = $("#id").val();
 				var validate = wordCheck("#quizName","#error_quizname");
 				if (validate){
 					$.ajax({
 						url : "../?event=faculty.checkTestName",
 						data : {
 							quizName : quiz,
 							quizId : quizId
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
 			
 			$("#startDateTime").focusout(function(){
 				var start = $("#startDateTime").val();
 				var quizId = $("#id").val();
 				if ( start == "" || start == null){
 					$("#error_startDateTime").text("You can't leave this empty.");
 					$("#startDateTime").css("border","2px solid red");
 					return false;
 				}
 				else{
 					$.ajax({
 						url : "../?event=faculty.checkTestTime",
 							data : {
 								startDateTime : start,
 								quizId : quizId
 							},
 							success: function(result) {
 								var obj = $.parseJSON(result);
 								if (obj.STATUS == "success"){
 									return true;
 								}
 									else {
 										$("#error_startDateTime").html(obj.MESSAGE);
 										return false;
 									}
 							}	
 						});	
 					}
 				});
 			$("#endDateTime").focusout(function(){
 				var end = $("#endDateTime").val();
 				if(end == "" || end == null){
 					$("#error_endDateTime").text("You can't leave this empty.");
 					$("#endDateTime").css("border","2px solid red");
 					return false;
 				}
 			});
 		$('#rowEdit').on('show.bs.modal', function (event) {
 			  $('.error-msg').text("");
 			  $("input,select").css("border","");
 			  var quizId = $(event.relatedTarget).data('id');
 			  var userId = $('#userId').val();
 			 $.ajax({
 				url: "../?event=faculty.populateModel",
 				data:{
 					quizId: quizId
 				},
 			  success : function(result){
 				  var obj = $.parseJSON(result);
 				  $('#quizName').val(obj.quizName);
 				  $('#startDateTime').val(obj.startDateTime);
 				  $('#endDateTime').val(obj.endDateTime);
 				  $('#id').val(obj.quizId);
				  $('#update').val(obj.quizId);
 			  	}
 			  });
 			});
 		$('#rowDelete').on('show.bs.modal', function (event) {
 			 var button = $(event.relatedTarget);; 
 			 var quizId = button.data('id');
 			 $('#confirm').val(quizId);
 			});
 		});
 	function deleteRow(data) {
 		event.preventDefault();
 		var quizId = $(data).val();
 		var userId = $('#userId').val();
 		$.ajax({
 				url : "../?event=faculty.removeQuiz",
 				data : {
 					quizId : quizId
 				},
 				success : function(result) {
 					if (result){
 						$('.close').click(); 
 						jQuery.confirm({
		                        title: 'Success',
		                        content: 'The quiz has been deleted.',
		                        buttons: {
		                            Ok : function () {
		                            	$(".error-msg").text("");
		        						quizTable.ajax.reload();
		        						return true;
		                            }
		                        }
							});
 					}
					else {
						$.alert({
                            title: 'Error!',
                            content: 'Quiz has not been deleted, please try again later.'
                        });
						return false;
					}
 				}
 			});
 	}
 	function updateRow(data){
 		event.preventDefault();
 		 var quizName = validate('#quizName','#error_quizname');
 		 var startDateTime = validate('#startDateTime','error_startDateTime');
 		 var endDateTime = validate('#endDateTime','#error_endDateTime');
 		 var quizId = $(data).val();
 		 var userId = $('#userId').val();
 		 if(quizName && startDateTime && endDateTime) {
 			$.ajax({
 					url : "../?event=faculty.updateRow&" + $("#editForm").serialize(),
 					data : {
 						quizId : quizId
 					},
 					success : function(result) {
 						var obj = $.parseJSON(result);
 						if (obj.SUCCESSFULL != null && obj.SUCCESSFULL){
 							$('.close').click(); 
 							jQuery.confirm({
 		                        title: 'Success',
 		                        content: 'The quiz has been updated.',
 		                        buttons: {
 		                            Ok : function () {
 		                            	$(".error-msg").text("");
 		        						quizTable.ajax.reload();
 		        						return true;
 		                            }
 		                        }
 							});
 						}
 						else if (obj.SUCCESSFULL != null && obj.SUCCESSFULL == false){
 							jQuery.alert({
 	                            title: 'Error',
 	                            content: 'Quiz has not been updated, please try again later.'
 	                        });
 							return false;
 						}
 						if (obj.ERRORID != null){
							for (keys in obj.ERRORID){
								var id = '#'+(keys.toLowerCase());
								$(id).html(obj.ERRORID[keys]);
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
 		var start = checkEmpty("#startDateTime","#error_startDateTime");
 		var end = checkEmpty("#endDateTime","#error_endDateTime");
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