/*----------------------------------------------------------------------------------------------------------
FileName    : listOfQuiz.js
Created By  : Megha Kedia
DateCreated : 15-March-2018
Description : does ajax call to display quiz list in datatable.

------------------------------------------------------------------------------------------------------------*/

$.noConflict();
var quizTable;
jQuery(document).ready(function($) {
	var loaderUrl = location.protocol + '//' + location.host + '/demoApp/includes/images/ajax-loader.gif'; 
	var userId = $('#userId').val();
	var newDate = new Date();
	$('#startDateTime').datetimepicker({
		formatDate : 'Y/m/d',
		formateTime :'hh:ii',
		minDateTime: new Date(newDate.getTime())
	});
	quizTable = $('#quiz').DataTable({
		"language": {
			"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
		},
		"search": {
		    "smart": false
		},
		"columnDefs": [ {
		      "targets"  : [4,3],
		      "orderable": false,
		      "searchable": false
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
    		}).container().appendTo($('#exportButtons'));	
 		$(".form-control").focus(function(){
 			$(this).css("border","");
 			$(this).next(".error-msg").text("");
 		});
 		$(".form-control").focusout(function(){
 			validate(this);
 		});
		$("#quizName").focusout(function(){
			var quiz = $("#quizName").val();
			var quizId = $("#quizId").val();
			var validate = quizName("#quizName","#error_quizname");
			var url = "../?event=faculty.checkTestName";
			var data = {quizName : quiz, quizId : quizId };
			if (validate){
				gobalAjaxHandler(url, data, quizNameStatus);
			}
		});
		$("#startDateTime").focusout(function(){
			var start = $("#startDateTime").val();
			var quizId = $("#quizId").val();
			if ( start == "" || start == null){
				showErrorMessage("#startDateTime", "#error_startdatetime", "You can't leave this empty.");
				return false;
			}
			else{
				var url = "../?event=faculty.checkTestTime";
				var data = {startDateTime : start, quizId : quizId };
				gobalAjaxHandler(url, data, startDateTimeStatus);
				
			}
		});
		$("#endDateTime").focusout(function(){
			var end = $("#endDateTime").val();
			if(end == "" || end == null){
				showErrorMessage("#endDateTime", "#error_enddatetime", "You can't leave this empty.");
				return false;
			}
		});
 		$("#rowEdit").on('show.bs.modal', function (event) {
 			  $('.error-msg').text("");
 			  $("input,select").css("border","");
 			  var quizId = $(event.relatedTarget).data('id');
 			  var userId = $('#userId').val();
 			  var url = "../?event=faculty.populateQuizModel";
 			  var data = {quizId: quizId};
 			  gobalAjaxHandler(url, data, populateData);
		  });
 		$('#rowDelete').on('show.bs.modal', function (event) {
 			 var button = $(event.relatedTarget);; 
 			 var quizId = button.data('id');
 			 $('#confirm').val(quizId);
		});
	});

/*--------------------------------------------------------------------------------------
Function Name  : populateData
Description    : populates the quiz information in model.
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

	function populateData(result){
		 var obj = $.parseJSON(result);
		 $('#quizName').val(obj.quizName);
		 $('#startDateTime').val(obj.startDateTime);
		 $('#endDateTime').val(obj.endDateTime);
		 $('#quizId').val(obj.quizId);
		 $('#update').val(obj.quizId);
	}

/*--------------------------------------------------------------------------------------
Function Name  : deleteRow
Description    : call ajax to delete a quiz.
Arguments	   : data
Return Type	   : none
------------------------------------------------------------------------------------------*/

 	function deleteRow(data) {
 		event.preventDefault();
 		var quizId = $(data).val();
 		var userId = $('#userId').val();
 		var url = "../?event=faculty.removeQuiz"
 		var data = {quizId : quizId};
 		gobalAjaxHandler(url, data, deleteRowStatus);
 	}

/*--------------------------------------------------------------------------------------
Function Name  : deleteRowStatus
Description    : success function called after deleting a quiz.
Arguments	   : result
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

 	function deleteRowStatus(result){
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
 	
/*--------------------------------------------------------------------------------------
Function Name  : updateRow
Description    : call ajax to update a quiz information.
Arguments	   : data
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

 	function updateRow(data){
 		event.preventDefault();
 		 var valid = validate();
 		 var quizId = $(data).val();
 		 var userId = $('#userId').val();
 		 var url = "../?event=faculty.updateQuiz";
 		 if(validate) {
 			gobalAjaxHandler(url, $("#editForm").serializeArray(), updateRowStatus);
 		 }
 		 else{
 			return false;
 		 }
 	}
 	
/*--------------------------------------------------------------------------------------
Function Name  : updateRowStatus
Description    : success function called when the update for ajax is a success.
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

 	function updateRowStatus(result){
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
 	
/*--------------------------------------------------------------------------------------
Function Name  : validate
Description    : validates all the functions.
Arguments	   : none
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

 	function validate(){
 		var name = quizName("#quizName","#error_quizname");
 		var start = checkEmpty("#startDateTime","#error_startdatetime");
 		var end = checkEmpty("#endDateTime","#error_enddatetime");
 		if (name && start && end )
 			return true;
 		else
 			return false;
 	}