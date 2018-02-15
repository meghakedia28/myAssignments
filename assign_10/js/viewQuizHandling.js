var table;
$(document).ready(function() {
	var userId = $('#userId').val();
	table = $('#quiz').DataTable({
         "ajax": {
 			"url" : "../components/viewQuizListService.cfc?method=getQuizList",
 			"data" :{
 				id : userId
 			}
 				}
		 });
 		var buttons = new $.fn.dataTable.Buttons(table, {
    		buttons: [
    		          {
					    extend: 'csvHtml5',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					   }
					},
					{
						extend: 'pdfHtml5',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					  }
				   }
				]
    		}).container().appendTo($('#buttons'));
});