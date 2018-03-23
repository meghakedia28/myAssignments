var questionTable;
$(document).ready(function(){
	url = "../?event=faculty.viewQuestionBank";
	var userId = $('#userId').val();
	questionTable = $("#questions").DataTable({
		"saveState": true,
		"search": {
			"smart": false
			},
		"columnDefs": [ {
		      "targets"  : [6],
		      "orderable": false
		    }],
		 "order": [],
		"ajax": {
			url : url,
			data :{
				userId : userId
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
	$(".form-control").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
//	$(".form-control").focusout(function(){
//		validate(this);
//	});
	$('#rowEdit').on('show.bs.modal', function (event) {
		  var questionId = $(event.relatedTarget).data('id');
		  url = "../?event=faculty.populateQuestionInModal";
		 $.ajax({
			url: url,
			data:{
				questionId: questionId,
			},
		  success : function(result){
			  var obj = $.parseJSON(result);
			  $('#question').val(obj.question);
			  $('#optiona').val(obj.optiona);
			  $('#optionb').val(obj.optionb);
			  $('#optionc').val(obj.optionc);
			  $('#optiond').val(obj.optiond);
			  $('#answer').val(obj.answer);
			  $('#update').val(obj.questionId);
				 
		  	}
		  });
		});
	$('#rowDelete').on('show.bs.modal', function (event) {
		 var id = $(event.relatedTarget).data('id');
		 $('#confirm').val(id);
	});
});
function deleteRow(data) {
	event.preventDefault();
	var questionId = $(data).val();
	url = "../?event=faculty.deleteRow";
	$.ajax({
			url : url,
			data : {
				questionId : questionId
			},
			success : function(result) {
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
			}//end of success
	});
}//end of deleteRow
function updateRow(data){
	 event.preventDefault();
	 var questionId = $(data).val();
//	 var question = validate('#question');
//	 var optiona = validate('#optiona');
//	 var optionb = validate('#optionb');
//	 var optionc = validate('#optionc');
//	 var optiond = validate('#optiond');
//	 var answer = validate('#answer');
//	 var checkOptiona = $('#optiona').val();
//	 var checkOptionb = $('#optionb').val();
//	 var checkOptionc = $('#optionc').val();
//	 var checkOptiond = $('#optiond').val();
//	 var unique = false;
//	 if ( checkOptiona != "" && checkOptionb != "" && checkOptionc != "" && checkOptiond != ""){
//			unique = checkUnique(checkOptiona, checkOptionb, checkOptionc, checkOptiond);
//		}
	 if(true) {
		 $.ajax({
				url : "../?event=faculty.editRow&" + $("#editForm").serialize(),
				data : {
					questionId : questionId
				},
				success : function(result) {
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
			});
	 }
	 else{
		return false;
	 }
}