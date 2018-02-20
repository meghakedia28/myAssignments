$(document).ready(function(){
	$("#questionsForm").submit(function(event){
		event.preventDefault();
		 var question = validate('#question');
		 var optiona = validate('#optiona');
		 var optionb = validate('#optionb');
		 var optionc = validate('#optionc');
		 var optiond = validate('#optiond');
		 var answer = validate('#answer');
		 var checkOptiona = $('#optiona').val();
		 var checkOptionb = $('#optionb').val();
		 var checkOptionc = $('#optionc').val();
		 var checkOptiond = $('#optiond').val();
		 var unique = false;
		 if ( checkOptiona != "" && checkOptionb != "" && checkOptionc != "" && checkOptiond != ""){
				unique = checkUnique(checkOptiona, checkOptionb, checkOptionc, checkOptiond);
			}
		 if(question && optiona && optionb && optionc && optiond && answer && unique) {
			 $.ajax ({
			 	url : "../components/enterQuestions.cfc?method=validateAllFields&"+$("#questionsForm").serialize(),
				data : {},
					success: function(result){
					var obj = $.parseJSON(result);
					if (obj.SUCCESSFULL != null){						
							alert (obj.MESSAGE);
							if(obj.SUCCESSFULL == true){
								$("#questionsForm").trigger('reset');
								$(".error-msg").text("");
							}
						}
					if (obj.ERRORID != null){
						for (keys in obj.ERRORID){
							var id = '#'+(keys.toLowerCase());
							$(id).text(obj.ERRORID[keys]);
						}
					}		
				}
			 });
		 }
	});
	$("input,select,textarea").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("input,select,textarea").focusout(function(){
		validate(this);
	});
});
function validate(elementId){
	 var value = $(elementId).val();
	 var optiona = $('#optiona').val();
	 var optionb = $('#optionb').val();
	 var optionc = $('#optionc').val();
	 var optiond = $('#optiond').val();
		if (value == "" || value == null ){
			$(elementId).css("border","2px solid red");
			$(elementId).next('.error-msg').text("You can't leave this empty.");
			return false;
		}
		else if (value.length < 3 || value.length > 50) {
			$(elementId).css("border","2px solid red");
			$(elementId).next('.error-msg').text("Please enter characters of length between 3 to 50.");
			return false;
		}
		else 
			return true;
}
function checkUnique(optiona, optionb, optionc, optiond){
	var error = 0;
	if (optiona == optionb || optiona == optionc || optiona == optiond){
		$('#optiona').css("border","2px solid red");
		$('#optiona').next('.error-msg').text("This option is already selected. Please enter a different option.");
		error = 1;
	}
	if (optionb == optionc || optionb == optiond){
		$('#optionb').css("border","2px solid red");
		$('#optionb').next('.error-msg').text("This option is already selected. Please enter a different option.");
		error = 1;
	}
	if  (optionc == optiond){
		$('#optionc').css("border","2px solid red");
		$('#optionc').next('.error-msg').text("This option is already selected. Please enter a different option.");
		error = 1;
	}
	if(error == 0)
		return true;
	else
		return false;
	
}
