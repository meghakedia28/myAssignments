function validate(){
	var fname = document.forms["form"]["f_name"].value;
	var lname = document.forms["form"]["l_name"].value;
	var email = document.forms["form"]["email"].value;
	var password = document.forms["form"]["password"].value;
	var cpassword = document.forms["form"]["c_password"].value;
	var number1 = document.forms["form"]["1_contact"].value;
	var number2 = document.forms["form"]["2_contact"].value;
	var regname = /[a-zA-z]/;
	var atposition = email.indexOf("@");
	var dotposition = email.lastIndexOf(".");
	var regpassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/
	var regnum = /^\(?\d{3}\)?-?\s*-?\d{4}$/;
	if (fname == "" || fname == null)
	{
		alert("Enter the first name");
		return false;
	}
	else if (!(regname.test(fname)))
	{
		alert("Enter a valid first name");
		return false;
	}
	
	if (lname == "" || lname == null)
	{
		alert("Enter the last name");
		return false;
	}
	else if (!(regname.test(lname)))
	{
		alert("Enter a valid last name");
		return false;
	}
	debugger;
	if (email == "" || email == null)
	{
		alert("Enter the email Id");
		return false;
	}
	else if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= email.length)
	{
		alert("Please enter a valid e-mail address");
		return false;
	}
	if (password == "" || password == null)
	{
		alert("Enter the password");
		return false;
	}
	else if (!(regpassword.test(password)))
	{
		alert("Enter a valid password");
		return false;
	}
	if (cpassword == "" || cpassword == null)
	{
		alert("Enter the password");
		return false;
	}
	else if (password != cpassword)
	{
		alert("confirm password did not match with the password");
		document.getElementById("cpassword").style.border("2px solid red");
		return false;
	}
	if (number1 == "" || number1 == null){
		alert("Please enter the phone number");
		return false;
	}
	else if(!(regnum.test(number1)))
	{
		alert("Not a valid phone number");
		return false;
	}
	if (number2 == "" || number2 == null){
		alert("Please enter the phone number");
		return false;
	}
	else if(!(regnum.test(number2)))
	{
		alert("Not a valid phone number");
		return false;
	}
	else if(number1 == number2)
	{
		alert("alternate contact number cannot be same");
		return false;
	}
}
function rand (){
	var rnum1 = Math.floor(Math.random() * 10) + 1;
	document.getElementById("1_digit").innerHTML = rnum1;
	var rnum2 = Math.floor(Math.random() * 10) + 1;
	document.getElementById("2_digit").innerHTML = rnum2;
	var ops = ['+','-','*','/'];
	var opindex = Math.floor(Math.random()*4);
	var operator = ops[opindex];
	document.getElementById("operator").innerHTML = operator;
}
function check()
{
	var answer = document.getElementById("answer").value;
	var oper = document.getElementById("operator").innerHTML;
	var num1 = parseInt(document.getElementById("1_digit").innerHTML);
	var num2 = parseInt(document.getElementById("2_digit").innerHTML);
	var res;
	switch (oper){
		case '+': res = num1 + num2; break;
		case '-': res = num1 - num2; break;
		case '*': res = num1 * num2; break;
		case '/': res = num1 / num2; break;
		default: break;
	}
	if (answer == "" || answer == null)
		alert("Please calculate the captcha and enter the answer");
	else if (answer != res)
		alert("Your calculation is wrong");
	else{
		document.getElementById("status").innerHTML="correct";
		document.getElementById("answer").value = "";
	}
}
function countryCode()
    {
         var name = document.getElementById("1_country").value; // getting country selected value
    document.getElementById("1_state").options.length = 0; 
    
         switch (name) //check country
         {
             case "India":// output of states
    
                     document.getElementById("1_state").options[0] = new Option("--select--", "");
                     document.getElementById("1_state").options[1] = new Option("Mumbai", "Mumbai");
                     document.getElementById("1_state").options[2] = new Option("Delhi", "Delhi");
                     document.getElementById("1_state").options[3] = new Option("Assam", "Assam");
                     break;
			case "United States":// output of states
    
                     document.getElementById("1_state").options[0] = new Option("--select--", "");
                     document.getElementById("1_state").options[1] = new Option("California", "California");
                     document.getElementById("1_state").options[2] = new Option("Florida", "Florida");
                     document.getElementById("1_state").options[3] = new Option("Hawaii", "Hawaii");
                     break;
			case "Brazil":// output of states
    
                     document.getElementById("1_state").options[0] = new Option("--select--", "");
                     document.getElementById("1_state").options[1] = new Option("Para", "Para");
                     document.getElementById("1_state").options[2] = new Option("Bahia", "Bahia");
                     document.getElementById("1_state").options[3] = new Option("Amazonas", "Amazonas");
                     break;
			case "Germany":// output of states
    
                     document.getElementById("1_state").options[0] = new Option("--select--", "");
                     document.getElementById("1_state").options[1] = new Option("Berlin", "Berlin");
                     document.getElementById("1_state").options[2] = new Option("Humburg", "Humburg");
                     document.getElementById("1_state").options[3] = new Option("Beveria", "Beveria");
                     break;
			default: break;
         }

    }