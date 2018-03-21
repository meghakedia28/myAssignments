<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
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
		<div class = "page-title">
			<div class = "container">
				<h2>View results</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
			<!---modal to select quiz--->
				<cfoutput><input type = "hidden" id = "userId" name = "userId" value = "#session.stLoggedinUser.userId#"></cfoutput>
				<div class = "dropdown filter">
					<button type = "button" class = "btn btn-info btn-lg dropdownbtn" >Filter by quiz</button>
					<div class = "dropdownbtn-content">
						<div class = "scrollable-menu" >
							<form name = "quizList" id = "quizList" >
								<!---filter table--->
								<table class = "table" id = "filterList" name = "filterList">
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
						</div><!---scrollable-menu--->
						<div>
							<button type = "button" class = "btn btn-success export" id = "submitQuizList" name = "submitQuizList" class = "btn btn-success" onclick = "return addFilter(this)">Search</button>
						</div>
					</div><!---dropdownbtn-content--->
				</div><!---dropdown-filter--->
				<div class = "boxed-section request-form" id = "resultSets">
					<div class = "export" id = "buttons"></div>
					<table class = "table" id = "result" name = "result">
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
				</div><!---box-section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<div class = "modal fade" id = "basicModal" role = "dialog">
    <div class = "modal-dialog modal-sm">
     <!-- Modal content-->
     <input type = "hidden" id = "scoreId" value = "0">
      <div class = "modal-content">
        <div class = "modal-header">
          <h4 class = "modal-title">Modal Header</h4>
          <button type = "button" class = "close" data-dismiss = "modal">&times;</button>
        </div>
        <div class = "modal-body">
		</div>
        <div class = "modal-footer">
           <button type = "button" class = "btn btn-success" id = "submitQuizList" name = "submitQuizList" class = "btn btn-success" onclick = "return addFilter(this)">Search</button>
           <button type = "button" class = "btn btn-default"  data-dismiss = "modal">Close</button>
         </div><!---modal-footer--->
      </div><!---modal-content--->
	</div><!---modal-dialog--->
  </div><!---modal-fade--->
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script type = "text/javascript" src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type = "text/javascript" src = "../../includes/js/facultyResultSet.js"></script>
