$(document).ready(function(){
	$("#form").submit(function(event){
		var valid = validate();
		event.preventDefault();
		$.ajax({
			url : "../components/addValidation.cfc?method=validateAllFields&"+$("#form").serialize(),
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
function wordCheck(elementId,errorId){
	var word = $(elementId).val();
	var regword = /^[a-zA-Z]{1,30}$/;
	if ( word == "" || word == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else if (!(regword.test(word))){
		$(errorId).text("Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function emailCheck(elementId,errorId){
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
	}
	if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= id.length){
		$(errorId).text("It should be of the format 'abc@gmail.com'");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else 
		return true;
}
function numberCheck(elementId,errorId){
	var number1 = $(elementId).val();
	$(elementId).css("backgroundColor","");
	var regnum = /^[0-9]{10}$/;
	if (number1 == "" || number1 == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else if(!(regnum.test(number1))){
		$(errorId).text("Please enter only numbers(0-9) of 10 digits.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function validate(){
	var firstName = wordCheck('#firstName','#error_firstname');
	var lastName = wordCheck('#lastName','#error_lastname');
	var email = emailCheck('#email','#error_email');
	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
	var sub = wordCheck('#subject','error_subject');
	if (firstName && lastName && email && phoneNumber && sub)
	return true;
	else
	return false;
		}
