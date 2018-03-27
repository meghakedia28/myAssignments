/*-------------------------------------------------------------------------------------------------------------
						FileName    : studentsProfile.js
						Created By  : Megha Kedia
						DateCreated : 126-March-2018
						Description : displays all the studennts 
										details with the associated scores for all tests.

-------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
var resultTable;
	var allResultTable = $('#allResult').DataTable({
			"columnDefs": [ {
		      "targets"  : [3],
		      "orderable": false
		    }],
		    "ajax": {
		    	url : "../?event=faculty.viewStudents",
		    	data:{}
		    }
		});
		var buttons = new $.fn.dataTable.Buttons(allResultTable, {
			buttons: [
			          {
					    extend: 'csv',
					    title: 'Results',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					   }
					},
					{
						extend: 'pdfHtml5',
						title: 'Results',
						exportOptions: {
					    columns: [ 0, 1, 2]
					  }
					}
				]
			}).container().appendTo($('#buttons'));
		
		$("#viewScore").on("show.bs.modal", function (event) {
			  var studentsId = $(event.relatedTarget).data('id');
			  var userId = $("#userId").val();
			  resultTable = $("#resultScore").DataTable({
					"columnDefs": [ {
				      "targets"  : [3],
				      "orderable": false
				    }],
				    "ajax": {
				    	url : "../?event=faculty.individualResultSet",
				    	data:{
				    		studentsId: studentsId,
				    		userId: userId
			    	}
			    }
			});
		});
		
		$('#viewScore').on('hide.bs.modal', function (event) {
			resultTable.destroy();
		});
});