$.noConflict();
var reportTable;
var scoreId = location.search.split('Id=')[1];
jQuery(document).ready(function($) {
	reportTable = $('#studentsReportTable').DataTable({
         "ajax": {
 			"url" : "../components/facultyResultSet.cfc?method=generateReport",
 			"data" :{
 				scoreId : scoreId
 					}
 				}
		 });
 		var buttons = new $.fn.dataTable.Buttons(reportTable, {
    		buttons: [
    		          {
					    extend: 'csvHtml5',
					    title: 'Student report',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					   }
					},
					{
						extend: 'pdfHtml5',
						title: 'Student report',
					    exportOptions: {
					    columns: [ 0, 1, 2]
					  }
				   }
				]
    		}).container().appendTo($('#buttons'));	
});