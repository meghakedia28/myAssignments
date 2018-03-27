/*-------------------------------------------------------------------------------------------------------------
							FileName    : userValidation.js
							Created By  : Megha Kedia
							DateCreated : 18-March-2018
							Description : does validation for the user details(faculties and students).

--------------------------------------------------------------------------------------------------------------*/

$(document).ready(function(){
	$("#addUserForm").submit(function(event){
		var valid = validate();
		event.preventDefault();
		//if clientSide validation is successfull do ajax call for server side validation
		if (valid) {
			var url = "../?event=admin.validateAddUser";
			gobalAjaxHandler(url, $("#addUserForm").serializeArray(), insertStatus);
		}
	}); //end of submit
	$(".inputField").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("#firstName").focusout(function(){
 		wordCheck('#firstName','#error_firstname');
 	});
 	$("#lastName").focusout(function(){
 		wordCheck('#lastName','#error_lastname');
 	});
 	$('#email').focusout(function(){
 		var id = $('#email').val();
 		var validate = emailCheck('#email','#error_email');
 		var data = {emailId: id};
 		var url = "../?event=admin.checkEmail";
 		if (validate){
 			gobalAjaxHandler(url,data,successStatus);
 		}
 	});
 	$('#contactNumber').focusout(function(){
 		numberCheck('#contactNumber','#error_contactnumber');
 	});
 	$('#subject').focusout(function(){
 		var subjectVal = $('#subject').val();
 		var validate = wordCheck('#subject','#error_subject');
 		var url = "../?event=admin.checkSubject";
 		var data = {name : subjectVal};
 		if (validate){
 			gobalAjaxHandler(url,data,successStatus);
 		}	
 	});
});

/*--------------------------------------------------------------------------------------------
Function Name  : successStatus()
Description    : success function which is call when ajax call for fields are successfull.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function successStatus(result){
	var obj = $.parseJSON(result);
		if (obj.STATUS == "success"){
			return true;
		}
		else {
			$("#error_email").html(obj.MESSAGE);
			return false;
		}
}

/*--------------------------------------------------------------------------------------------
Function Name  : insertStatus()
Description    : function which is call when ajax call for submition of user details is a success.
Arguments      : result
Return Type    : none
----------------------------------------------------------------------------------------------*/

function insertStatus(result){
	var obj = $.parseJSON(result);
	if (obj.SUCCESSFULL != null){
		if(obj.SUCCESSFULL){
			$.confirm({
                title: 'Successful',
                content: 'A mail has been send to your email id to set the password',
                buttons: {
                    Ok : function () {
                    	$("#addUserForm").trigger('reset');
                    	$(".inputField").css("border","");
						$(".error-msg").text("");	
                    }
                }
            });	
		}
		else{
			$.confirm({
                title: 'Error',
                content: 'Some error has occured, please try again later'
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
Function Name  : validate()
Description    : to validate all the fields in the form, return true when all
 				the data in fields successfully validates.
Arguments      : None
Return Type    : boolean
----------------------------------------------------------------------------------------------*/

function validate(){
 	var firstName = wordCheck('#firstName','#error_firstname');
 	var lastName = wordCheck('#lastName','#error_lastname');
 	var email = emailCheck('#email','#error_email');
 	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
 	if ($('#subject').length != 0){
 		var sub = wordCheck('#subject','#error_subject');
 	}
 	if (firstName && lastName && email && phoneNumber){
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