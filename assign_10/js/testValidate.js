$(document).ready(function(){
	$("#startTest").click(function(event) {
		$.ajax({
			url : "../components/testValidationService.cfc?method=checkTestTime",
			data : {},
				success : function(result){
					var obj = $.parseJSON(result);
						if(obj == true){
							$('#questionsForm').submit();
						}
				}
		});
	});
});