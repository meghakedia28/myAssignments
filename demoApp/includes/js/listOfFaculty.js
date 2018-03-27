/*-------------------------------------------------------------------------------------------------------------
						FileName    : listOfFaculty.js
						Created By  : Megha Kedia
						DateCreated : 18-March-2018
						Description : display the datatable for the list of faculties, 
										and has functionality to edit the row data.

-------------------------------------------------------------------------------------------------------------*/

var listOfFacultyTable;
$(document).ready(function() {
	var userid = $('#id').val() ;
	 listOfFacultyTable = $('#listOfFaculties').DataTable({
		 "columnDefs": [ {
		      "targets"  : [5],
		      "orderable": false,
		      "searchable": false,
		    }],
		 "order": [],
		 "ajax": {
			"url" : "../?event=admin.getUser",
			"data" :{
				role : '2'
			}
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

/*--------------------------------------------------------------------------------------------
Function Name  : updateRow()
Description    : function used to update the user details.
Arguments      : none
Return Type    : boolean
----------------------------------------------------------------------------------------------*/

function updateRow(){
	event.preventDefault();
	var valid = validateAll();
	if (valid){
		var url = "../?event=admin.updateRow";
		var data = $("form").serializeArray();
		gobalAjaxHandler(url,data,updateStatus);
	}
	else 
		return false;
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
			$(id).html(obj.ERRORID[keys]);
		}
	}
}

/*--------------------------------------------------------------------------------------------
Function Name  : subjectCheck()
Description    : function validate subject
Arguments      : elementId,
				errorId
Return Type    : none
----------------------------------------------------------------------------------------------*/

function subjectCheck(elementId,errorId){
	var subjectVal = $(elementId).val();
	var validate = wordCheck(elementId,errorId);
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