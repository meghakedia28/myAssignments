<!-------------------------------------------------------------------------------------------------------------
FileName    : studentsReport.cfm
Created By  : Megha Kedia
DateCreated : 18-March-2018
Description : has datatable to show faculties information, with an edit functionality.

-------------------------------------------------------------------------------------------------------------->
		<link rel = "stylesheet" type = "text/css"
			href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet"
			href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet"
			href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
			<div class = "page-title">
				<div class = "container">
					<h2>View Students Report</h2>
				</div>
			</div>
		</header>
	</div>
	<main class = "main-content">
		<div class = "container">
			<div class = "row">
				<div class = "col-md-12">
					<cfoutput>
						<div><a href = "#event.buildLink( 'faculty.results')#">Go back to View Results</a></div>
					</cfoutput>
					<div class = "boxed-section">
						<h2 class = "section-title text-center">Students Report</h2>
						<div class = "export" id = "exportButtons"></div>
						<cfoutput>
						<h6 >Student Name: #prc.scoreDetails.firstName# #prc.scoreDetails.lastName#</h6>
	 					<h6 >Quiz Name: #prc.scoreDetails.name#</h6>
	 					<cfset studentName = "Student name:	" & #prc.scoreDetails.firstName# &
	 											" " & #prc.scoreDetails.lastName#>
	 					<cfset quizName = "Quiz name: " & #prc.scoreDetails.name#>
	 					</cfoutput>
						<table class = "table table-sm tableSize" id = "studentsReportTable" name = "studentsReportTable">
							<thead>
								<tr>
									<th>Questions</th>
									<th>Correct Answer</th>
									<th>Student Answer</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Questions</th>
									<th>Correct Answer</th>
									<th>Student Answer</th>
								</tr>
							</tfoot>
	 					</table>
					</div><!---box-section--->
				</div><!---col-md-12--->
			</div><!---row--->
		</div><!---conatiner--->
	</main><!---main--->
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
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
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type = "text/javascript"
			src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" language="JavaScript">
		<cfoutput>
		var #toScript(studentName, "studentName")#;
		var #toScript(quizName, "quizName")#;
		</cfoutput>
	</script>
	<cfoutput>
 		<script type = "text/javascript" src = "#base#/includes/js/studentsReportForFaculty.js"></script>
	</cfoutput>
