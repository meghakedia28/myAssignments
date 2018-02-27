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

		var questionsForm = $('#questionsForm');
		var canStartTest = false;
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
function formSubmit(){
	$.ajax({
		url : "../components/testValidationService.cfc?method=checkTestTime",
		data : {},
			success : function(result){
				var obj = $.parseJSON(result);
					if(obj){
						$('#questionsForm').submit();
					}
					else{
						$.alert({
						    title: 'Error',
						    content: 'Some unexpected error has occured. Please try again later.'
						});
					}
			}
	});
}