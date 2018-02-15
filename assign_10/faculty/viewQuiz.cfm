<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:facultyFront>
  	   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script type="text/javascript" src="../js/viewQuizHandling.js"></script>
		<div class="page-title">
			<div class="container">
				<h2>View quiz Details</h2>
			</div>
		</div>
	</header>
</div>
<main class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<div class="export" id="buttons"></div>
				<div class="boxed-section request-form">
					<cfoutput><input type="hidden" id="userId" name="userId" value="#session.stLoggedinUser.userId#"></cfoutput>
					<table class="table" id="quiz" name="quizId">
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
						<div class="modal fade" id="quizQuestionList" role="dialog">
							<div class="modal-dialog modal-lg">
								<!-- Modal content-->
						      <div class="modal-content">
							        <div class="modal-header">
								    	<h4 class="modal-title">Questions:</h4>
							         	<button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div><!--modal-header-->
									<div class="modal-body">
							        	<table class="table table-sm" id="question" name="question" >
											<thead>
												<tr>
													<th>Sl No.</th>
													<th>Questions</th>
													<th>Option1</th>
													<th>Option2</th>
													<th>Option3</th>
													<th>Option4</th>
													<th></th>
												</tr>
											</thead>
											<tfoot>
											<tr>
													<th>Sl No.</th>
													<th>Questions</th>
													<th>Option1</th>
													<th>Option2</th>
													<th>Option3</th>
													<th>Option4</th>
													<th></th>
												</tr>
											</tfoot>
						 				</table>
 									 		</div><!--modal-body-->
 									 		<div class="modal-footer">
 										 	  <button type="button" class="btn btn-default" >+Add Questions</button>
 									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
 									        </div><!--modal-footer-->
 										  </div><!--modal-content-->
 								  		</div><!--modal dialog-->
								  	</div><!--modal fade-->
 								</table>
				</div>
			</div>
		</div>
	</div>
</main>
</tags:facultyFront>