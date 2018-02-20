var questionTable, addQuestionTable, quizId;
$(document).ready(function(){
	quizId = location.search.split('Id=')[1];
	var userId = $('#userId').val();
	questionTable = $('#questions').DataTable({
		"lengthMenu": [5, 10, 25, 50, 75, 100 ],
		"pageLength": 5,
		"ajax": ({
			"url" : "../components/viewQuizListService.cfc?method=getQuizQuestionList",
			"data" :{
				quizId: quizId,
				userId: userId
			}
		})
	});
	var buttons = new $.fn.dataTable.Buttons(questionTable, {
		buttons: [
		          {
				    extend: 'csvHtml5',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3, 4]
				   }
				},
				{
					extend: 'pdfHtml5',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3, 4]
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
			"ajax": ({
				"url" : "../components/getQuestionsService.cfc?method=setQuizQuestion",
				"data" :{
					userId: userId,
					quizId:quizId
				}
			})
		});
	});
function deleteRow(data) {
	event.preventDefault();
	var QustnId = $(data).val();
	var quizId = location.search.split('Id=')[1];
	if  (questionTable.rows().count() > 1){
		$('#error_questions').text("");
		$.ajax({
				url : "../components/editDeleteQuestionsService.cfc?method=deleteQuizQuestion",
				data : {
					questionId : QustnId,
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
							alert('data has not be deleted, please try agin later.');
							return false;
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
		url : "../components/enterQuiz.cfc?method=updateQuizQuestionTable&"+$("form").serialize(),
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
					alert('questions ahs not been added, please try agin later.');
					return false;
				}
		}
	});
}