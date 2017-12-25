<!DOCTYPE html>
<html>
	<head>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Registration Page</title>
		<link rel="stylesheet" href="css/registrationFormUsingJQuery.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript" src="JQuery/registrationFormUsingJquery.js"></script>
		
	</head>
	<body>
		<div class="outter-div">
			<div class="inner-div"><h1>Sign up:</h1></div><br>			
			<div class="inner-div div-form">
				<!--form-->
				<cfform name="form" action="registrationFormValidation.cfm" method="post" preservedata="true">
					<span class="star-info">The fields with <label class="star">*</label>are mandatory</span><br><br>
					<!--first name-->					
					<div><label class="in gein margin-10" for="f_name">First name:<label class="star">*</label></label>
                    <cfinput class="box-style" type="text" id="f_name" name="f_name" placeholder="First name" size="30">
					<div class="error-msg" id="error_f_name"><span>
					<cfif StructKeyExists(session.structOfError.struct2,"ERROR_F_NAME") >
								<cfoutput >#session.structOfError.struct2.ERROR_F_NAME#</cfoutput></cfif>
					</span></div>				
					</div>
					<!--last name-->					
					<div><label class="in gein margin-10" for="l_name">Last name:<label class="star">*</label></label>
                    <cfinput class="box-style" type="text" id="l_name" name="l_name" placeholder="Last name" size="30">					
					<div class="error-msg" id="error_l_name"><span>
					<cfif StructKeyExists(session.structOfError.struct2,"ERROR_L_NAME") >
								<cfoutput >#session.structOfError.struct2.ERROR_L_NAME#</cfoutput></cfif></span></div>
					</div>
					<!--email-->					
					<div><label class="in gein margin-10" for="email">E-mail:<label class="star">*</label></label>
                    <cfinput class="box-style" type="text" id="email" name="email" placeholder="abc@gmail.com" size="40">						
					<div class="error-msg" id="error_email"><span>
						<cfif StructKeyExists(session.structOfError.struct2,"ERROR_EMAIL") >
								<cfoutput >#session.structOfError.struct2.ERROR_EMAIL#</cfoutput></cfif>
						</span></div>
					</div>
					<!--password--->					
					<div><label class="in gein margin-10" for="password">Password:<label class="star">*</label></label>
                    <cfinput class="box-style" type="password" id="password" name="password" placeholder="Password" size="30">						
					<div class="error-msg" id="error_password"><span>
						<cfif StructKeyExists(session.structOfError.struct2,"ERROR_PASSWORD") >
								<cfoutput >#session.structOfError.struct2.ERROR_PASSWORD#</cfoutput></cfif></span></div>
					</div>
					<div>
					<label class="in gein margin-10" for="c_password">Confirm Password:<label class="star">*</label></label>
                    <cfinput class="box-style" type="password" id="c_password" name="c_password" placeholder="Re-type password" size="30"  >
					<div class="error-msg" id="error_c_password"><span>
						<cfif StructKeyExists(session.structOfError.struct2,"ERROR_C_PASSWORD") >
								<cfoutput >#session.structOfError.struct2.ERROR_C_PASSWORD#</cfoutput></cfif></span></div>
					</div>						
					<!--gender-->					
					<div><label class="gen gein margin-10" for="gender" >
						Gender:<label class="star">*</label>
					</label>					
					<label>
                        <cfinput class="margin-10" type="radio" id="female" name="gender" value="Female" checked>
                        <label for="female" >Female</label>                                            
                        <cfinput class="margin-10" type="radio" id="male" name="gender" value="Male">
                        <label for="male">Male</label>                    
                        <cfinput class="margin-10" type="radio" id="others" name="gender" value="Others">
                        <label for="others">Others</label>
                    </label>
					</div>
					<!-- phone number-->					
					<div><label class="in gein margin-10" for="contact">Contact Number:<label class="star">*</label></label>
                    <cfinput class="box-style" type="text" id="contact" name="contact" placeholder="Contact Number" maxlength="10" size="10">
					<div class="error-msg" id="error_contact"><span>
						<cfif StructKeyExists(session.structOfError.struct2,"ERROR_CONTACT") >
							<cfoutput >#session.structOfError.struct2.ERROR_CONTACT#</cfoutput></cfif></span></div>
					</div>
					<div>
						 <cfif StructKeyExists(session.structOfError.struct1,'ALT_CONTACT') >
							<cfset alt_contact = #session.structOfError.struct1.ALT_CONTACT#>
							<cfelse><cfset alt_contact = ''></cfif>
					<label class="in gein margin-10" for="alt_contact">Alternate Contact Number:</label>
                    <cfinput class="box-style" type="text" id="alt_contact" name="alt_contact" placeholder="Alternate Contact Number" maxlength="10" size="10"
							 value="#alt_contact#">
					<div class="error-msg" id="error_alt_contact"><span>
						<cfif StructKeyExists(session.structOfError.struct2,"ERROR_ALT_CONTACT") >
							<cfoutput >#session.structOfError.struct2.ERROR_ALT_CONTACT#</cfoutput></cfif></span></div>
						
					</div>
					<!---current country--->							
					<label class="in gein margin-10 pc-add" for="current address">Current address:<label class="star">*</label></label>					
					<br>
					<label class="in gein margin-10" for="currentCountry">Country:<label class="star">*</label></label>						
					<cfselect class="box-style" name="currentCountry" id="currentCountry" required = "true">
						<option value="">Select Country</option>
												<option value="United States">United States</option>
												<option value="India">India</option>
												<option value="Brazil">Brazil</option>
												<option value="German">German</option>
					</cfselect>
					<div class="error-msg" id="error_currentCountry"><span>
						<cfif StructKeyExists(session.structOfError.struct2,"ERROR_CURRENTCOUNTRY") >
							<cfoutput >#session.structOfError.struct2.ERROR_CURRENTCOUNTRY#</cfoutput></cfif></span></div>
					<!---current state--->
					<label class="in gein margin-10" for="currentState">State:<label class="star">*</label></label>					
					<cfselect class="box-style" name="currentState" id="currentState" required = "true">
						<option value="">Select State</option>
					</cfselect>	
					<div class="error-msg" id="error_currentState"><span><cfif StructKeyExists(session.structOfError.struct2,"ERROR_CURRENTSTATE") >
								<cfoutput >#session.structOfError.struct2.ERROR_CURRENTSTATE#</cfoutput></cfif></span></div>
					<!----current City--->
					<label class="in gein margin-10" for="currentCity">City:<label class="star">*</label></label>
					<cfinput class="box-style" name="currentCity" id="currentCity" placeholder="City" required = "true" >						
					<div class="error-msg" id="error_currentCity"><span><cfif StructKeyExists(session.structOfError.struct2,"ERROR_CURRENTCITY") >
							<cfoutput >#session.structOfError.struct2.ERROR_CURRENTCITY#</cfoutput></cfif></span></div>
					<!---current Address---->
					<label class="in gein margin-10" for="currentAddress">Address 1:<label class="star">*</label></label>
					<cfinput class="box-style" type="textarea" id="currentAddress" name="currentAddress" placeholder="Street/Block, House no.">					
					<div class="error-msg" id="error_currentAddress"><span><cfif StructKeyExists(session.structOfError.struct2,"ERROR_CURRENTADDRESS") >
							<cfoutput >#session.structOfError.struct2.ERROR_CURRENTADDRESS#</cfoutput></cfif></span></div>
					<label class="news margin-10" for="news" ><span>Subscribe Newsletter?</span></label>					
					<label>
                        <cfinput type="radio" name="news" value="Yes" checked>
                        <span>Yes</span>                    
                        <cfinput type="radio" name="news" value="No">
                        <span>No</span>
                    </label><br><br>					
					Calculate the captcha and enter your answer:<br><br>
					<cfset captcha = application.utility.generateCaptcha()/>
					<cfimage action="captcha" text="#captcha#" height="50" width="250" difficulty="medium" fonts="Verdana">
					<input type="hidden" name="captchaAnswer" id="captchaAnswer" value="<cfoutput>#captcha#</cfoutput>"> 
					<div>
					<cfinput class="answer" type="text" id="answer" name="answer"></div>
					<div class="error-msg-captcha" id="error_answer"><span><cfif StructKeyExists(session.structOfError.struct2,"ERROR_ANSWER") >
							<cfoutput >#session.structOfError.struct2.ERROR_ANSWER#</cfoutput></cfif></span></div>
					<button class="button" id="submit" name= "submit" type= "submit" onclick="return validate()">Submit</button>					
				</cfform>
			</div>
		</div>
	</body>
</html>
