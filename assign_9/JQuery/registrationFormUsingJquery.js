 var statesOfDifferentCountries=[{CountryName:'United States',StateName:['California','Florida','Hawaii']},
											{CountryName:'India',StateName:['Mumbai','Delhi','Assam']},
											{CountryName:'Brazil',StateName:['Para','Bahia','Amazonas']},
											{CountryName:'German',StateName:['Berlin','Humburg','Beveria']}
											];
var res = 0;
 $(document).ready(function(){
	$("input").focus(function(){
        $(this).css("background-color", "#e6f9ff");
		$(this).css("border","");
		$(this).next('.error-msg').text("");
    });
	$("select").focus(function(){
        $(this).css("background-color", "#e6f9ff");
		$(this).css("border","");
		$(this).next('.error-msg').text("");
    });
	/*rand();*/
    $("input").blur(function(){
        $(this).css("background-color", "");
    });
	$("select").blur(function(){
        $(this).css("background-color", "");
    });
	$("#f_name").focusout(function(){
		wordCheck('#f_name','#error_f_name');
	});
	$("#l_name").focusout(function(){
		wordCheck('#l_name','#error_l_name');
	});
	$("#email").focusout(function(){
		emailOut('#email','#error_email');
	});
	$("#password").focusout(function(){
		passwordOut('#password','#error_password');
	});
	$("#c_password").focusout(function(){
		c_passwordOut('#c_password','#error_c_password');
	});
	$("#contact").focusout(function(){
		contactOut('#contact','#error_contact');
	});
	$("#alt_contact").focusout(function(){
		alt_contactOut('#contact','#error_alt_contact');
	});
	$("#currentCountry").focusout(function(){
		countryStateOut('#currentCountry','#error_currentCountry');
	});
	$("#currentCountry").on('change',function(){
		stateDropdown(this, 'currentState');
	});
	$("#currentState").focus(function(){
		var ind = $("#currentCountry").val();
		if (ind == ""){
			$("#error_currentState").text("Select the current country first.");
			$("#error_currentCountry").text("You can't leave this empty");
			$("#currentState").css("border","2px solid red");
			$("#currentCountry").css("border","2px solid red");
		}

	});
	/*$("#permanentState").focus(function(){
		var ind = $("#permanentCountry").val();
		if (ind == ""){
			$("#error_permanentState").text("Permanent address is not mandatory, If you still want to enter it then select the country first");
			$("#error_permanentCountry").text("You can't leave this empty");
			$("#permanentState").css("border","2px solid red");
			$("#permanentCountry").css("border","2px solid red");
		}
	});*/
	$("#currentState").focusout(function(){
		countryStateOut('#currentState','#error_currentState');
	});
	$("#currentCity").focusout(function(){
		currentCityOut();
	});
	$("#currentAddress").focusout(function(){
		currentAddressOut();
	});
	/*$("#permanentCountry").on('change',function(){
		stateDropdown(this, 'permanentState');
	});
	$("#permanentState").focusout(function(){
		permanentStateOut();
	});
	$("#permanentCity").focusout(function(){
		permanentCityOut();
	});
	$("#permanentAddress").focusout(function(){
		permanentAddressOut();
	});
	$("#answer").focusout(function(){
		captchaOut();
	});*/
	$("#refresh").click(function(){
		rand();
	});
});
function wordCheck(elementId,errorId){
	$(elementId).css("backgroundColor","");
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
function emailOut(){
	$("#email").css("backgroundColor","");
	var id = $("#email").val();
	var regid = /^[a-zA-Z][a-zA-Z0-9\s,'-.!@#\$%\^&\*]{1,40}$/;
	var atposition = id.indexOf("@");
	var dotposition = id.lastIndexOf(".");
	if (id == "" || id == null){
		$("#error_email").text("You can't leave this empty.");
		$("#email").css("border","2px solid red");
		return false;
	}
	if (!(regid.test(id))){
		$("#error_email").text("Please use alphabets (a-z) or (A-Z) between 1 and 30 characters");
		$("#email").css("border","2px solid red");
	}
	if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= id.length){
		$("#error_email").text("It should be of the format 'abc@gamil.com'");
		$("#email").css("border","2px solid red");
		return false;
	}
	else 
		return true;
}
function passwordOut(){
	$("#password").css("backgroundColor","");
	var paswrd = $("#password").val();
	var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,30})/;
	if (paswrd == "" || paswrd == null){
		$("#error_password").text("You can't leave this empty.");
		$("#password").css("border","2px solid red");
		return false;
	}
	else if (!(regpassword.test(paswrd))){
		$("#error_password").html("<p>Enter a valid password it should contain:<br>One capital letter,<br>One small letter,<br>One special character,<br>One number,and<br>between 8 to 30 characters.<p>");
		$("#password").css("border","2px solid red");
		return false;
	}
	else 
		return true;
}
function c_passwordOut(){
	$("#c_password").css("backgroundColor","");
	var paswrd = $("#password").val();
	var cpaswrd = $("#c_password").val();
	//var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	if (cpaswrd == "" || cpaswrd == null){
		$("#error_c_password").text("You can't leave this empty.");
		$("#c_password").css("border","2px solid red");
		return false;
	}
	else if (paswrd != cpaswrd){
		$("#error_c_password").text("Confirm password did not match with the password.");
		$("#c_password").css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function contactOut(){
	var number1 = $("#contact").val();
	$("#contact").css("backgroundColor","");
	var regnum = /^[0-9]{10}$/;
	if (number1 == "" || number1 == null){
		$("#error_contact").text("You can't leave this empty.");
		$("#contact").css("border","2px solid red");
		return false;
	}
	else if(!(regnum.test(number1))){
		$("#error_contact").text("Please enter only numbers(0-9) of 10 digits.");
		$("#contact").css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function alt_contactOut(){
	var number2 = $("#alt_contact").val();
	var number1 = $("#contact").val();
	$("#alt_contact").css("backgroundColor","");
	var regnum = /^[0-9]{10}$/;
	if(number2 != "" && number1 == number2 ){
		$("#error_alt_contact").text("Alternate contact number cannot be same, Please enter a different number.");
		$("#alt_contact").css("border","2px solid red");
		return false;
	}
	else if((!(regnum.test(number2))) && number2 != ""){
		$("#error_alt_contact").text("Please enter only numbers(0-9) of 10 digits.");
		$("#alt_contact").css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function countryStateOut(elementId,errorId){
	$(elementId).css("backgroundColor","");
	var ind = $(elementId).val();
	if (ind == -1 || ind == "" || ind == "Select State")
	{
		$(errorId).text("You can't leave this empty.");
		$(elementId).css("border","2px solid red");
		return false;
	}
	else 
		return true;
} 
function stateDropdown(countryElement,stateId){
				var selectedCountry= $(countryElement).val();
				for(var i = 0; i < statesOfDifferentCountries.length; i++){
					if (selectedCountry == statesOfDifferentCountries[i]['CountryName']){
						$("#" + stateId).html('');
						$("#" + stateId).append($("<option></option>").html("Select State"));
						$.each(statesOfDifferentCountries[i]['StateName'], function (key, value) {  
							$("#" + stateId).append($("<option></option>").html(value));					
						});						 
					}
				}
			}
function currentAddressOut(){
	$("#currentAddress").css("backgroundColor","");
	var block1 = $("#currentAddress").val();
	var regblock = /^[a-zA-Z0-9\s,'-\/]*$/;
	if (block1 == "" || block1 == null){
		$("#error_currentAddress").text("Please enter the current address.");
		$("#currentAddress").css("border","2px solid red");
		return false;
	}
	else if(!(regblock.test(block1))){
		$("#error_currentAddress").text("Please enter a valid current address name, you can use (a-z),(A-Z),(0-9)or ('-,/,\').");
		$("#currentAddress").css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function currentCityOut(){
	$("#currentCity").css("backgroundColor","");
	var city = $("#currentCity").val();
	var regcity = /^[a-zA-Z ]{1,30}$/;
	if (((city) == "") || ((city) == null)){
		$("#error_currentCity").text("You can't leave this empty ");
		$("#currentCity").css("border","2px solid red");
	}
	else if ((!(regcity.test(city))) && (city != "")){
		$("#error_currentCity").text("Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.");
		$("#currentCity").css("border","2px solid red");
		return false;
	}
	else
		return true;
}
/*function permanentStateOut(){
	var countryindex = $("#permanentCountry").val();
	var stateindex = $("#permanentState").val();
	if (countryindex == ""  && (stateindex == "" || stateindex == "Select State" ))
	{
		$("#error_permanentCountry").text("");
		$("#permanentCountry").css("border","");
		$("#error_permanentState").text("");
		$("#permanentState").css("border","");
	}
}
function permanentCityOut(){
	$("#permanentCity").css("backgroundColor","");
	var city = $("#permanentCity").val();
	var regcity = /^[a-zA-Z ]{1,30}$/;
	if ((!(regcity.test(city))) && (city != "")){
		$("#error_permanentCity").text("Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters.");
		$("#permanentCity").css("border","2px solid red");
		return false;
	}
	else
		return true;
}
function permanentAddressOut(){	
	$("#permanentAddress").css("backgroundColor","");
	var block2 = $("#permanentAddress").val();
	var regblock = /^[a-zA-Z0-9\s,'-\/]*$/;
	if((!(regblock.test(block2))) && (block2 != "")){
		$("#error_permanentAddress").text("Please enter a valid permanent address name, you can use (a-z),(A-Z),(0-9)or ('-,/,\').");
		$("#permanentAddress").css("border","2px solid red");
		return false;
	}
	else
		return true;	
}*/
function countrypermanentStateOut(elementId){
	$(elementId).css("backgroundColor","");
}
/*function captchaOut(){
	$("#answer").css("backgroundColor","");
	var ans = $("#answer").val();
	if (ans == "" || ans == null){
		$("#error_answer").text("Please enter the captcha.");
		$("#answer").css("border","2px solid red");
		return false;
	}
	else
		return check();
}*/
function validate(){
	var fname = wordCheck('#f_name','#error_f_name');
	var lname = wordCheck('#l_name','#error_l_name');
	var email = emailOut();
	var paswrd = passwordOut();
	var cPaswrd = c_passwordOut();
	var contact = contactOut();
	var altContact = alt_contactOut();
	var currentCountry = countryStateOut('#currentCountry','#error_currentCountry');
	var currentState = countryStateOut('#currentState','#error_currentState');
	var currentCity = currentCityOut();
	var currentAddress = currentAddressOut();
	/*var permanentCity = permanentCityOut();
	var permanentAddress = permanentAddressOut();
	var captcha = captchaOut();*/
	/*var permanentCitycheck = $("#permanentCity").val();
	var block2check = $("#permanentAddress").val();*/
	/*var permanentCountryindex = $("#permanentCountry").val();
	var permanentStateindex = $("#permanentState").val();
	if (permanentCountryindex != "" || (permanentStateindex != "" && permanentStateindex != "Select State") || permanentCitycheck != "" || block2check != ""){
		countryStateOut('#permanentCountry','#error_permanentCountry');
		countryStateOut('#permanentState','#error_permanentState');
		if (block2check == "" && permanentCitycheck == ""){
			$("#error_permanentCity").text("Please enter the permanent city.");
			$("#permanentCity").css("border","2px solid red");
			$("#error_permanentAddress").text("Please enter the permanent address.");
			$("#permanentAddress").css("border","2px solid red");
			swal("You created an error.","","error");
			return false;
		}
		if((block2check == "" || block2check == null) && (permanentCitycheck != "" || permanentCitycheck != null )){
			$("#error_permanentAddress").text("Please enter the permanent address ");
			$("#permanentAddress").css("border","2px solid red");
			swal("You created an error.","","error");
			return false;
		}
		if ((block2check != "" || block2check != null) && (permanentCitycheck == "" || permanentCitycheck == null )){
			$("#error_permanentCity").text("Please enter the permanent city ");
			$("#permanentCity").css("border","2px solid red");
			swal("You created an error.","","error");
			return false;
		}
	}
	if (permanentCountryindex == "" && (permanentStateindex == "" || permanentStateindex == "Select State") && permanentCitycheck == "" && block2check == ""){
		$("#error_permanentCountry").text("");
		$("#permanentCountry").css("border","");
		$("#error_permanentState").text("");
		$("#permanentState").css("border","");
		$("#error_permanentCity").text("");
		$("#permanentCity").css("border","");
		$("#error_permanentAddress").text("");
		$("#permanentAddress").css("border","");
	}
		*/
	if (fname && lname && email && paswrd && cPaswrd && contact && altContact && currentCountry &&
	currentState && currentCity && currentAddress){
	return true;
	}
	else{
		swal("You created an error","","error");
		return false;
	}	
}

/*function check(){
	var ans = $("#answer").val();
	var res = $("#captchaAnswer").val();
	if (ans != res){
		$("#error_answer").text("Your calculation is wrong.");
		$("#answer").val("");
		return false;
		}
	else{
		$("#error_answer").text("");
		return true;
	}
}
function rand (){
	var rnum1 = Math.floor(Math.random() * 10) + 1;
	var rnum2 = Math.floor(Math.random() * 10) + 1;
	var ops = ['+','-','*','/'];
	var opindex = Math.floor(Math.random()*4);
	if (opindex == 3)
	rnum1 = rnum1 * rnum2;
	$("#digit1").text(rnum1);
	$("#digit2").text(rnum2);
	$("#operator").text(ops[opindex]);
	switch (ops[opindex]){
		case '+': res = rnum1 + rnum2; break;
		case '-': res = rnum1 - rnum2; break;
		case '*': res = rnum1 * rnum2; break;
		case '/': res = rnum1 / rnum2; break;
		default: break;
	}
}*/
