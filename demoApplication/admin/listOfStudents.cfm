<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 1>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:adminFront>
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<div class="page-title">
			<div class="container">
				<h2>Add faculties</h2>
			</div>
		</div>
	</header>
</div>
<main class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="boxed-section">
					<h2 class="section-title text-center">List of students:</h2>
					<div class="export" id="buttons"></div>
						<table class="table" id="listOfStudents" name="listOfStudents">
							<thead>
								<tr>
									<th>Name</th>
									<th>Email ID</th>
									<th>Active</th>
									<th>Contact Number</th>
									<th>Modify</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Name</th>
									<th>Email ID</th>
									<th>Active</th>
									<th>Contact Number</th>
									<th>Modify</th>
								</tr>
							</tfoot>
							<!---edit modal--->
							<div class="modal fade" id="rowEdit" role="dialog">
								   <div class="modal-dialog modal-md">
								<!-- Modal content-->
							     <div id="editModal"></div>
						  		</div><!--modal dialog-->
						  	</div><!--modal fade-->
						  	<!---delete modal--->
						  	<div class="modal fade" id="rowDelete" role="dialog">
								   <div class="modal-dialog modal-md">
								<!-- Modal content-->
							      <div class="modal-content">
							        <div class="modal-header">
								    	<h4 class="modal-title">Delete record:</h4>
							         		<button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div><!--modal-header-->
									<div class="modal-body">
									<!--form inside the modal-->
									</div><!--modal-body-->
							 		<div class="modal-footer">
								 	  <button type="submit" class="btn btn-default" id="submitEditForm" name="submitEditFrom" onClick="" value="">confirm</button>
								 	  <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
							        </div><!---modal-footer--->
								  </div><!---modal-content--->
						  		</div><!---modal dialog--->
						  	</div><!---modal fade--->
						</table>
				</div><!---boxed-section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/listOfStudents.js"></script>
<script type="text/javascript" src="../js/wordEmailNumberValidation.js"></script>
</tags:adminFront>