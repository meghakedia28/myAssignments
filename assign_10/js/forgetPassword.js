$(document).ready(function(){
	$("#forgetPassword_form").submit(function(event){
		event.preventDefault();
//		var valid = emailCheck('#email','#error_email');		
//		if (valid) {
			var id = $('#email').val();
			$.ajax({
				url : "../components/validateUser.cfc?method=validateEmail",
				data : {
					emailId : id
				},
				success : function(result) {
					var obj = $.parseJSON(result);
					if (obj.STATUS == "success"){
						return true;
					}
						else {
							$("#error_email").text(obj.MESSAGE);
							return false;
						}
				}
			});
//		}
	});
	$('#email').focusout(function(){
		var validate = emailCheck('#email','#error_email');
		});
	$('#email').focus(function(){
		$(this).css("border","");
		$('#error_email').text("");
	});
});			
function emailCheck(elementId,errorId) {
	var id = $(elementId).val();
	var regid = /^[a-zA-Z][a-zA-Z0-9\s,'-.!@#\$%\^&\*]{8,40}$/;
	var atposition = id.indexOf("@");
	var dotposition = id.lastIndexOf(".");
	if (id == "" || id == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	if (!(regid.test(id))){
		$(errorId).text("Please use alphabets (a-z) or (A-Z) between 8 and 30 characters");
		$(elementId).css("border","2px solid red");
		return false;
	}
	if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= id.length){
		$(errorId).text("It should be of the format 'abc@gmail.com'");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else 
		return true;
}
