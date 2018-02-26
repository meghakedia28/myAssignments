var studentProfileTable;
$(document).ready(function(){
	var userId = $('#userId').val();
	studentProfileTable = $('#result').DataTable({
        "ajax": {
			"url" : "../components/getUserDetailsService.cfc?method=getStudentsDetails",
			"data" :{}
				}
		 });
		var buttons = new $.fn.dataTable.Buttons(studentProfileTable, {
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
		$('#scores').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) 
			  var id = button.data('id') 
			  $('#studentId').val(id);
			  getTable(id);
		});		
});
function getTable(id){
	var userId = $('#userId').val();
	var resultTable = $('#scoreTable').DataTable({
		"ajax": {
			"url" : "../components/facultyResultSet.cfc?method=getindividualStudentResultSet",
			"data" :{
				studentId : id,
				userId : userId
				}
			}
		 });
		 var buttons = new $.fn.dataTable.Buttons(resultTable, {
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
			}).container().appendTo($('#resultButtons'));
}