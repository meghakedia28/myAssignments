 $(document).ready(function(){
	$("#resetForm").submit(function(event){
		event.preventDefault();
		var checkPassword = passwordOut('#password','#error_password');
		var checkConfirmPassword = c_passwordOut('#confirmPassword','#error_confirmPassword');
		if (checkPassword && checkConfirmPassword) {
			$.ajax({
				url : "../components/resetPasswordService.cfc?method=validate&"+$("#resetForm").serialize(),
				data : {},
					success : function(result){
						var obj = $.parseJSON(result);
						if (obj.ERRORID == "") {
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
		c_passwordOut('#confirmPassword','#error_confirmPassword');
	});
});
function passwordOut(){
	$("#password").css("backgroundColor","");
	var paswrd = $("#password").val();
	var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,30})/;
	if (paswrd == "" || paswrd == null){
		$("#error_password").text("You can't leave this empty.");
		$("#password").css("border","2px solid red");
		return false;
	}
	else if (!(regpassword.test(paswrd))){
		$("#error_password").html("<p>Enter a valid password it should contain:<br>One capital letter,<br>One small letter,<br>One special character,<br>One number,and<br>between 8 to 30 characters.<p>");
		$("#password").css("border","2px solid red");
		return false;
	}
	else 
		return true;
}
function c_passwordOut(){
	$("#confirmPassword").css("backgroundColor","");
	var paswrd = $("#password").val();
	var cpaswrd = $("#confirmPassword").val();
	//var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	if (cpaswrd == "" || cpaswrd == null){
		$("#error_confirmpassword").text("You can't leave this empty.");
		$("#confirmPassword").css("border","2px solid red");
		return false;
	}
	else if (paswrd != cpaswrd){
		$("#error_confirmpassword").text("Confirm password did not match with the password.");
		$("#confirmPassword").css("border","2px solid red");
		return false;
	}
	else
		return true;
}