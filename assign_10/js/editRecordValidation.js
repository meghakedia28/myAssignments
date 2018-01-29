$(document).ready(function(){
	$("#questions").DataTable({
	 "bLengthChange": false
	});
	$("#submitEditForm").click(function(event){
		event.preventDefault();
		 var question = validate('#question');
		 var optiona = validate('#optiona');
		 var optionb = validate('#optionb');
		 var optionc = validate('#optionc');
		 var optiond = validate('#optiond');
		 var answer = validate('#answer');
		 if(question && optiona && optionb && optionc && optiond && answer) {
			$.ajax({
					url : "../components/editDeleteQuestionsService.cfc?method=updateQuestion&" + $("#editForm").serialize(),
					data : {},
					success : function(result) {
						var obj = $.parseJSON(result);
						if (obj.ERRORID != null || obj.ERRORID != '' ){
							for (keys in obj.ERRORID){
								var id = '#'+(keys.toLowerCase());
								$(id).text(obj.ERRORID[keys]);
							}
						}
						else{
							$('#questions').load(document.URL + ' #questions');
							$(".error-msg").text("");
						}
					}
				});
			return true;
		 }
		 else{
			return false;
		 }
	});
	$("#confirmDelete").click(function(event){
		event.preventDefault();
		var QustnId = $('#confirmDelete').val();
		$.ajax({
				url : "../components/editDeleteQuestionsService.cfc?method=deleteRecord",
				data : {
					Id : QustnId
				},
				success : function(result) {
					if (result){
						$('#questions').load(document.URL + ' #questions');
					}
						else {
							alert('data has not be deleted, please try agin later.');
						}
				}
			});
	});
//	$("input,select,textarea").focus(function(){
//		$(this).css("border","");
//		$(this).next('.error-msg').text("");
//	});
//	$("input,select,textarea").focusout(function(){
//		validate(this);
//	});
});
function validate(elementId){
	var value = $(elementId).val();
		if (value == "" || value == null ){
			$(elementId).css("border","2px solid red");
			$(elementId).next('.error-msg').text("You can't leave this empty.");
			return false;
		}
		else if (value.length < 3 || value.length > 50) {
			$(elementId).css("border","2px solid red");
			$(elementId).next('.error-msg').text("Please enter characters of length between 3 to 50.");
			return false;
		}
		return true;
}