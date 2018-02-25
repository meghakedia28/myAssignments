﻿<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 1>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:adminFront>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<div class="page-title">
			<div class="container">
				<h2>Add faculties</h2>
			</div>
		</div>
	</header>
</div>
	<script type="text/javascript" src="../js/userValidation.js"></script>
	<script type="text/javascript" src="../js/wordEmailNumberValidation.js"></script>
	<main class="main-content">
		<div class="container">
			<div class="mid-row">
				<div class="col-md-8">
					<div class="boxed-section request-form">
						<h2 class="section-title text-center">Faculty's information:</h2>
							<cfform name="form" id="form" action="">
								<div class="field">
									<label for="firstName">First Name:</label>
									<div class="control">
										<cfinput type="text" id="firstName" name="firstName" placeholder="Enter the first name" >
									<div class="error-msg" id="error_firstname" name="error_firstname"></div></div>
								</div>
								<div class="field">
									<label for="lastName">Last Name:</label>
									<div class="control">
										<cfinput type="text" id="lastName" name="lastName" placeholder="Enter the last name" >
									<div class="error-msg" id="error_lastname" name="error_lastname"></div></div>
								</div>
								<div class="field">
									<label for="email">Email Address:</label>
									<div class="control">
										<cfinput type="text" id="email" name="email" placeholder="example@mail.com">
									<div class="error-msg" id="error_email" name="error_email"></div></div>
								</div>
								<div class="field">
									<label for="contactNumber">Contact Number:</label>
									<div class="control">
										<cfinput type="text" id="contactNumber" name="contactNumber" placeholder="Enter the contact number">
									<div class="error-msg" id="error_contactnumber" name="error_contactnumber"></div></div>
								</div>
								<div class="field">
									<label for="subject">Select the subject:</label>
									<div class="control">
										<cfinput type="text" id="subject" name="subject" placeholder="Enter the subject">
									<div class="error-msg" id="error_subject" name="error_subject"></div></div>
								</div>
								<div class="field no-label">
									<div class="control">
										<button type="submit" class="button" id="addFaculties" name="addFaculties" > Done </button>
									</div>
								</div>
							</cfform>
						</div> <!-- .boxed-section .request-form -->
					</div> <!--col-md-6-->
				</div><!--row-->
			</div><!--conatiner-->
		</main>
</tags:adminFront>
