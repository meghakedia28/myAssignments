<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../common/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfset quiz = createObject("component","demoApplication.components/viewQuizListService").getQuizlist(#session.stLoggedInUser.UserId#) />
<cfset quizList = ValueList(quiz.quizId,",") />
<cfif NOT (structKeyExists(url,"Id")) || NOT (listFindNoCase(quizList, url.Id))>
	<cflocation url = "viewQuiz.cfm">
<cfelse>
	<cfimport taglib = "../customTags/" prefix = "tags">
	<tags:facultyFront>
		<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
			<div class = "page-title">
				<div class = "container">
					<cfoutput>
					<h2>View quiz Questions:</h2>
					<cfset quizDetails = createObject("component","demoApplication/components/getQuizDetails").fetchQuizDetails(url.Id, session.stLoggedInUser.userId) />
					<h6 class = "user">Quiz Name: #quizDetails.name#</h6>
					<h6 class = "user">Start Time: #quizDetails.startDateTime#</h6>
					<h6 class = "user">End Time: #quizDetails.endDateTime#</h6>
					</cfoutput>
				</div><!---container--->
			</div><!---page-title--->
		</header>
	</div>
		<main class = "main-content">
			<div class = "container">
				<div class = "row">
					<div class = "col-md-12">
					<h2 class = "section-title text-center">Quiz Questions:</h2>
						<div class = "export" id = "buttons"></div>
						<div class = "boxed-section">
							<cfoutput><input type = "hidden" id = "userId" value = "#session.stLoggedInUser.userId#">
							<cfif (#quizDetails.startDateTime# GT now())>
							<div><button type = "button" class = "btn btn-success btn-md" id = "addButton" name = "addButton" data-toggle = "modal" data-target = "##selectQuestions" ><i class = "glyphicon glyphicon-plus"></i>Add Questions</button></div></cfif></cfoutput>
							<div class = "error-msg text-center" id = "error_questions" name = "error_questions"></div>
							<table class = "table table-sm" id = "questions" name = "questions" >
								<thead>
									<tr>
										<th>Questions</th>
										<th>Option A</th>
										<th>Option B</th>
										<th>Option C</th>
										<th>Option D</th>
										<th>Answer</th>
										<th></th>
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
										<th></th>
									</tr>
								</tfoot>
		 					</table>
						</div><!---box-section--->
					</div><!---col-md-12--->
				</div><!---row--->
			</div><!---conatiner--->
		</main><!---main--->
		<!---modal for delete--->
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
	  	<!---modal for selecting questions--->
	  	<div class = "modal fade" id = "selectQuestions" role = "dialog">
			<div class = "modal-dialog modal-lg">
				<!--- Modal content--->
		      <div class = "modal-content">
			        <div class = "modal-header">
				    	<h4 class = "modal-title">Add Questions:</h4>
			         	<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
			        </div><!---modal-header--->
					<div class = "modal-body">
						<form name = "quizQuestions" id = "quizQuestions" action = "" method = "POST">
							<table class = "table" id = "addQuestions" name = "addQuestions" >
								<thead>
									<tr>
										<th></th>
										<th>Questions</th>
										<th>Option A</th>
										<th>Option B</th>
										<th>Option C</th>
										<th>Option D</th>
										<th>Answer</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th></th>
										<th>Questions</th>
										<th>Option A</th>
										<th>Option B</th>
										<th>Option C</th>
										<th>Option D</th>
										<th>Answer</th>
									</tr>
								</tfoot>
							</table><!---end of tables--->
						</form>
					</div><!---modal-body--->
			 		<div class = "modal-footer">
				 	  <button type = "button" id = "add" name = "add" class = "btn btn-success" onclick = "return add(this)">ADD</button>
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
  	   	<script type = "text/javascript" src = "../js/viewQuizQuestions.js"></script>
	</tags:facultyFront>
</cfif>