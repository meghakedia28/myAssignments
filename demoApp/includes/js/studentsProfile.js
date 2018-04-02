/*-------------------------------------------------------------------------------------------------------------
FileName    : studentsProfile.js
Created By  : Megha Kedia
DateCreated : 126-March-2018
Description : displays all the studennts 
			  details with the associated scores for all tests.

-------------------------------------------------------------------------------------------------------------*/
var loaderUrl = location.protocol + '//' + location.host + '/demoApp/includes/images/ajax-loader.gif';
$(document).ready(function() {
var resultTable;
	var allResultTable = $('#allResult').DataTable({
		"language": {
			"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
		},	
		"search": {
		    "smart": false
		},
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
					    title: 'Students profile',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					   }
					},
					{
						extend: 'pdfHtml5',
						title: 'Students profile',
						exportOptions: {
					    columns: [ 0, 1, 2]
					  }
					}
				]
			}).container().appendTo($('#exportButtons'));
		$("#viewScore").on("show.bs.modal", function (event) {
			  var studentsId = $(event.relatedTarget).data('id');
			  var userId = $("#userId").val();
			  resultTable = $("#resultScore").DataTable({
				  "language": {
						"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
					},
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