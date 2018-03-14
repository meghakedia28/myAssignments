$(document).ready(function(){
	$("#forgetPasswordForm").submit(function(event){
		event.preventDefault();
		var valid = emailCheck('#email','#error_email');		
		if (valid) {
			var id = $('#email').val();
			$.ajax({
				url : "../components/validateUser.cfc?method=validateAndSendMailController",
				data : {
					emailId : id
				},
				success : function(result) {
					var obj = $.parseJSON(result);
					if (obj.STATUS == "success"){
						$.alert({
							title: 'Information',
                            content: 'A reset link has been send to the associated email address.',
                            buttons: {
                                Ok : function () {
                                	$("#forgetPasswordForm").trigger('reset');
                                	return true;
                                }
                            }
                        });
					}
					else if (obj.STATUS == "error"){
						$.alert({
							title: 'Error',
                            content: 'Some Unexpected error has occured, please try again later.'
						});
					}
					else {
						$("#error_email").text(obj.MESSAGE);
						return false;
					}
				}
			});
		}		
	});
	$('#email').focusout(function(){
		var validate = emailCheck('#email','#error_email');
		});
	$('#email').focus(function(){
		$(this).css("border","");
		$('#error_email').text("");
	});
});			