/*----------------------------------------------------------------------------------------------------------
FileName    : validateQuiz.js
Created By  : Megha Kedia
DateCreated : 15-March-2018
Description : does validation related to setting a quiz.

------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------
Function Name  : quizName
Description    : validates quiz name.
Arguments	   : elementId,
				errorId
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function quizName(elementId,errorId){
	var word = ($(elementId).val().trim());
	var regword = /^[a-zA-Z0-9 ]{1,30}$/;
	if ( word == "" || word == null){
		showErrorMessage(elementId, errorId, "You can't leave this empty.");
		return false;
	}
	else if (!(regword.test(word))){
		showErrorMessage(elementId, errorId, "<p>Please enter a valid quiz name: <br/>" +
					"use (a-z) OR (A-Z) OR (0-9) <br/>between 1 to 30 characters.</p>");
		
		return false;
	}
	else
		return true;
}

/*--------------------------------------------------------------------------------------
Function Name  : startDateTimeStatus
Description    : success call after ajax call check for startDateTime.
Arguments	   : result
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function startDateTimeStatus(result){
	var obj = $.parseJSON(result);
	if (obj.STATUS == "success"){
		return true;
	}
	else if (obj.STATUS == "fail"){
		$.confirm({
            title: 'Error!',
            content: obj.MESSAGE
		});
		return false;
	}
	else {
		showErrorMessage("#startDateTime", "#error_startdatetime", obj.MESSAGE);
		return false;
	}
}

/*--------------------------------------------------------------------------------------
Function Name  : quizNameStatus
Description    : success call after ajax call check for quiz name.
Arguments	   : result
Return Type	   : boolean.
------------------------------------------------------------------------------------------*/

function quizNameStatus(result){
	var obj = $.parseJSON(result);
	if (obj.STATUS == "success"){
		return true;
	}
	else if (obj.STATUS == "fail"){
		$.confirm({
            title: 'Error!',
            content: obj.MESSAGE
		});
		return false;
	}
	else {
		showErrorMessage("#quizName", "#error_quizname", obj.MESSAGE);
		return false;
	}
}

/*--------------------------------------------------------------------------------------
Function Name  : submitQuizStatus
Description    : success call after quiz form submission.
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function submitQuizStatus(result){
	var obj = $.parseJSON(result);
	if (obj.SUCCESSFULL != null){						
		if(obj.SUCCESSFULL){
			$.confirm({
                title: 'Success!',
                content: obj.MESSAGE,
                buttons: {
                    Ok : function () {
                    		$("#quizForm").trigger('reset');
							$(".error-msg").text("");
						}
                    }
				});	
		}
		else {
			$.confirm({
                title: 'Error!',
                content: obj.MESSAGE
			});
		}
	}
	if (obj.ERRORID != null){
		for (keys in obj.ERRORID){
			var id = '#'+(keys.toLowerCase());
			$(id).html(obj.ERRORID[keys]);
		}
	}
}

/*--------------------------------------------------------------------------------------
Function Name  : checkEmpty
Description    : checks if any of the required fields are left empty.
Arguments	   : elementId,
				errorId
Return Type	   : boolean
------------------------------------------------------------------------------------------*/

function checkEmpty(elementId,errorId){
	var start = ($(elementId).val()).trim();
	if(start == "" || start == null){
		showErrorMessage(elementId, errorId, "You can't leave this empty.");
		return false;
	}	
	else
		return true;
}