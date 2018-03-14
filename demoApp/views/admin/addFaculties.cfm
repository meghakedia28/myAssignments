<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../common/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 1>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<div class = "page-title">
			<div class = "container">
				<h2>Add faculties</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "mid-row">
			<div class = "col-md-8">
				<div class = "boxed-section request-form">
					<h2 class = "section-title text-center">Faculty's information:</h2>
					<cfform name = "form" id = "form" action = ""><!---form to add faculties--->
						<div class = "field">
							<label for = "firstName">First Name:</label>
							<div class = "control">
								<cfinput type = "text" id = "firstName" name = "firstName" placeholder = "Enter the first name" >
							<div class = "error-msg" id = "error_firstname" name = "error_firstname"></div></div>
						</div><!---end of field--->
						<div class = "field">
							<label for = "lastName">Last Name:</label>
							<div class = "control">
								<cfinput type = "text" id = "lastName" name = "lastName" placeholder = "Enter the last name" >
							<div class = "error-msg" id = "error_lastname" name = "error_lastname"></div></div>
						</div><!---end of field--->
						<div class = "field">
							<label for = "email">Email Address:</label>
							<div class = "control">
								<cfinput type = "text" id = "email" name = "email" placeholder = "example@mail.com">
							<div class = "error-msg" id = "error_email" name = "error_email"></div></div>
						</div><!---end of field--->
						<div class = "field">
							<label for = "contactNumber">Contact Number:</label>
							<div class = "control">
								<cfinput type = "text" id = "contactNumber" name = "contactNumber" placeholder = "Enter the contact number">
							<div class = "error-msg" id = "error_contactnumber" name = "error_contactnumber"></div></div>
						</div><!---end of field--->
						<div class = "field">
							<label for = "subject">Select the subject:</label>
							<div class = "control">
								<cfinput type = "text" id = "subject" name = "subject" placeholder = "Enter the subject">
							<div class = "error-msg" id = "error_subject" name = "error_subject"></div></div>
						</div><!---end of field--->
						<div class = "field no-label">
							<div class = "control">
								<button type = "submit" class = "button" id = "addFaculties" name = "addFaculties" > Done </button>
							</div>
						</div><!---end of field no-label--->
					</cfform>
				</div> <!--- .boxed-section .request-form --->
			</div> <!---col-md-6--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<div class = "modal fade" id = "rowEdit" role = "dialog">
	<div class = "modal-dialog modal-md">
		<!--- Modal content--->
      <div class = "modal-content">
	        <div class = "modal-header">
		    	<h4 class = "modal-title">Questions details:</h4>
	         	<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
	        </div><!---modal-header--->
			<div class = "modal-body request-form">
				 <form name = "editForm" id = "editForm" action = "" method = "post">
					<div class = "field">
						<label for = "question">Question:</label>
						<textarea class = "form-control" id = "question" name = "question" placeholder = "Enter the question" value = ""></textarea>
						<div class = "error-msg" id = "error_question"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "optionA">Option A:</label>
						<input class = "form-control" type = "text" id = "optiona" name = "optiona" placeholder = "Enter the first option" value = "">
						<div class = "error-msg" id = "error_optiona"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "optionB">Option B:</label>
						<input class = "form-control" type = "text" id = "optionb" name = "optionb" placeholder = "Enter the second option" value = "">
						<div class = "error-msg" id = "error_optionb"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "optionC">Option C:</label>
						<input class = "form-control" type = "text" id = "optionc" name = "optionc" placeholder = "Enter the third option" value = "">
						<div class = "error-msg" id = "error_optionc"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "optionD">Option D:</label>
						<input class = "form-control" type = "text" id = "optiond" name = "optiond" placeholder = "Enter the fourth option" value = "">
						<div class = "error-msg" id = "error_optiond"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "correctAnswer">Correct Answer:</label>
						<div>
							<select class = "form-control" id = "answer" name = "answer" check = "" >
								<option value = "">Select the correct option</option>
								<option value = "option1">Option A</option>
								<option value = "option2">Option B</option>
								<option value = "option3">Option C</option>
								<option value = "option4">Option D</option>
							</select>
							<div class = "error-msg" id = "error_answer"></div>
						</div>
					</div><!---field--->
				</form>
	 		</div><!---modal-body--->
	 		<div class = "modal-footer">
		 	  <button type = "button" id = "update" name = "update" class = "btn btn-success" onclick = "return updateRow(this)">Update</button>
	          <button type = "button" class = "btn btn-default" data-dismiss = "modal" >Close</button>
	        </div><!---modal-footer--->
		  </div><!---modal-content--->
  		</div><!---modal dialog--->
  	</div><!---modal fade--->
  	<div class = "modal fade" id = "rowDelete" role = "dialog">
		<div class = "modal-dialog modal-md">
		<!--- Modal content--->
     		<div class = "modal-content">
	  			<div class = "modal-header">
		   	 		<h4 class = "modal-title"></h4>
	         		<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
	       		</div><!---modal-header--->
				<div class = "modal-body">
					<h3>Are you sure you want to delete this row?</h3>
				</div><!---modal-body--->
	 			<div class = "modal-footer">
	 	  			<button type = "button" id = "confirm" name = "confirm" class = "btn btn-danger" onclick = "return deleteRow(this)">Confirm</button>
	          		<button type = "button" class = "btn btn-default" data-dismiss = "modal" >Close</button>
	        	</div><!---modal-footer--->
		  	</div><!---modal-content--->
  		</div><!---modal dialog--->
  	</div><!---modal fade--->
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type = "text/javascript" src = "../../includes/js/userValidation.js"></script>
<script type = "text/javascript" src = "../../includes/js/wordEmailNumberValidation.js"></script>