function wordCheck(elementId,errorId){
	var word = $(elementId).val();
	var regword = /^[a-zA-Z]{1,30}$/;
	if ( word == "" || word == null){
		showErrorMessage(elementId, errorId, "You can't leave this empty.");
		return false;
	}
	else if (!(regword.test(word))){
		showErrorMessage(elementId, errorId, "<p>Please use only letters(a-z) or (A-Z)<br/>between 1 and 30 characters.</p>");
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
		showErrorMessage(elementId, errorId, "You can't leave this empty.");
		return false;
	}
	if (!(regid.test(id))){
		showErrorMessage(elementId, errorId, "Please use alphabets (a-z) or (A-Z) between 8 and 30 characters");
		return false;
	}
	if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= id.length){
		showErrorMessage(elementId, errorId, "It should be of the format 'abc@gmail.com'");
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
		showErrorMessage(elementId, errorId, "You can't leave this empty.");
		return false;
	}
	else if(!(regnum.test(number1))){
		showErrorMessage(elementId, errorId, "Please enter only numbers(0-9) of 10 digits.");
		return false;
	}
	else
		return true;
}
function showErrorMessage(elementId, errorId, errorMessage){
	$(errorId).html(errorMessage);
	$(elementId).css("border","2px solid red");
}