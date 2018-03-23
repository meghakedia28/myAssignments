/*-------------------------------------------------------------------------------------------------------------
		FileName    : gobalAjaxCallHandler.js
		Created By  : Megha Kedia
		DateCreated : 23-March-2018
		Description : to handler all the ajax calls for form submition through out the application.

--------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------
	    			Function Name: gobalAjaxHandler
	    			Description: handles ajac calls
	    			Arguments: url,
	    						data
	    			Return Type: none
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