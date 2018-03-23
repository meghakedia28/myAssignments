<!-------------------------------------------------------------------------------------------------------------
		FileName    : viewFaculties.cfm
		Created By  : Megha Kedia
		DateCreated : 18-March-2018
		Description : has datatable to show faculties information, with an edit functionality.

-------------------------------------------------------------------------------------------------------------->

<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT(sessionExists)>
	<cfscript>
		setNextEvent(event = "common.loginPage?noaccess");
	</cfscript>
<cfelseif session.stLoggedInUser.roleId NEQ 1>
	<cfscript>
		setNextEvent(event = "common.loginPage?noaccess");
	</cfscript>
</cfif>
<link rel = "stylesheet" type = "text/css" href =
	"//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<link rel = "stylesheet" href =
	"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel = "stylesheet" href =
	"https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
	<div class = "page-title">
			<div class = "container">
				<h2>List of faculties:</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
				<div class = "boxed-section">
					<h2 class = "section-title text-center">List of faculties:</h2>
					<div class = "export" id = "buttons"></div>
					<table class = "table" id = "listOfFaculties" name = "listOfFaculties">
						<thead>
							<tr>
								<th>Subject</th>
								<th>Name</th>
								<th>Email ID</th>
								<th>Active</th>
								<th>Contact Number</th>
								<th>Modify</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Subject</th>
								<th>Name</th>
								<th>Email ID</th>
								<th>Active</th>
								<th>Contact Number</th>
								<th>Modify</th>
							</tr>
						</tfoot>
					</table>
				</div><!--boxed-section-->
			</div><!--col-md-12-->
		</div><!--row-->
	</div><!--conatiner-->
</main>
<div class = "modal fade" id = "rowEdit" role = "dialog">
	<div class = "modal-dialog modal-md">
		<!--- Modal content--->
      <div class = "modal-content">
	        <div class = "modal-header">
		    	<h4 class = "modal-title">Faculty details:</h4>
	         	<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
	        </div><!---modal-header--->
			<div class = "modal-body request-form">
				 <form name = "editForm" id = "editForm" action = "" method = "post">
					 <div class = "field">
						<label for = "subject">Subject:</label>
						<input class = "form-control" id = "subject" name = "subject"
						placeholder = "Enter the subject" value = "">
						<div class = "error-msg" id = "error_subject"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "firstName">First Name:</label>
						<input class = "form-control" id = "firstName" name = "firstName"
						placeholder = "Enter the first name" value = "">
						<div class = "error-msg" id = "error_firstname"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "lastName">Last Name:</label>
						<input class = "form-control" type = "text" id = "lastName" name = "lastName"
						placeholder = "Enter the last name" value = "">
						<div class = "error-msg" id = "error_lastname"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "email">Email Address:</label>
						<input type = "text" id = "email" name = "email"
						placeholder = "" value = "" disabled>
					</div><!---field--->
					<div class = "field">
						<label for = "active">Active:</label>
						<input type = "text" id = "active" name = "active"
						placeholder = "" value = "" disabled>
					</div><!---field--->
					<div class = "field">
						<label for = "contactNumber">Contact Number:</label>
						<input class = "form-control" type = "text" id = "contactNumber" name = "contactNumber"
						placeholder = "Enter the contact number" value = "">
						<div class = "error-msg" id = "error_contactnumber"></div>
					</div><!---field--->
					<input type = "hidden" id = "userId" name = "userId" placeholder = "" value="">
				</form>
	 		</div><!---modal-body--->
	 		<div class = "modal-footer">
		 	  <button type = "button" id = "update" name = "update" class = "btn btn-success"
		 	  onclick = "return updateRow()" >Update</button>
	          <button type = "button" class = "btn btn-default" data-dismiss = "modal" >Close</button>
	          <input type = "hidden" value = "2" id = "role" name = "role" disabled>
	        </div><!---modal-footer--->
		</div><!---modal-content--->
  	</div><!---modal dialog--->
</div><!---modal fade--->
<script type = "text/javascript"
	src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type = "text/javascript"
	src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type = "text/javascript"
	src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type = "text/javascript"
	src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type = "text/javascript"
	src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type = "text/javascript"
	src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type = "text/javascript"
	src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type = "text/javascript"
	src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script type = "text/javascript"
	src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type = "text/javascript"
	src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type = "text/javascript"
	src = "../../includes/js/listOfFaculty.js"></script>
<script type = "text/javascript"
	src = "../../includes/js/gobalAjaxCallHandler.js"></script>
<script type = "text/javascript"
	src = "../../includes/js/wordEmailNumberValidation.js"></script>