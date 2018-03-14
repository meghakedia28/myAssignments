 $(document).ready(function(){
	$("#resetForm").submit(function(event){
		event.preventDefault();
		var checkPassword = passwordOut('#password','#error_password');
		var checkConfirmPassword = c_passwordOut('#confirmPassword','#error_confirmpassword');
		if (checkPassword && checkConfirmPassword) {
			$.ajax({
				url : "../components/resetPasswordService.cfc?method=validate&"+$("#resetForm").serialize(),
				data : {},
					success : function(result){
						var obj = $.parseJSON(result);
						if (obj.ERRORID == "") {
							$.alert({
                                title: 'Success!',
                                content: 'The password has been succesfully set!'
                            });
							$("#resetForm").trigger('reset');
							$(".error-msg").text("");
							window.location.replace("loginPage.cfm");
						}
						else {
							for (keys in obj.ERRORID) {
								var id = '#'+(keys.toLowerCase());
								$(id).text(obj.ERRORID[keys]);
							}
						}
					}
				}) ;
			}
		});
	$("input").focus(function(){
        $(this).css("background-color", "#e6f9ff");
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
function passwordOut(){
	$("#password").css("backgroundColor","");
	var paswrd = $("#password").val();
	var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,30})/;
	if (paswrd == "" || paswrd == null){
		showErrorMessage("#password", "#error_password", "You can't leave this empty.");
		return false;
	}
	else if (!(regpassword.test(paswrd))){
		showErrorMessage("#password", "#error_password", "<p>Enter a valid password it should contain:<br>One capital letter,<br>One small letter,<br>One special character,<br>One number,and<br>between 8 to 30 characters.<p>");
		return false;
	}
	else 
		return true;
}
function c_passwordOut(){
	$("#confirmPassword").css("backgroundColor","");
	var paswrd = $("#password").val();
	var cpaswrd = $("#confirmPassword").val();
	if (cpaswrd == "" || cpaswrd == null){
		showErrorMessage("#confirmPassword", "#error_confirmpassword", "You can't leave this empty.");
		return false;
	}
	else if (paswrd != cpaswrd){
		showErrorMessage("#confirmPassword", "#error_confirmpassword", "Confirm password did not match with the password.");
		return false;
	}
	else
		return true;
}
function showErrorMessage (elementId, errorId, errorMessage){
	$(errorId).html(errorMessage);
	$(elementId).css("border","2px solid red");
	
}