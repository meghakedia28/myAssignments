var resultTable,filter, filtereData;
$(document).ready(function(){
	var userId = $('#userId').val();
	resultTable = $('#result').DataTable({
        "ajax": {
			"url" : "../components/facultyResultSet.cfc?method=getResultSet",
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
			"url" : "../components/facultyResultSet.cfc?method=getListOfQuiz",
			"data" :{
				userId : userId
					}
				}
		 });
	});
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
			"ajax": {
				"url" : "../components/facultyResultSet.cfc?method=filterOnQuiz",
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
						    columns: [ 0, 1, 2, 3, 4, 5, 6]
						   }
						},
						{
							extend: 'pdfHtml5',
						    exportOptions: {
						    columns: [ 0, 1, 2, 3, 4, 5, 6]
						  }
					   }
					]
				}).container().appendTo($('#buttons'));	
			}
	