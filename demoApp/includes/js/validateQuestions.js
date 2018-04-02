/*-------------------------------------------------------------------------------------------------------------
						FileName    : validateQuestions.js
						Created By  : Megha Kedia
						DateCreated : 13-March-2018
						Description : does validation for add questions.

--------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------
Function Name  : validate
Description    : validate all the fields for add questions
Arguments	   : elementId
Return Type	   : none
------------------------------------------------------------------------------------------*/

function validate(elementId, errorId){
	 var value = $(elementId).val();
		if (value == "" || value == null ){
			showErrorMessage(elementId, errorId, "You can't leave this empty.");
			return false;
		}
		else if (value.length < 1 || value.length > 255) {
			showErrorMessage(elementId, errorId, "Please enter characters of length between 1 to 255.");
			return false;
		}
		else 
			return true;
}

/*--------------------------------------------------------------------------------------
Function Name  : checkUnique
Description    : validate if all the options are unique or not.
Arguments	   : optiona,
 				optionb,
 				optionc,
 				optiond
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function checkUnique(optiona, optionb, optionc, optiond){
	var error = 0;
	if (optiond == optionc || optiond == optionb || optiond == optiona){
		showErrorMessage("#optiond", "error_optiond",
				"This option is already selected. Please enter a different option.");
		error = 1;
	}
	if (optionc == optionb || optionc == optiona){
		showErrorMessage("#optionc", "error_optionc",
				"This option is already selected. Please enter a different option.");
		error = 1;
	}
	if  (optionb == optiona){
		showErrorMessage("#optionb", "error_optionb",
				"This option is already selected. Please enter a different option.");
		error = 1;
	}
	if(error == 0)
		return true;
	else
		return false;
}