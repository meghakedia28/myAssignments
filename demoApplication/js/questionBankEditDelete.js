var questionTable;
$(document).ready(function(){
	var userId = $('#userId').val();
	questionTable = $("#questions").DataTable({
		"columnDefs": [ {
		      "targets"  : [6],
		      "orderable": false
		    }],
		 "order": [0, "desc"],
		"ajax": {
			url : "../components/getQuestionsService.cfc?method=viewQuestionBank",
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
	$("input,select,textarea").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("input,select,textarea").focusout(function(){
		validate(this);
	});
	$('#rowEdit').on('show.bs.modal', function (event) {
		  var questionId = $(event.relatedTarget).data('id');
		  var userId = $('#userId').val();
		 $.ajax({
			url: "../components/getQuestionsService.cfc?method=getQuestionDetails",
			data:{
				questionId: questionId,
				userId: userId
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
	var qustnId = $(data).val();
	$.ajax({
			url : "../components/editDeleteQuestionsService.cfc?method=deleteRecord",
			data : {
				questionId : qustnId
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
                        }
					});
				}
				else {
					$.alert({
					    title: 'Alert!',
					    content: 'Data has not be deleted, please try agin later.',
					});
					return false;
				}
			}
	});
}
function updateRow(data){
	 event.preventDefault();
	 var questionId = $(data).val();
	 var question = validate('#question');
	 var optiona = validate('#optiona');
	 var optionb = validate('#optionb');
	 var optionc = validate('#optionc');
	 var optiond = validate('#optiond');
	 var answer = validate('#answer');
	 var checkOptiona = $('#optiona').val();
	 var checkOptionb = $('#optionb').val();
	 var checkOptionc = $('#optionc').val();
	 var checkOptiond = $('#optiond').val();
	 var unique = false;
	 if ( checkOptiona != "" && checkOptionb != "" && checkOptionc != "" && checkOptiond != ""){
			unique = checkUnique(checkOptiona, checkOptionb, checkOptionc, checkOptiond);
		}
	 if(question && optiona && optionb && optionc && optiond && answer && unique) {
		$.ajax({
				url : "../components/editDeleteQuestionsService.cfc?method=updateQuestion&" + $("#editForm").serialize(),
				data : {
					questionId : questionId
				},
				success : function(result) {
					var obj = $.parseJSON(result);
					if (obj.ERRORID.update = 'successfull'){
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
					else if (obj.ERRORID.update = 'fail'){
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