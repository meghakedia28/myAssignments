 $(document).ready(function(){
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
		$("#error_confirmPassword").text("You can't leave this empty.");
		$("#confirmPassword").css("border","2px solid red");
		return false;
	}
	else if (paswrd != cpaswrd){
		$("#error_confirmPassword").text("Confirm password did not match with the password.");
		$("#confirmPassword").css("border","2px solid red");
		return false;
	}
	else
		return true;
}