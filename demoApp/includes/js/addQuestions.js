/*-------------------------------------------------------------------------------------------------------------
FileName    : addQuestions.js
Created By  : Megha Kedia
DateCreated : 13-March-2018
Description : Question form submission using Ajax.

--------------------------------------------------------------------------------------------------------------*/

$(document).ready(function(){
	$("#questionsForm").submit(function(event){
		 event.preventDefault();
 		 var checkQuestion = validate('#question', '#error_question');
 		 var checkOptiona = validate('#optiona', '#error_optiona');
 		 var checkOptionb = validate('#optionb', '#error_optionb');
 		 var checkOptionc = validate('#optionc', '#error_optionc');
 		 var checkOptiond = validate('#optiond', '#error_optiond');
 		 var checkAnswer = validate('#answer', '#error_answer');
 		 var optiona = ($('#optiona').val()).trim();
 		 var optionb = ($('#optionb').val()).trim();
 		 var optionc = ($('#optionc').val()).trim();
 		 var optiond = ($('#optiond').val()).trim();
 		 var unique = false;
 		 if ( optiona != "" && optionb != "" && optionc != "" && optiond != ""){
 				unique = checkUnique(optiona, optionb, optionc, optiond);
 			}
		 if(checkQuestion && checkOptiona && checkOptionc && checkOptiond && checkOptionb && checkAnswer && unique){
			var url = "../?event=faculty.enterQuestions&";
			gobalAjaxHandler(url, $("#questionsForm").serializeArray(), addQuestionStatus);
		 }
	});
	$(".inputField").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
 	$(".inputField").focusout(function(){
 		validate(this, $(this).next('.error-msg'));
 	});
});

/*------------------------------------------------------------------------------------------
Function Name  : addQuestionStatus
Description    : success function which is called after ajax form submission for questions
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function addQuestionStatus(result){
	var obj = $.parseJSON(result);
	if (obj.SUCCESSFULL != null){						
		if(obj.SUCCESSFULL){
			$.confirm({
                title: 'Success!',
                content: obj.MESSAGE,
                buttons: {
                    Ok : function () {
							$("#questionsForm").trigger('reset');
							$(".error-msg").text("");
					}	
                }
            });	
		}
		else{
			$.confirm({
                title: 'Error!',
                content: obj.MESSAGE
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