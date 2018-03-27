/*-------------------------------------------------------------------------------------------------------------
						FileName    : listOfStudent.js
						Created By  : Megha Kedia
						DateCreated : 18-March-2018
						Description : display the datatable for the list of faculties, 
										and has functionality to edit the row data.

-------------------------------------------------------------------------------------------------------------*/

var listOfStudentTable;
$(document).ready(function() {
	var userid = $('#id').val() ;
	 listOfStudentTable = $('#listOfStudents').DataTable({
		 "columnDefs": [ {
		      "targets"  : [4],
		      "orderable": false,
		      "searchable": false,
		    }],
		 "order": [],
		 "ajax": {
			"url" : "../?event=admin.getUser",
			"data" :{
				role : '3'
			}
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
		var data = {userId: userId};
		url = "../?event=admin.populateModel";
		gobalAjaxHandler(url,data,populateData);
	});
});

/*--------------------------------------------------------------------------------------------
Function Name  : populateData()
Description    : function is called after successfull ajax call to populate data.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function populateData(result){
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

/*--------------------------------------------------------------------------------------------
Function Name  : updateRow()
Description    : function used to update the user details.
Arguments      : none
Return Type    : boolean
----------------------------------------------------------------------------------------------*/

function updateRow(){
	event.preventDefault();
	var valid = validateAll();
	url : "../?event=admin.updateRow";
	if (valid){
		gobalAjaxHandler(url,$("form").serializeArray(),updateStatus);
	}
}

/*--------------------------------------------------------------------------------------------
Function Name  : updateStatus()
Description    : function called on success of ajax call.
Arguments      : result
Return Type    : boolean
----------------------------------------------------------------------------------------------*/

function updateStatus(result){
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
	
/*--------------------------------------------------------------------------------------------
Function Name  : validateAll()
Description    : function to validate all the fields
Arguments      : none
Return Type    : boolean
----------------------------------------------------------------------------------------------*/

function validateAll(){
	var firstName = wordCheck('#firstName','#error_firstname');
	var lastName = wordCheck('#lastName','#error_lastname');
	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
	if (firstName && lastName && phoneNumber)
		return true;
	else
		return false;
}
