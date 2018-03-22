var questionTable, addQuestionTable;
var quizId = location.search.split('Id=')[1];
$(document).ready(function(){
	var userId = $('#userId').val();
	questionTable = $('#questions').DataTable({
		"lengthMenu": [5, 10, 25, 50, 75, 100 ],
		"pageLength": 5,
		"columnDefs": [ {
		      "targets"  : [6],
		      "orderable": false
		    }],
		"order": [],
		"ajax": ({
			"url": "../?event=faculty.getQuizQuestionList",
			"data":{
				quizId: quizId
			}
		})
	});
	var buttons = new $.fn.dataTable.Buttons(questionTable, {
	buttons: [
	          {
			    extend: 'csvHtml5',
			    title: 'List of quiz questions',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3, 4, 5]
			   }
			},
			{
				extend: 'pdfHtml5',
				title: 'List of quiz questions',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3, 4, 5]
			  }
		   }
		]
	}).container().appendTo($('#buttons'));
		$('#rowDelete').on('show.bs.modal', function (event) {
			 var button = $(event.relatedTarget) 
			 var id = button.data('id') 
			 $('#confirm').val(id);
			});
		addQuestionTable = $('#addQuestions').DataTable({
			"lengthMenu": [5, 10, 25, 50, 75, 100 ],
			"pageLength": 5,
			"columnDefs": [ {
			      "targets"  : [0],
			      "orderable": false
			    }],
			"order": [],
			"ajax": ({
				"url" : "../?event=faculty.setQuizQuestions",
				"data" :{
					userId : userId,
					quizId : quizId
				}
			})
		});
	});
function deleteRow(data) {
	event.preventDefault();
	var questionId = $(data).val();
	if  (questionTable.rows().count() > 1){
		$('#error_questions').text("");
		$.ajax({
				url : "../?event=faculty.removeQuizQuestion",
				data : {
					questionId : questionId,
					quizId : quizId
				},
				success : function(result) {
					if (result){
						$('.close').click(); 
						questionTable.ajax.reload();
						addQuestionTable.ajax.reload();
						return true;
					}
					else {
						$.alert({
                            title: 'Error',
                            content: 'data has not be deleted, please try agin later.',
                            buttons: {
                                Ok : function () {
                                	return false;
            					}	
                            }
                        });
					}
				}
			});
		}
	else {
		$('#error_questions').text("Atleast one question is necessary to set a quiz.");
		$('.close').click();
		return false;
	}
}
function add(){
	$.ajax({
		url : "../?event=faculty.updateQuizQuestion&"+$("form").serialize(),
		data : {
			quizId : quizId
		},
		success : function(result) {
			if (result){
				$('.close').click();
				$('#error_questions').text("");
				questionTable.ajax.reload();
				addQuestionTable.ajax.reload();
				return true;
			}
			else {
				$.alert({
                    title: 'Alert!',
                    content: 'An unexpected error has occured, please try agin later.',
                    buttons: {
                        Ok : function () {
                        	return false;
    					}	
                    }
                });
			}
		}
	});
}