/*-------------------------------------------------------------------------------------------------------------
FileName    : studentsReportForFaculty.js
Created By  : Megha Kedia
DateCreated : 25-March-2018
Description : display the generated report which shows questions, 
			  correct answer, user answer.

-------------------------------------------------------------------------------------------------------------*/

$.noConflict();
var loaderUrl = location.protocol + '//' + location.host + '/demoApp/includes/images/ajax-loader.gif';
jQuery(document).ready(function($) {
	var scoreId = location.search.split('Id=')[1];
	var reportTable = $('#studentsReportTable').DataTable({
		"language": {
			"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
		},
		"search": {
		    "smart": false
		},
		"order": [], 
		"ajax": {
			"url" : "../?event=faculty.viewReport",
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
			   },
			   customize: function(doc){
	                return studentName+"\n"+quizName+"\n\n"+ doc;
	           }
			},
			{
				extend: 'pdfHtml5',
				title: 'Student report',
			    exportOptions: {
			    columns: [ 0, 1, 2]
			  },
			  messageTop: studentName+"\n"+quizName
		   }
		]
	}).container().appendTo($('#exportButtons'));	
});