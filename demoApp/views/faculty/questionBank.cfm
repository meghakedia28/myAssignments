<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT(sessionExists)>
	<cfscript>
		setNextEvent(event = "common.loginPage?noaccess");
	</cfscript>
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cfscript>
		setNextEvent(event = "common.loginPage?noaccess");
	</cfscript>
</cfif>
		<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<div class = "page-title">
			<div class = "container">
				<h2>View quiz Details</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
				<div class = "boxed-section">
				<cfoutput><input type = "hidden" id = "userId" name = "userId" value = "#session.stLoggedInUser.userId#"></cfoutput>
				<h2 class = "section-title text-center">Question Bank:</h2>
					<div class = "export" id = "buttons"></div><!---export buttons--->
					<table class = "table" id = "questions" name = "questions" >
						<thead>
							<tr>
								<th>Questions</th>
								<th>Option A</th>
								<th>Option B</th>
								<th>Option C</th>
								<th>Option D</th>
								<th>Answer</th>
								<th>Modify</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Questions</th>
								<th>Option A</th>
								<th>Option B</th>
								<th>Option C</th>
								<th>Option D</th>
								<th>Answer</th>
								<th>Modify</th>
							</tr>
						</tfoot>
					</table><!---end of tables--->
				</div><!---box section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<!--edit modal-->
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
	<!-- row delete-->
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
	<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type = "text/javascript" src = "../../includes/js/questionBankEditDelete.js"></script>
	<script type = "text/javascript" src = "../../includes/js/validateQuestions.js"></script>