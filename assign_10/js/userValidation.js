$(document).ready(function(){
	$("#form").submit(function(event){
		var valid = validate();
		event.preventDefault();
		if (valid) {
			$.ajax({
				url : "../components/addValidation.cfc?method=validateInsertController&"+$("#form").serialize(),
				data : {},
					success : function(result){
						var obj = $.parseJSON(result);
						if (obj.SUCCESSFULL != null){						
							alert (obj.MESSAGE);
							if(obj.SUCCESSFULL == true){
								alert ('A mail has been send to your email id to set the password');
								$("#form").trigger('reset');
								$(".error-msg").text("");
								$("#list").load(document.URL + ' #list');
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
	});
	$("input").focus(function(){
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
		if (validate){
			$.ajax({
				url : "../components/addValidation.cfc?method=validateEmail",
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
		}
	});
	$('#contactNumber').focusout(function(){
		numberCheck('#contactNumber','#error_contactnumber');
	});
	$('#subject').focusout(function(){
		var subjectVal = $('#subject').val();
		var validate = wordCheck('#subject','#error_subject');
		if (validate){
			$.ajax({
				url : "../components/addValidation.cfc?method=validateSubject",
				data : {
					name : subjectVal
				},
				success: function(result) {
					var obj = $.parseJSON(result);
					if (obj.STATUS == "success"){
						return true;
					}
						else {
							$("#error_subject").text(obj.MESSAGE);
							return false;
						}
				}
			});
		}	
	});
});
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