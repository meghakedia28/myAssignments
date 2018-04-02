/*-------------------------------------------------------------------------------------------------------------
FileName    : facultyResultSet.js
Created By  : Megha Kedia
DateCreated : 21-March-2018
Description : view all the students results.

-------------------------------------------------------------------------------------------------------------*/

$.noConflict();
var resultTable,filter, filtereData;
var userId = $('#userId').val();
var loaderUrl = location.protocol + '//' + location.host + '/demoApp/includes/images/ajax-loader.gif';
$(document).ready(function(){
	$('.selectpicker').selectpicker();
	resultTable = $('#result').DataTable({
		"language": {
			"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
		},
		"search": {
		    "smart": false
		},
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
		}).container().appendTo($('#exportButtons'));	
	});

/*--------------------------------------------------------------------------------------------
Function Name  : addFilter()
Description    : this the ajax call to set the filter by quiz .
Arguments      : data
Return Type    : none
----------------------------------------------------------------------------------------------*/

	function addFilter(data){
		var postData = $('#filter').val();
		postData = postData + "";
		resultTable.destroy();
		if (postData == '' || postData == "null"){
			data = {userId : userId};
		}
		else{
			data = {listOfQuizId: postData, userId : userId};
		}
		resultTable = $('#result').DataTable({
			"language": {
				"sLoadingRecords": "<img src = '" + loaderUrl + "'> Loading.."
			},
			"search": {
			    "smart": false
			},
			"order": [],
			"ajax": {
				"url" : "../?event=faculty.viewResults",
				"data" : data
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
	}
			