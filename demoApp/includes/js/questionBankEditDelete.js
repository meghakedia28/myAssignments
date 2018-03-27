/*----------------------------------------------------------------------------------------------------------
						FileName    : questionBankEditDelete.cfc
						Created By  : Megha Kedia
						DateCreated : 13-March-2018
						Description : get services related to questions.

------------------------------------------------------------------------------------------------------------*/

var questionTable;
$(document).ready(function(){
	url = "../?event=faculty.viewQuestionBank";
	var userId = $('#userId').val();
	questionTable = $("#questions").DataTable({
		"columnDefs": [ {
		      "targets"  : [6],
		      "orderable": false,
		      "searchable": false
		    }],
		"order": [],
		"ajax": {
			url : url,
			data :{
				userId : userId,
				action : "modify"
			}
		}
	});
	var buttons = new $.fn.dataTable.Buttons(questionTable, {
	buttons: [
	          {
			    extend: 'csv',
			    title: 'List of questions',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3, 4, 5]
			   }
			},
			{
				extend: 'pdfHtml5',
				title: 'List of questions',
				exportOptions: {
			    columns: [ 0, 1, 2, 3, 4, 5]
			  }
			}
		]
	}).container().appendTo($('#buttons'));
	$(".form-control").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$(".form-control").focusout(function(){
		validate(this);
	});
	$('#rowEdit').on('show.bs.modal', function (event) {
		  var questionId = $(event.relatedTarget).data('id');
		  var data = {questionId: questionId};
		  url = "../?event=faculty.populateQuestionInModal";
		  gobalAjaxHandler(url, data, populateData);
		});
	$('#rowDelete').on('show.bs.modal', function (event) {
		 var id = $(event.relatedTarget).data('id');
		 $('#confirm').val(id);
	});
});

/*--------------------------------------------------------------------------------------
Function Name  : populateData
Description    : success call after fetching data by ajax call,
				to populate question in a model
Arguments	   : data
Return Type	   : none
------------------------------------------------------------------------------------------*/

function populateData(result){
	  var obj = $.parseJSON(result);
	  $('#question').val(obj.question);
	  $('#optiona').val(obj.optiona);
	  $('#optionb').val(obj.optionb);
	  $('#optionc').val(obj.optionc);
	  $('#optiond').val(obj.optiond);
	  $('#answer').val(obj.answer);
	  $('#update').val(obj.questionId);
	  $('#questionId').val(obj.questionId);
}

/*--------------------------------------------------------------------------------------
Function Name  : deleteRow
Description    : calls ajax to delete a row
Arguments	   : data
Return Type	   : none
------------------------------------------------------------------------------------------*/

function deleteRow(data) {
	event.preventDefault();
	var questionId = $(data).val();
	var data = {questionId: questionId};
	var url = "../?event=faculty.deleteRow";
	gobalAjaxHandler(url, data, deleteStatus);
}//end of deleteRow

/*--------------------------------------------------------------------------------------
Function Name  : deleteStatus
Description    : ajax success calls to delete a row
Arguments	   : result
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function deleteStatus(result){
	if (result){
		$('.close').click(); 
		$.confirm({
	        title: 'Success',
	        content: 'The question has been deleted.',
	        buttons: {
	            Ok : function () {
	            	$(".error-msg").text("");
					questionTable.ajax.reload();
					return true;
	            }
	        }//end of button
		});//end of confirm model
	}//end of if
	else {
		$.alert({
		    title: 'Alert!',
		    content: 'Data has not be deleted, please try agin later.',
		});
		return false;
	}//end of else
}

/*--------------------------------------------------------------------------------------
Function Name  : updateRow
Description    : does validation before using ajax to update the questions
Arguments	   : data
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function updateRow(data){
	 event.preventDefault();
	 var checkQuestion = validate('#question', '#error_question');
	 var checkOptiona = validate('#optiona', '#error_optiona');
	 var checkOptionb = validate('#optionb', '#error_optionb');
	 var checkOptionc = validate('#optionc', '#error_optionc');
	 var checkOptiond = validate('#optiond', '#error_optiond');
	 var checkAnswer = validate('#answer', '#error_answer');
	 var optiona = $('#optiona').val();
	 var optionb = $('#optionb').val();
	 var optionc = $('#optionc').val();
	 var optiond = $('#optiond').val();
	 var unique = false;
	 if ( optiona != "" && optionb != "" && optionc != "" && optiond != ""){
			unique = checkUnique(optiona, optionb, optionc, optiond);
	}
	 if(checkQuestion && checkOptiona && checkOptionc && checkOptiond && checkOptionb && checkAnswer && unique){
		url = "../?event=faculty.editRow";
		gobalAjaxHandler(url, $("#editForm").serializeArray(), updateStatus);
	 }
	 else{
		return false;
	 }
}

/*--------------------------------------------------------------------------------------
Function Name  : updateStatus
Description    : ajax success call for updating row data
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function updateStatus (result){
	var obj = $.parseJSON(result);
	if (obj.ERRORID.update == 'successfull'){
		$('.close').click(); 
		$.confirm({
            title: 'Success',
            content: 'The question has been updated successfully.',
            buttons: {
                Ok : function () {
                	$(".error-msg").text("");
					questionTable.ajax.reload();
					return true;
                }
            }
		});
	}
	else if (obj.ERRORID.update == 'fail'){
		$.confirm({
            title: 'Error',
            content: 'Some unexpected error has occured. Please try again later.'
		});
	}
	else{
		for (keys in obj.ERRORID){
			var id = '#'+(keys.toLowerCase());
			$(id).text(obj.ERRORID[keys]);
		}
	}
}