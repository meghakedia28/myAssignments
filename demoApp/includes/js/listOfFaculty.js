var listOfFacultyTable;
$(document).ready(function() {
	var userid = $('#id').val() ;
	 listOfFacultyTable = $('#listOfFaculties').DataTable({
		 "columnDefs": [ {
		      "targets"  : [5],
		      "orderable": false
		    }],
		 "order": [],
		 "ajax": {
			"url" : "../?event=admin.getFaculty",
			"data" :{}
    		}
		 });
	var buttons = new $.fn.dataTable.Buttons(listOfFacultyTable, {
	buttons: [
	          {
			    extend: 'csvHtml5',
			    title: 'List of faculties',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3, 4]
			   }
			},
			{
				extend: 'pdfHtml5',
				title: 'List of faculties',
			    exportOptions: {
			    columns: [ 0, 1, 2, 3, 4]
			  }
		   }
		]
	}).container().appendTo($('#buttons'));
	$(".form-control").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("#firstName, #lastName").focusout(function(){
		wordCheck(this,$(this).next('.error-msg'));
	});
	$("#contactNumber").focusout(function(){
		numberCheck('#contactNumber','#error_contactnumber');
	});
	$("#subject").focusout(function(){
		subjectCheck('#subject','#error_subject');
	});
	$('#rowEdit').on('show.bs.modal', function (event) {
		$(".form-control").css("border","");
		$(".form-control").next('.error-msg').text("");
		var userId = $(event.relatedTarget).data('id');
		url = "../?event=admin.populateFacultyModel";
		$.ajax({
			url: url,
			data:{
				userId: userId,
		},
		success : function(result){
			var obj = $.parseJSON(result);
			$('#subject').val(obj.subject);
			$('#firstName').val(obj.firstName);
			$('#lastName').val(obj.lastName);
			$('#email').val(obj.emailId);
			$('#userId').val(userId);
			if (obj.active == 1){
				$('#active').val("true");
			}
			else{
				$('#active').val("false");
			}
			$('#contactNumber').val(obj.contactNumber);	 
	  	  }
	  });
	});
});

function updateRow(){
	event.preventDefault();
	var valid = validateAll();
	if (valid){
		$.ajax({
			url : "../?event=admin.updateRow",
			data : $("form").serializeArray(),
				success : function(result){
					var obj = $.parseJSON(result);
					if (obj.SUCCESSFULL != null){						
						if(obj.SUCCESSFULL){
							$('.close').click(); 
							$.confirm({
		                        title: 'Success',
		                        content: 'The user information has been updated.',
		                        buttons: {
		                            Ok : function () {
		                            	$(".error-msg").text("");
		                            	listOfFacultyTable.ajax.reload();
		        						return true;
		                            }
		                        }
							});
						}
						else {
							$.confirm({
	                            title: 'Error',
	                            content: 'Some unexpected error has occured. Please try again later.'
							});
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
}
function subjectCheck(elementId,errorId){
	var subjectVal = $(elementId).val();
	var validate = wordCheck(elementId,errorId);
}
function validateAll(){
	var firstName = wordCheck('#firstName','#error_firstname');
	var lastName = wordCheck('#lastName','#error_lastname');
	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
	if ($('#subject').length != 0){
		var sub = wordCheck('#subject','#error_subject');
	}
	if (firstName && lastName && phoneNumber){
		if ($('#subject').length != 0){
			if (sub)
				return true;
			else
				return false;
		}
		else{
			return true;
		}
	}
	else
		return false;
}