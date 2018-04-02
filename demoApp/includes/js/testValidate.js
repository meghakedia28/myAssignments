/*-------------------------------------------------------------------------------------------------------------
						FileName    : testValidate.js
						Created By  : Megha Kedia
						DateCreated : 28-March-2018
						Description : does validation for test information 
									and display of start test button during the test .

--------------------------------------------------------------------------------------------------------------*/

$(document).ready(function(){
	(function(){
		var serverTime = new Date($('#nowTime').val()).getTime();
		var startTime = new Date($('#startTime').val()).getTime();
		var endTime = new Date($('#endTime').val()).getTime();
		var displayDiff = startTime - serverTime ;
		var escapeDiff = endTime - startTime;
		var diff = endTime - serverTime;
		if (serverTime < startTime){
			setTimeout(function(){createButton(escapeDiff);},displayDiff);
		}
		else if (serverTime >= startTime && serverTime <= endTime){
			createButton(diff);
		}
		var testStartForm = $('#testStartForm');
		function createButton(time){
			var element = $('<button type="submit" class="button text-center" id="startTest" name="startTest" onClick="formSubmit()" >Start test</button>');
			$('#startTestButton').append(element);
			setTimeout(function(){
				$('#startTest').remove();
				location.reload();
				},time);
			}
	})();
});

/*--------------------------------------------------------------------------------------
Function Name  : formSubmit
Description    : validates if its a valid quiz submit and then submits the form.
Arguments	   : none
Return Type	   : none
------------------------------------------------------------------------------------------*/

function formSubmit(){
		var url = "../?event=student.testValidate";
		var data = {};
		gobalAjaxHandler(url, data, testValidateStatus);
	}

/*--------------------------------------------------------------------------------------
Function Name  : testValidateStatus
Description    : validates before starting the test, if successfull then starts the test
Arguments	   : result
Return Type	   : none
------------------------------------------------------------------------------------------*/

function testValidateStatus(result){
	var obj = $.parseJSON(result);
		if(obj){
			$("#testStartForm").submit();
		}
		else{
			$.alert({
			    title: "Error",
			    content: "Some unexpected error has occured. Please try again later."
			});
		}
}