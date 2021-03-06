<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../common/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 1>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix = "tags">
	<tags:adminFront>
	<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
							<!---edit modal--->
							<div class = "modal fade" id = "rowEdit" role = "dialog">
								<div class = "modal-dialog modal-md">
									<!-- Modal content-->
							    	<div id = "editModal"></div>
						  		</div><!--modal dialog-->
						  	</div><!--modal fade-->
						</table>
				</div><!--boxed-section-->
			</div><!--col-md-12-->
		</div><!--row-->
	</div><!--conatiner-->
</main>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type = "text/javascript" src = "//cdn.datatables.net/tabletools/2.2.2/js/dataTables.tableTools.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script type = "text/javascript" src = "../js/listOfFaculties.js"></script> -->
<script type = "text/javascript" src = "../js/listOfFaculty.js"></script>
<script type = "text/javascript" src = "../js/wordEmailNumberValidation.js"></script>
</tags:adminFront>