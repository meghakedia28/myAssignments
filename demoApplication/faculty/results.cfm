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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script type="text/javascript" src="../js/facultyResultSet.js"></script>
		<div class="page-title">
			<div class="container">
				<h2>View results</h2>
			</div>
		</div>
	</header>
</div>
		<main class="main-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
						<!---modal to select quiz--->
						<cfoutput><input type="hidden" id="userId" name="userId" value="#session.stLoggedinUser.userId#"></cfoutput>
						<div class="dropdown filter">
						<button type="button" class="btn btn-info btn-lg dropdownbtn" >Filter by quiz</button>
							<div class="dropdownbtn-content">
								<div class="scrollable-menu" >
									<form name="quizList" id="quizList" >
										<table class="table" id="filterList" name="filterList">
											<thead>
												<tr>
													<th></th>
													<th>Quiz Name</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th></th>
													<th>Quiz Name</th>
												</tr>
											</tfoot>
										</table>
									</form>
								</div>
								<div>
									<button type="button" class="btn btn-success export" id= "submitQuizList" name="submitQuizList" class="btn btn-success" onclick="return addFilter(this)">Search</button>
								</div>
							</div>
						</div>
							<div class="boxed-section request-form" id = "resultSets">
								<div class="export" id ="buttons"></div>
								<table class="table" id="result" name="result">
									<thead>
										<tr>
											<th>Quiz Name</th>
											<th>Start date time</th>
											<th>End date time</th>
											<th>Student's name</th>
											<th>Score percentage</th>
											<th>Rank</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Quiz Name</th>
											<th>Start date time</th>
											<th>End date time</th>
											<th>Student's name</th>
											<th>Score percentage</th>
											<th>Rank</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
		</main>
		<div class="modal fade" id="basicModal" role="dialog">
		    <div class="modal-dialog modal-sm">
		     <!-- Modal content-->
		     <input type="hidden" id="scoreId" value="0">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Header</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
				</div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-success" id= "submitQuizList" name="submitQuizList" class="btn btn-success" onclick="return addFilter(this)">Search</button>
		           <button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
		         </div>
		      </div>
			</div>
		  </div>
	</tags:facultyFront>