/*-------------------------------------------------------------------------------------------------------------
FileName    : forgetPassword.js
Created By  : Megha Kedia
DateCreated : 29-March-2018
Description : validates the password for forgetPassword page and 
			  then does ajx call to set the new password.

-------------------------------------------------------------------------------------------------------------*/

$(document).ready(function(){
	$("#forgetPasswordForm").submit(function(event){
		event.preventDefault();
		var valid = emailCheck("#email","#error_email");		
		if (valid) {
			var id = ($("#email").val()).trim();
			var url = "../?event=common.forgetPasswordController";
			var data = {emailId : id};
			gobalAjaxHandler(url,data,forgetPasswordStatus);
		}		
	});
	$("#email").focusout(function(){
		var validate = emailCheck("#email","#error_email");
		});
	$("#email").focus(function(){
		$(this).css("border","");
		$("#error_email").text("");
	});
});	

/*--------------------------------------------------------------------------------------------
Function Name  : forgetPasswordStatus()
Description    : this the ajax call to set the new password entered by user.
Arguments      : result
Return Type    : boolean
----------------------------------------------------------------------------------------------*/

function forgetPasswordStatus(result){
	var obj = $.parseJSON(result);
	if (obj.STATUS == "success"){
		$.alert({
			title: "Information",
            content: "A reset link has been send to the associated email address.",
            buttons: {
                Ok : function () {
                	$("#forgetPasswordForm").trigger("reset");
                	return true;
                }
            }
        });
	}
	else if (obj.STATUS == "error"){
		$.alert({
			title: "Error",
            content: "Some Unexpected error has occured, please try again later."
		});
	}
	else {
		$("#error_email").text(obj.MESSAGE);
		return false;
	}
}