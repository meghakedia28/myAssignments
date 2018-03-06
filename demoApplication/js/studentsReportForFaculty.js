$.noConflict();
jQuery(document).ready(function($) {
	var scoreId = location.search.split('Id=')[1];
	var reportTable = $('#studentsReportTable').DataTable({
		"order": [], 
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