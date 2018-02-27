function wordCheck(elementId,errorId){
	var word = $(elementId).val();
	var regword = /^[a-zA-Z]{1,30}$/;
	if ( word == "" || word == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else if (!(regword.test(word))){
		$(errorId).html("<p>Please use only letters(a-z) or (A-Z)<br/>between 1 and 30 characters.</p>");
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