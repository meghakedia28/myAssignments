function validate(elementId){
	 var value = $(elementId).val();
		if (value == "" || value == null ){
			showErrorMessage(elementId, "You can't leave this empty.");
			return false;
		}
		else if (value.length < 1 || value.length > 50) {
			showErrorMessage(elementId, "Please enter characters of length between 1 to 50.");
			return false;
		}
		else 
			return true;
}
function checkUnique(optiona, optionb, optionc, optiond){
	var error = 0;
	if (optiond == optionc || optiond == optionb || optiond == optiona){
		showErrorMessage("#optiond", "This option is already selected. Please enter a different option.");
		error = 1;
	}
	if (optionc == optionb || optionc == optiona){
		showErrorMessage("#optionc", "This option is already selected. Please enter a different option.");
		error = 1;
	}
	if  (optionb == optiona){
		showErrorMessage("#optionb", "This option is already selected. Please enter a different option.");
		error = 1;
	}
	if(error == 0)
		return true;
	else
		return false;
}
function showErrorMessage (id, errorMessage){
	$(id).css("border","2px solid red");
	$(id).next(".error-msg").text(errorMessage);	
}