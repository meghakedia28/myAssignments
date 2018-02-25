function validate(elementId){
	 var value = $(elementId).val();
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
	if (optiond == optionc || optiond == optionb || optiond == optiona){
		$('#optiond').css("border","2px solid red");
		$('#optiond').next('.error-msg').text("This option is already selected. Please enter a different option.");
		error = 1;
	}
	if (optionc == optionb || optionc == optiona){
		$('#optionc').css("border","2px solid red");
		$('#optionc').next('.error-msg').text("This option is already selected. Please enter a different option.");
		error = 1;
	}
	if  (optionb == optiona){
		$('#optionb').css("border","2px solid red");
		$('#optionb').next('.error-msg').text("This option is already selected. Please enter a different option.");
		error = 1;
	}
	if(error == 0)
		return true;
	else
		return false;
	
}