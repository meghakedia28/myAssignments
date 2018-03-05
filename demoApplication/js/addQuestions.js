$(document).ready(function(){
	$("#questionsForm").submit(function(event){
		 event.preventDefault();
		 var checkQuestion = validate('#question');
		 var checkOptiona = validate('#optiona');
		 var checkOptionb = validate('#optionb');
		 var checkOptionc = validate('#optionc');
		 var checkOptiond = validate('#optiond');
		 var checkAnswer = validate('#answer');
		 var optiona = $('#optiona').val();
		 var optionb = $('#optionb').val();
		 var optionc = $('#optionc').val();
		 var optiond = $('#optiond').val();
		 var unique = false;
		 if ( optiona != "" && optionb != "" && optionc != "" && optiond != ""){
				unique = checkUnique(optiona, optionb, optionc, optiond);
			}
		 if(checkQuestion && checkOptiona && checkOptionb && checkOptionc && checkOptiond && checkAnswer && unique) {
			 $.ajax ({
			 	url : "../components/enterQuestions.cfc?method=validateAllFields&"+$("#questionsForm").serialize(),
				data : {},
					success: function(result){
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
			 });
		 }
	});
	$("input,select,textarea").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("input,select,textarea").focusout(function(){
		validate(this);
	});
});