var listOfStudentsTable;
$(document).ready(function() {
	var userid = $('#id').val() ;
	listOfStudentsTable = $('#listOfStudents').DataTable({
        "processing": true,
   		"serverSide": true,
		"ajax": {
			"url" : "../components/listOfStudentsService.cfc?method=getStudentsList",
			"data" :{}
		}
	});
	var buttons = new $.fn.dataTable.Buttons(listOfStudentsTable, {
	buttons: [
	          {
			    extend: 'csvHtml5',
			    title: 'List of students',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3]
			   }
			},
			{
				extend: 'pdfHtml5',
				title: 'List of students',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3]
			  }
		   }
		]
	}).container().appendTo($('#buttons'));
});
$(document).on('click','#edit', function(e){
	e.preventDefault();
	var userId = $(this).data('id');
	$.ajax({
		url : "../components/listOfStudentsService.cfc?method=populateData",
		data : {id : userId},
		datatype: "html",
	}).done(openEditModel);
});

function openEditModel(html){
	$('#editModal').html('');
	$('#editModal').html(html);
	validate ('#editModal');
}
function validate(ref){
	$("#submitEditForm").click(function(){
		event.preventDefault();
		var valid = validateAll();
		if(valid){
			submitForm();
		}
	});
	$("input").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("#firstName, #lastName").focusout(function(){
		wordCheck(this,$(this).next('.error-msg'));
	});
	$("#contactNumber").focusout(function(){
		numberCheck('#contactNumber','#error_contactnumber');
	});
}
function submitForm(){
	event.preventDefault();
		$.ajax({
			url : "../components/enterDataService.cfc?method=updateUserInformationController&"+$("form").serialize(),
			data : {},
				success : function(result){
					var obj = $.parseJSON(result);
					if (obj.SUCCESSFULL != null){						
						if(obj.SUCCESSFULL){
							$(".error-msg").text("");
							$('.close').click(); 
							listOfStudentsTable.ajax.reload();
						}
					}
					if (obj.ERRORID != null){
						for (keys in obj.ERRORID){
							var id = '#'+(keys.toLowerCase());
							$(id).text(obj.ERRORID[keys]);
						}
					}
				}
		}) ;
}
function validateAll(){
	var firstName = wordCheck('#firstName','#error_firstname');
	var lastName = wordCheck('#lastName','#error_lastname');
	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
	if (firstName && lastName && phoneNumber)
		return true;
	else
		return false;
}