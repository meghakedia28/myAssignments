$(document).ready(function(){
	$("#questionsForm").submit(function(event) {
		event.preventDefault();
		$.ajax({
			url : "../components/testValidationService.cfc?method=checkTestTime",
			data : {},
				success : function(result){
					var obj = $.parseJSON(result);
						if(obj == true){
							$('#questionsForm').unbind('submit');
						}
				}
		});
	});
});