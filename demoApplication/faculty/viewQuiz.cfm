<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix = "tags">
	<tags:facultyFront>
		<div class = "page-title">
			<div class = "container">
				<h2>View quiz Details</h2>
			</div>
		</div>
	</header>
</div>
<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
			<div class = "export" id = "buttons"></div>
				<div class = "boxed-section">
					<cfoutput><input type = "hidden" id = "userId" name = "userId" value = "#session.stLoggedinUser.userId#"></cfoutput>
					<table class = "table" id = "quiz" name = "quiz">
						<thead>
							<tr>
								<th>Quiz name</th>
								<th>Start date time</th>
								<th>End date time</th>
								<th>View questions</th>
								<th>Modify</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Quiz name</th>
								<th>Start date time</th>
								<th>End date time</th>
								<th>View questions</th>
								<th>Modify</th>
							</tr>
						</tfoot>
					</table>
				</div><!---boxed-section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---container--->
</main><!---mail-content--->
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
						<label for = "quizName">Name of the quiz:</label>
						<input type = "text" class = "form-control" id = "quizName" name = "quizName" placeholder = "Enter the quiz name" value = "">
						<div class = "error-msg" id = "error_quizname"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "startTime">Enter the start time:</label>
						<input class = "form-control" type = "text" id = "startTime" name = "startTime" placeholder = "Enter the start date time" value = "">
						<div class = "error-msg" id = "error_starttime"></div>
					</div><!---field--->
					<div class = "field">
						<label for = "endTime">Enter the end time:</label>
						<select class = "form-control" id = "endTime" name = "endTime" placeholder = "Enter the end date time" value = "">
							<option value = "">Select the duration of test:</option>
							<option value = "15">15 mins</option>
							<option value = "30">30 mins</option>
							<option value = "45">45 mins</option>
							<option value = "60">60 mins</option>
							<option value = "75">1 hr 15 mins</option>
							<option value = "90">1hr 30 mins</option>
							<option value = "105">1hr 45 mins</option>
							<option value = "120">2hrs</option>
						</select>
						<div class = "error-msg" id = "error_endtime"></div>
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
	<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.full.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type = "text/javascript" src = "../js/viewQuizHandling.js"></script>
</tags:facultyFront>