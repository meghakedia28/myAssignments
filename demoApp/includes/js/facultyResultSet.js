/*-------------------------------------------------------------------------------------------------------------
						FileName    : facultyResultSet.js
						Created By  : Megha Kedia
						DateCreated : 21-March-2018
						Description : view all the students results.

-------------------------------------------------------------------------------------------------------------*/

var resultTable,filter, filtereData;
$(document).ready(function(){
	var userId = $('#userId').val();
	resultTable = $('#result').DataTable({
		"order": [],
        "ajax": {
			"url" : "../?event=faculty.viewResults",
			"data" :{
				userId : userId
					}
				}
		 });
	var buttons = new $.fn.dataTable.Buttons(resultTable, {
		buttons: [
		          {
				    extend: 'csvHtml5',
				    title: 'Results',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3, 4, 5]
				   }
				},
				{
					extend: 'pdfHtml5',
					title: 'Results',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3, 4, 5]
				  }
			   }
			]
		}).container().appendTo($('#buttons'));	
	filter = $('#filterList').DataTable({
		"lengthChange": false,
		"paging": false,
		"ajax": {
			"url" : "../?event=faculty.applyQuizFilter",
			"data" :{
				userId : userId
					}
				}
		 });
	});

/*--------------------------------------------------------------------------------------------
Function Name  : addFilter()
Description    : this the ajax call to set the filter by quiz .
Arguments      : data
Return Type    : none
----------------------------------------------------------------------------------------------*/

	function addFilter(data){
		 var postData = [];
         $.each($("form input[name='quizId']:checked"), function(){            
        	 postData.push($(this).val());
         });
		var userId = $('#userId').val();
		if (postData == ""){
			$.each($("form input[name='quizId']"), function(){            
	        postData.push($(this).val());
			});
		}
		postData = postData.join(","),
		resultTable.destroy();
		resultTable = $('#result').DataTable({
			"order": [],
			"ajax": {
				"url" : "../?event=faculty.viewResults",
				"data" : {
					listOfQuizId : postData,
					userId : userId
					}       
				}
			});
			var buttons = new $.fn.dataTable.Buttons(resultTable, {
				buttons: [
				          {
						    extend: 'csvHtml5',
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
			}