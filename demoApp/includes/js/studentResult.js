/*-------------------------------------------------------------------------------------------------------------
FileName    : studentResult.js
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : displays students results in student portal.

--------------------------------------------------------------------------------------------------------------*/
var table;
	$(document).ready(function(){
		var loaderUrl = location.protocol + '//' + location.host + '/demoApp/includes/images/ajax-loader.gif'; 
		table = $("#result").DataTable({
			"language": {
				"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
			},
			"search": {
			    "smart": false
			},
			"order": [],
			"ajax": {
				"url" : "../?event=student.getResults"
	    	}
		});
		var buttons = new $.fn.dataTable.Buttons(table, {
   		buttons: [
   		          {
				    extend: 'csvHtml5',
				    title: 'Performance report',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3]
				   },
				   customize: function(doc){
		                return userName+"\n\n"+ doc;
		           }
				},
				{
					extend: 'pdfHtml5',
					title: 'Performance report',
				    exportOptions: {
				    columns: [ 0, 1, 2, 3]
				  },
				  messageTop: userName
			   }
			]
   		}).container().appendTo($('#exportButtons'));
	});
	