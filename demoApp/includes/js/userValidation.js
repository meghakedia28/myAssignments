$(document).ready(function(){
	$("#form").submit(function(event){
		var valid = validate();
		event.preventDefault();
		//if clientSide validation is successfull do ajax call for server side validation
		if (valid) {
			$.ajax({
				url : "../?event=admin.validateAddUser",
				type: "post",
				data : $(form).serializeArray(),
					success : function(result){
						var obj = $.parseJSON(result);
						if (obj.SUCCESSFULL != null){
							if(obj.SUCCESSFULL){
								$.confirm({
	                                title: 'Successful',
	                                content: 'A mail has been send to your email id to set the password',
	                                buttons: {
	                                    Ok : function () {
	                                    	$("#form").trigger('reset');
	        								$(".error-msg").text("");
	        								$("#list").load(document.URL + ' #list');	
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
								$(id).text(obj.ERRORID[keys]);
							}
						}
					}
			}) ;
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
 		if (validate){
 			$.ajax({
 				url : "../?event=admin.checkEmail",
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
 				url : "../?event=admin.checkSubject",
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
 //validate() to validate all the fields in the form
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