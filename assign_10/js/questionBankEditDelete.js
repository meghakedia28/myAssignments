var table;
var buttons;
$(document).ready(function(){
	var userId = $('#userId').val();
	table = $("#questions").DataTable({
		"ajax": {
			url : "../components/getQuestionsService.cfc?method=viewQuestionBank",
			data :{
				userId : userId
			}
		}
	});
	 var buttons = new $.fn.dataTable.Buttons(table, {
 		buttons: [
 		          {
				    extend: 'csv',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3, 4, 5]
				   }
				},
				{
					extend: 'pdfHtml5',
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
		  var button = $(event.relatedTarget) 
		  var questionId = button.data('id') 
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
		 var button = $(event.relatedTarget) 
		 var id = button.data('id') 
		 $('#confirm').val(id);
		});
	});
function deleteRow(data) {
	event.preventDefault();
	var QustnId = $(data).val();
	$.ajax({
			url : "../components/editDeleteQuestionsService.cfc?method=deleteRecord",
			data : {
				questionId : QustnId
			},
			success : function(result) {
				if (result){
					$('.close').click(); 
					table.ajax.reload();
					return true;
				}
					else {
						alert('data has not be deleted, please try agin later.');
						return false;
					}
			}
		});
}
function updateRow(data){
	event.preventDefault();
	var QustnId = $(data).val();
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
	 if(question && optiona && optionb && optionc && optiond && answer) {
		$.ajax({
				url : "../components/editDeleteQuestionsService.cfc?method=updateQuestion&" + $("#editForm").serialize(),
				data : {
					questionId : QustnId
				},
				success : function(result) {
					var obj = $.parseJSON(result);
					if (obj.ERRORID.update = 'successfull'){
						$('.close').click(); 
						table.ajax.reload();
						$(".error-msg").text("");
						return true;
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