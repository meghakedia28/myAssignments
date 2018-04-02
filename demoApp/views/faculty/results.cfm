<!-------------------------------------------------------------------------------------------------------------
FileName    : results.cfm
Created By  : Megha Kedia
DateCreated : 18-March-2018
Description : displays the result of students for all the quiz set by a faculty(user).

-------------------------------------------------------------------------------------------------------------->

		<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
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
			<!---modal to select quiz--->
				<cfoutput>
					<form class="navbar-form navbar-left" name = "quizList" id = "quizList" role="search">
						<!---filter table--->
						<input type = "hidden" id = "userId" name = "userId"
							value = "#session.stLoggedinUser.userId#">
						<div class="form-group">
							<span>Quiz name:</span>
				  			<div>
					  			<select class="selectpicker" multiple="" title = "Filter by quiz name" name="filter" id = "filter"
					  				data-live-search="true" multiple data-selected-text-format="count > 2"
					  				data-size="10">
				               		<cfloop collection = "#prc.quizFilter#" item = "key">
					            		<option value = "#key#">#prc.quizFilter[key]#</option>
				             		</cfloop>
					         	</select>
					         	<input type="button" class="btn btn-default" onclick= "addFilter(this)" value="Filter">
					         </div>
				        </div>
					</form>
				</cfoutput>
			<div class = "col-md-12">
				<div class = "boxed-section" id = "resultSets">
					<h2 class = "section-title text-center">Results:</h2>
					<div class = "export" id = "exportButtons"></div>
					<table class = "table " id = "result" name = "result">
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
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script type = "text/javascript" src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type = "text/javascript" src = "../../includes/js/facultyResultSet.js"></script>
