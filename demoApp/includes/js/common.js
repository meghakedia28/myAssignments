/*-------------------------------------------------------------------------------------------------------------
FileName    : common.js
Created By  : Megha Kedia
DateCreated : 23-March-2018
Description : has cfunctions which are common to whole of the application.

--------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------
Function Name  : gobalAjaxHandler
Description    : handles ajax calls
Arguments	   : url,
				 data
Return Type	   : none
------------------------------------------------------------------------------------------*/

function gobalAjaxHandler (url, data, callback){
	$.ajax({
		url : url,
		type: "post",
		data : data,
		success : function(result){
			callback(result);
		}
	}) ;
}

/*--------------------------------------------------------------------------------------------
Function Name  : showErrorMessage()
Description    : function is used to show the error message.
Arguments      : elementId,
				 errorId,
				 errorMessage
Return Type    : none
----------------------------------------------------------------------------------------------*/

function showErrorMessage(elementId, errorId, errorMessage){
	$(errorId).html(errorMessage);
	$(elementId).css("border","2px solid red");
}