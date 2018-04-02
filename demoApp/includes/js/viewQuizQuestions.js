/*-------------------------------------------------------------------------------------------------------------
FileName    : viewQuizQuestions.js
Created By  : Megha Kedia
DateCreated : 21-March-2018
Description : display questions related to a perticular
 			  quiz and modification of the questions.

-------------------------------------------------------------------------------------------------------------*/

var questionTable, addQuestionTable;
var quizId = location.search.split('Id=')[1];
$(document).ready(function(){
	var loaderUrl = location.protocol + '//' + location.host + '/demoApp/includes/images/ajax-loader.gif';
	var userId = $('#userId').val();
	questionTable = $('#questions').DataTable({
		"language": {
			"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
		},
		"search": {
		    "smart": false
		},
		"lengthMenu": [5, 10, 25, 50, 75, 100 ],
		"pageLength": 5,
		"columnDefs": [ {
		      "targets"  : [6],
		      "orderable": false,
		      "searchable":false
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
			   },
			   customize: function(doc){
	                return quizName+"\n"+startTime+"\n"+endTime+"\n\n"+ doc;
	           }
			},
			{
				extend: 'pdf',
				title: 'List of quiz questions',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3, 4, 5]
			  },
			  messageTop: quizName+"\n"+startTime+"\n"+endTime
		   }
		]
	}).container().appendTo($('#exportButtons'));
		$('#rowDelete').on('show.bs.modal', function (event) {
			 var id = $(event.relatedTarget).data('id');
			 $('#confirm').val(id);
		});
		$('#selectQuestions').on('show.bs.modal', function (event) {
			$("#quizId").val(quizId);
		});
		addQuestionTable = $('#addQuestions').DataTable({
			"language": {
				"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
			},
			"search": {
			    "smart": false
			},
			"lengthMenu": [5, 10, 25, 50, 75, 100 ],
			"pageLength": 5,
			"columnDefs": [ {
			      "targets"  : [0],
			      "orderable": false,
			      "searchable": false
			    }],
			"order": [],
			"ajax": ({
				"url" : "../?event=faculty.setQuizQuestions",
				"data" :{
					userId : userId,
					quizId : quizId,
					action : "setQuiz"
			}
		})
	});
});

/*--------------------------------------------------------------------------------------------
Function Name  : deleteRow()
Description    : does ajax call for deletion of a question froma perticular quiz.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function deleteRow(data) {
	event.preventDefault();
	var questionId = $(data).val();
	/*deletion is allowed only when the number of questions associated with a quiz is more than one,
		as a quiz should have atleast one question*/
	if  (questionTable.rows().count() > 1){
		$('#error_questions').text("");
		var url = "../?event=faculty.removeQuizQuestion";
		var data = {questionId : questionId, quizId : quizId};
		gobalAjaxHandler(url, data, deleteRowStatus);
	}
	else {
		$('#error_questions').text("Atleast one question is necessary to set a quiz.");
		$('.close').click();
		return false;
	}
}

/*--------------------------------------------------------------------------------------------
Function Name  : deleteRowStatus()
Description    : success call after a question has been remove from a quiz.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function deleteRowStatus(result){
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

/*--------------------------------------------------------------------------------------------
Function Name  : addQuizQuestions()
Description    : ajax call to add quetsions to a quiz.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function addQuizQuestions(){
	var url = "../?event=faculty.updateQuizQuestion";
	gobalAjaxHandler(url, $("form").serializeArray(), addQuizQuestionsStatus);
}

/*--------------------------------------------------------------------------------------------
Function Name  : addQuizQuestionsStatus()
Description    : success call after addition of quetsions to a quiz.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function addQuizQuestionsStatus(result){
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