var listOfStudentTable;
$(document).ready(function() {
	var userid = $('#id').val() ;
	 listOfStudentTable = $('#listOfStudents').DataTable({
		 "columnDefs": [ {
		      "targets"  : [4],
		      "orderable": false
		    }],
		 "order": [],
		 "ajax": {
			"url" : "../?event=admin.getStudent",
			"data" :{}
    		}
		});
	var buttons = new $.fn.dataTable.Buttons(listOfStudentTable, {
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
	$('#rowEdit').on('show.bs.modal', function (event) {
		$(".form-control").css("border","");
		$(".form-control").next('.error-msg').text("");
		var userId = $(event.relatedTarget).data('id');
		url = "../?event=admin.populateStudentModel";
		$.ajax({
			url: url,
			data:{
				userId: userId,
		},
		success : function(result){
			var obj = $.parseJSON(result);
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
		                            	listOfStudentTable.ajax.reload();
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
function validateAll(){
	var firstName = wordCheck('#firstName','#error_firstname');
	var lastName = wordCheck('#lastName','#error_lastname');
	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
	if (firstName && lastName && phoneNumber)
		return true;
	else
		return false;
}
