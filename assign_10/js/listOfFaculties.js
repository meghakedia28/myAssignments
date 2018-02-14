var table;
$(document).ready(function() {
	 $.noConflict();
	var userid = $('#id').val() ;
		 table = $('#listOfFaculties').DataTable({
            "processing": true,
       		"serverSide": true,
    		"ajax": {
    			"url" : "../components/listOfFacultiesService.cfc?method=getFacultyList",
    			"data" :{}
    		},
    		  "columnDefs": [
    		              { "DATA": "active",
    		            	  render: function (DATA) {
    		            		  if (DATA){
    		            			  return "Yes"
    		            		  }
    		            		  else{
    		            			  return "No"
    		            		  }    		            			  
    		            	  },},
    		          ],
    		          dom: 'Bfrtip',
    		          buttons: [
								{
								    extend: 'csvHtml5',
								    exportOptions: {
								    columns: [ 0, 1, 2, 3, 4 ]
								   }
								},
							   {
								    extend: 'pdfHtml5',
								    exportOptions: {
								    columns: [ 0, 1, 2, 3, 4 ]
								  }
							   }
							]
				});
		console.log(table);
});
$(document).on('click','#edit', function(e){
	e.preventDefault();
	var userId = $(this).data('id');
	$.ajax({
		url : "../components/listOfFacultiesService.cfc?method=populateData",
		data : {id : userId},
		datatype: "html",
	}).done(openEditModel);
});

function openEditModel(html){
	$('#editModal').html('');
	$('#editModal').html(html);
	validate ('#editModal');
}
function validate(ref){
	$("#submitEditForm").click(function(){
		event.preventDefault();
		var valid = validateAll();
		if(valid){
			submitForm();
		}
	});
	$("input").focus(function(){
		$(this).css("border","");
		$(this).next('.error-msg').text("");
	});
	$("#firstName, #lastName").focusout(function(){
		wordCheck(this,$(this).next('.error-msg'));
	});
	$("#contactNumber").focusout(function(){
		numberCheck('#contactNumber','#error_contactnumber');
	});
	$("#subject").focusout(function(){
		subjectCheck('#subject','#error_subject');
	});
}
function submitForm(){
	event.preventDefault();
		$.ajax({
			url : "../components/addValidation.cfc?method=updateUserInformation&"+$("form").serialize(),
			data : {},
				success : function(result){
					var obj = $.parseJSON(result);
					if (obj.SUCCESSFULL != null){						
						if(obj.SUCCESSFULL == true){
							$(".error-msg").text("");
							$('.close').click(); 
							table.ajax.reload();
						}
					}
					if (obj.ERRORID != null){
						for (keys in obj.ERRORID){
							var id = '#'+(keys.toLowerCase());
							$(id).text(obj.ERRORID[keys]);
						}
					}
				}
		}) ;
}
function wordCheck(elementId,errorId){
	var word = $(elementId).val();
	var regword = /^[a-zA-Z]{1,30}$/;
	if ( word == "" || word == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else if (!(regword.test(word))){
		$(errorId).text("Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function numberCheck(elementId,errorId){
	var number1 = $(elementId).val();
	$(elementId).css("backgroundColor","");
	var regnum = /^[0-9]{10}$/;
	if (number1 == "" || number1 == null){
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else if(!(regnum.test(number1))){
		$(errorId).text("Please enter only numbers(0-9) of 10 digits.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function subjectCheck(elementId,errorId){
	var subjectVal = $(elementId).val();
	var validate = wordCheck(elementId,errorId);
	if (validate){
		$.ajax({
			url : "../components/addValidation.cfc?method=validateSubject",
			data : {
				name : subjectVal
			},
			success: function(result) {
				var obj = $.parseJSON(result);
				if (obj.STATUS == "success"){
					return true;
				}
					else {
						$(errorId).text(obj.MESSAGE);
						return false;
					}
			}
		});
	}	
}
function validateAll(){
	var firstName = wordCheck('#firstName','#error_firstname');
	var lastName = wordCheck('#lastName','#error_lastname');
	var phoneNumber = numberCheck('#contactNumber','#error_contactnumber');
	if ($('#subject').length != 0){
		var sub = wordCheck('#subject','#error_subject');
	}
	if (firstName && lastName && phoneNumber){
		if ($('#subject').length != 0){
			if (sub)
				return true;
			else
				return false;
		}
		else{
			return true;
		}
	}
	else
		return false;
}