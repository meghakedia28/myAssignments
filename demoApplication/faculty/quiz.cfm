<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../common/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix = "tags">
	<tags:facultyFront>
  	   <div class = "page-title">
			<div class = "container">
				<h2>Set a quiz</h2>
			</div>
		</div>
	</header>
</div>
<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.css">
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
	<main class = "main-content">
	<div class = "container">
		<div class = "row">
		<div class = "export" id = "buttons"></div>
			<cfform action = "" name = "quizForm" id = "quizForm">
				<div class = "col-md-12">
				<h2 class = "section-title text-center">Quiz information:</h2>
					<div class = "export" id = "buttons"></div>
					<div class = "request-form">
						<div class = "box">
							<div class = "lineform">
								<label for = "quizName">Name of the quiz:</label>
								<div ><cfinput type = "text" id = "quizName" name = "quizName" placeholder = "Give a name to the quiz">
								<div class = "error-msg" id = "error_quizname"></div></div>
							</div>
							<div class = "lineform">
								<label for = "startTime">Enter the start Time:</label>
								<div ><cfinput type = "text" id = "startTime" name = "startTime" placeholder = "Enter the start date time">
								<div class = "error-msg" id = "error_starttime"></div></div>
							</div>
							<div class = "lineform">
								<label for = "endTime">Enter the end Time:</label>
								<div >
								<cfselect id = "endTime" name = "endTime" >
									<option value = "">Select the duration of test:</option>
									<option value = "15">15 mins</option>
									<option value = "30">30 mins</option>
									<option value = "45">45 mins</option>
									<option value = "60">60 mins</option>
									<option value = "75">1 hr 15 mins</option>
									<option value = "90">1hr 30 mins</option>
									<option value = "105">1hr 45 mins</option>
									<option value = "120">2hrs</option>
								</cfselect>
								<div class = "error-msg" id = "error_endtime"></div>
								</div>
							</div>
							<div class = "submitbtn lineform">
								<div >
									<input type = "submit" class = "button" value = "Submit request">
								</div>
							</div>
							</div>
						</div> <!---request-form--->
					</div><!---col-md-12--->
					<div class = "col-md-12">
						<div class = "boxed-section">
							<cfoutput><input type = "hidden" id = "userId" name = "userId" value = "#session.stLoggedInUser.userId#"></input></cfoutput>
							<h2 class = "section-title text-center">Question Bank:</h2>
							<div class = "error-msg text-center" id = "error_questions"></div>
							<div >
								<table class = "table" id = "questions" name = "questions">
									<thead>
										<tr>
											<th></th>
											<th>Questions</th>
											<th>Option1</th>
											<th>Option2</th>
											<th>Option3</th>
											<th>Option4</th>
											<th>Answer</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th></th>
											<th>Questions</th>
											<th>Option1</th>
											<th>Option2</th>
											<th>Option3</th>
											<th>Option4</th>
											<th>Answer</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div><!--box section-->
					</div><!--col-md-12-->
				</cfform>
			</div><!---row--->
		</div><!---container--->
	</main>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
	<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.full.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src = "../js/quizValidation.js"></script>
	<script src = "../js/wordEmailNumberValidation.js"></script>
	</tags:facultyFront>