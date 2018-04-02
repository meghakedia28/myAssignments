/*-------------------------------------------------------------------------------------------------------------
FileName    : resetPassword.js
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : validates new password an d confirm password , and submits the form.

--------------------------------------------------------------------------------------------------------------*/
var loaderUrl = location.protocol + '//' + location.host; 
$(document).ready(function(){
	$("#resetForm").submit(function(event){
		event.preventDefault();
		var checkPassword = passwordOut('#password','#error_password');
		var checkConfirmPassword = c_passwordOut('#confirmPassword','#error_confirmpassword');
		if (checkPassword && checkConfirmPassword) {
			var url = "../?event=common.newPasswordSubmit";
			gobalAjaxHandler(url, $("#resetForm").serialize(),changePasswordStatus);
		}
	});
	$("input").focus(function(){
        $(this).css("border","");
		$(this).next('.error-msg').text("");
    });
	$("#password").focusout(function(){
		passwordOut('#password','#error_password');
	});
	$("#confirmPassword").focusout(function(){
		c_passwordOut('#confirmPassword','#error_confirmpassword');
	});
});

/*--------------------------------------------------------------------------------------
Function Name  : changePasswordStatus
Description    : success function after ajax call for submitting the form.
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function changePasswordStatus(result){
	var obj = $.parseJSON(result);
	if (obj.ERRORID == "") {
		$.alert({
            title: 'Success!',
            content: 'The password has been succesfully set!'
        });
		$("#resetForm").trigger('reset');
		$(".error-msg").text("");
		location.replace(loaderUrl + "/demoApp/index.cfm/?event=common.loginPage");
	}
	else {
		for (keys in obj.ERRORID) {
			var id = '#'+(keys.toLowerCase());
			$(id).text(obj.ERRORID[keys]);
		}
	}
}

/*--------------------------------------------------------------------------------------
Function Name  : passwordOut
Description    : validates pssword in focus out
Arguments	   : none
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function passwordOut(){
	$("#password").css("backgroundColor","");
	var paswrd = $("#password").val();
	var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,30})/;
	if (paswrd == "" || paswrd == null){
		showErrorMessage("#password", "#error_password", "You can't leave this empty.");
		return false;
	}
	else if (!(regpassword.test(paswrd))){
		showErrorMessage("#password", "#error_password", 
						 "<p>Enter a valid password it should contain:<br>" +
						 "One capital letter,<br>One small letter,<br>" +
					   	"One special character,<br>One number,and<br>between 8 to 30 characters.<p>");
		return false;
	}
	else 
		return true;
}

/*--------------------------------------------------------------------------------------
Function Name  : c_passwordOut
Description    : validates the confirm password with the password
Arguments	   : none
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function c_passwordOut(){
	$("#confirmPassword").css("backgroundColor","");
	var paswrd = $("#password").val();
	var cpaswrd = $("#confirmPassword").val();
	if (cpaswrd == "" || cpaswrd == null){
		showErrorMessage("#confirmPassword", "#error_confirmpassword", "You can't leave this empty.");
		return false;
	}
	else if (paswrd != cpaswrd){
		showErrorMessage("#confirmPassword", "#error_confirmpassword", 
						 "Confirm password did not match with the password.");
		return false;
	}
	else
		return true;
}