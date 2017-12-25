var country_arr = new Array("United States", "India", "Brazil", "German");
var s_a = new Array();
s_a[0] = "";
s_a[1] = "California|Florida|Hawaii";
s_a[2] = "Mumbai|Delhi|Assam";
s_a[3] = "Para|Bahia|Amazonas";
s_a[4] = "Berlin|Humburg|Beveria";
//focusIn() for all the elements when onFocus:
function focusIn(elementId,errorId){
	document.getElementById(elementId).style.backgroundColor = "#e6f9ff";
	document.getElementById(errorId).textContent = "";
	document.getElementById(elementId).style.border = "";
	if (elementId == "state1")
	{
	var index = document.forms["registrationForm"]["country1"].value;
	if (index == -1){
		document.getElementById(errorId).textContent = "select the country first";
		document.getElementById("error_country1").textContent = "you can't leave this empty";
		document.getElementById(elementId).style.border = "2px solid red";
		document.getElementById("country1").style.border = "2px solid red";
	}
	}
	if (elementId == "state2")
	{
	var index = document.forms["registrationForm"]["country2"].value;
	if (index == -1){
		document.getElementById(errorId).textContent = "permanent address is not mandatory, If you still want to enter it then select the country first";
		document.getElementById("error_country2").textContent = "you can't leave this empty";
		document.getElementById(elementId).style.border = "2px solid red";
		document.getElementById("country2").style.border = "2px solid red";
	}
	}
}
//function wordOut for first name, last name and city:
function wordOut(elementId,errorId){
	document.getElementById(elementId).style.backgroundColor = "";
	var word = document.forms["registrationForm"][elementId].value;
	var regword = /^[a-zA-Z]{1,30}$/;
	if ( word == "" || word == null){
		document.getElementById(errorId).textContent = "You can't leave this empty.";
		document.getElementById(elementId).style.border = "2px solid red";
		return false;
	}
	else if (!(regword.test(word))){
		document.getElementById(errorId).textContent = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters";
		document.getElementById(elementId).style.border = "2px solid red";
		return false;
	}
	else	
		return true;
}
function emailOut(){
	document.getElementById('email').style.backgroundColor = "";
	var id = document.forms["registrationForm"]["email"].value;
	var regid = /^[a-zA-Z][a-zA-Z0-9\s,'-.!@#\$%\^&\*]{1,40}$/;
	var atposition = id.indexOf("@");
	var dotposition = id.lastIndexOf(".");
	if (id == "" || id == null){
		document.getElementById('error_email').textContent = "You can't leave this empty.";
		document.getElementById('email').style.border = "2px solid red";
		return false;
	}
	if (!(regid.test(id))){
		document.getElementById('error_email').textContent = "Please use alphabets (a-z) or (A-Z) between 1 and 30 characters";
		document.getElementById('email').style.border = "2px solid red";
	}
	if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= id.length){
		document.getElementById('error_email').textContent = "It should be of the format 'abc@gamil.com'";
		document.getElementById('email').style.border = "2px solid red";
		return false;
	}
	else 
		return true;
}
function passwordOut(){
	document.getElementById('password').style.backgroundColor = "";
	var paswrd = document.forms["registrationForm"]["password"].value;
	var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,30})/;
	if (paswrd == "" || paswrd == null){
		document.getElementById('error_password').textContent = "You can't leave this empty.";
		document.getElementById('password').style.border = "2px solid red";
		return false;
	}
	else if (!(regpassword.test(paswrd))){
		document.getElementById('error_password').textContent =
		"Enter a valid password it should contain: One capital letter, One small letter, One special character, One number,and between 8 to 30 characters.";
		document.getElementById('password').style.border = "2px solid red";
		return false;
	}
	else 
		return true;
}
function c_passwordOut(){
	document.getElementById("c_password").style.backgroundColor = "";
	var paswrd = document.forms["registrationForm"]["password"].value;
	var cpaswrd = document.forms["registrationForm"]["c_password"].value;
	//var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	if (cpaswrd == "" || cpaswrd == null){
		document.getElementById('error_c_password').textContent = "You can't leave this empty.";
		document.getElementById('c_password').style.border = "2px solid red";
		return false;
	}
	else if (paswrd != cpaswrd){
		document.getElementById('error_c_password').textContent = "confirm password did not match with the password.";
		document.getElementById('c_password').style.border = "2px solid red";
		return false;
	}
	else 
		return true;
}
function contactOut(){
	var number1 = document.forms["registrationForm"]["contact"].value;
	document.getElementById("contact").style.backgroundColor = "";
	var regnum = /^[0-9]{10}$/;
	if (number1 == "" || number1 == null){
		document.getElementById("error_contact").textContent = "You can't leave this empty.";
		document.getElementById("contact").style.border = "2px solid red";
		return false;
	}
	else if(!(regnum.test(number1))){
		document.getElementById("error_contact").textContent ="Please enter only numbers(0-9) of 10 digits.";
		document.getElementById("contact").style.border = "2px solid red";
		return false;
	}
	else
		return true;
}
function alt_contactOut(){
	var number2 = document.forms["registrationForm"]["alt_contact"].value;
	var number1 = document.forms["registrationForm"]["contact"].value;
	document.getElementById("alt_contact").style.backgroundColor = "";
	var regnum = /^[0-9]{10}$/;
	if(number2 != "" && number1 == number2 ){
		document.getElementById("error_alt_contact").textContent = "alternate contact number cannot be same Please enter a different number.";
		document.getElementById("alt_contact").style.border = "2px solid red";
		return false;
	}
	else if((!(regnum.test(number2))) && number2 != ""){
		document.getElementById("error_alt_contact").textContent ="Please enter only numbers(0-9) of 10 digits.";
		document.getElementById("alt_contact").style.border = "2px solid red";
		return false;
	}
	else
		return true;
}
function countryStateOut(elementId,errorId){
	document.getElementById(elementId).style.backgroundColor = "";
	var index = document.forms["registrationForm"][elementId].value;
	if (index == -1 || index == "")
	{
		document.getElementById(errorId).textContent = "You can't leave this empty.";
		document.getElementById(elementId).style.border = "2px solid red";
		return false;
	}
	else 
		return true;
} 
function address1Out(){
	document.getElementById("address1").style.backgroundColor = "";
	var block1 = document.forms["registrationForm"]["address1"].value;
	var regblock = /^[a-zA-Z0-9\s,'-\/]*$/;
	if (block1 == "" || block1 == null){
		document.getElementById("error_address1").textContent = "Please enter the current address";
		document.getElementById("address1").style.border = "2px solid red";
		return false;
	}
	else if(!(regblock.test(block1))){
		document.getElementById("error_address1").textContent = "Please enter a valid current address name, you can use (a-z),(A-Z),(0-9)or ('-,/,\')";
		document.getElementById("address1").style.border = "2px solid red";
		return false;
	}
	else 
		return true;
}
function city2Out(){
	document.getElementById("city2").style.backgroundColor = "";
	var city = document.forms["registrationForm"]["city2"].value;
	var regcity = /^[a-zA-Z ]{1,30}$/;
	if ((!(regcity.test(city))) && (city != "")){
		document.getElementById("error_city2").textContent = "Please use only letters(a-z) or (A-Z)\nbetween 1 and 30 characters";
		document.getElementById("city2").style.border = "2px solid red";
		return false;
	}
	else	
		return true;
}
function address2Out(){
	
	document.getElementById("address2").style.backgroundColor = "";
	var block2 = document.forms["registrationForm"]["address2"].value;
	var regblock = /^[a-zA-Z0-9\s,'-\/]*$/;
	if((!(regblock.test(block2))) && (block2 != "")){
		document.getElementById("error_address2").textContent = "Please enter a valid permanent address name, you can use (a-z),(A-Z),(0-9)or ('-,/,\')";
		document.getElementById("address2").style.border = "2px solid red";
		return false;
	}
	else {
		return true;
	}
	
}
function countryState2Out(elementId){
	document.getElementById(elementId).style.backgroundColor = "";
	var country = document.getElementById("country2").value;
	var state =  document.getElementById("state2").value;
	if (country == -1 && (state == -1 || state == ""))
	{
		document.getElementById("error_country2").textContent = "";
		document.getElementById("country2").style.border = "";
		document.getElementById("error_state2").textContent = "";
		document.getElementById("state2").style.border = "";
	}
}
function captchaOut(){
	document.getElementById("answer").style.backgroundColor = "";
	var ans = document.forms["registrationForm"]["answer"].value;
	if (ans == "" || ans == null){
		document.getElementById("error_answer").textContent = "Please enter the captcha";
		document.getElementById("answer").style.border = "2px solid red";
		return false;
	}
	else
		return check();
}
function validate(){
	var city2check = document.forms["registrationForm"]["city2"].value;
	var block2check = document.forms["registrationForm"]["address2"].value;
	var captcha = document.forms["registrationForm"]["answer"].value;
	var country2index = document.forms["registrationForm"]["country2"].value;
	var state2index = document.forms["registrationForm"]["state2"].value;
	var fname = wordOut('f_name','error_f_name');
	var lname = wordOut('l_name','error_l_name');
	var email = emailOut();
	var paswrd = passwordOut();
	var cPaswrd = c_passwordOut();
	var contact = contactOut();
	var altContact = alt_contactOut();
	var country1 = countryStateOut('country1','error_country1');
	var state1 = countryStateOut('state1','error_state1');
	var city1 = wordOut('city1','error_city1');
	var address1 = address1Out();
	var city2 = city2Out();
	var address2 = address2Out();
	var captcha = captchaOut();
	
	if (country2index != -1 || (state2index != "" && state2index != -1) || city2check != "" || block2check != ""){
		countryStateOut('country2','error_country2');
		countryStateOut('state2','error_state2');
		if (block2check == "" && city2check == ""){
			document.getElementById("error_city2").textContent = "Please enter the permanent city ";
			document.getElementById("city2").style.border = "2px solid red";
			document.getElementById("error_address2").textContent = "Please enter the permanent address ";
			document.getElementById("address2").style.border = "2px solid red";
			return false;
		}
		if((block2check == "" || block2check == null) && (city2check != "" || city2check != null )){
			document.getElementById("error_address2").textContent = "Please enter the permanent address ";
			document.getElementById("address2").style.border = "2px solid red";
			return false;
		}
		if ((block2check != "" || block2check != null) && (city2check == "" || city2check == null )){
			document.getElementById("error_city2").textContent = "Please enter the permanent city ";
			document.getElementById("city2").style.border = "2px solid red";
			return false;
		}
	}
	if (country2index == -1 && (state2index == "" || state2index == -1) && city2check == "" && block2check == ""){
		document.getElementById("error_country2").textContent = "";
		document.getElementById("country2").style.border = "";
		document.getElementById("error_state2").textContent = "";
		document.getElementById("state2").style.border = "";
		document.getElementById("error_city2").textContent = "";
		document.getElementById("city2").style.border = "";
		document.getElementById("error_address2").textContent = "";
		document.getElementById("address2").style.border = "";
	}
		
	if (fname && lname && email && paswrd && cPaswrd && contact && altContact && country1 &&
	state1 && city1 && address1 && city2 && address2 && captcha )
	return true;
	else
		return false;
			
}
function check(){
	var answer = document.getElementById("answer").value;
	var oper = document.getElementById("operator").innerHTML;
	var num1 = parseInt(document.getElementById("digit1").innerHTML);
	var num2 = parseInt(document.getElementById("digit2").innerHTML);
	var res;
	switch (oper){
		case '+': res = num1 + num2; break;
		case '-': res = num1 - num2; break;
		case '*': res = num1 * num2; break;
		case '/': res = num1 / num2; break;
		default: break;
	}
	if (answer != res){
		alert("Your calculation is wrong.");
		document.getElementById("answer").value = "";
		rand();
		return false;
		}
	else
		return true;
}
function rand (){
	var rnum1 = Math.floor(Math.random() * 10) + 1;
	var rnum2 = Math.floor(Math.random() * 10) + 1;
	var ops = ['+','-','*','/'];
	var opindex = Math.floor(Math.random()*4);
	if (opindex == 3)
	rnum1 = rnum1 * rnum2;
	var operator = ops[opindex];
	document.getElementById("digit1").innerHTML = rnum1;
	document.getElementById("digit2").innerHTML = rnum2;
	document.getElementById("operator").innerHTML = operator;
}
function populateStates(countryElementId, stateElementId) {
	var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;
    var stateElement = document.getElementById(stateElementId);
    stateElement.length = 0; 
    stateElement.options[0] = new Option('Select State', '-1');
    stateElement.selectedIndex = 0;
    var state_arr = s_a[selectedCountryIndex].split("|");
    for (var i = 0; i < state_arr.length; i++) {
        stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
    }
}
function populateCountries(countryElementId, stateElementId) {
    // given the id of the <select> tag as function argument, it inserts <option> tags
    var countryElement = document.getElementById(countryElementId);
    countryElement.length = 0;
    countryElement.options[0] = new Option('Select Country', '-1');
    countryElement.selectedIndex = 0;
    for (var i = 0; i < country_arr.length; i++) {
        countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
    }
    if (stateElementId) {
        countryElement.onchange = function () {
            populateStates(countryElementId, stateElementId);
        };
    }
}
