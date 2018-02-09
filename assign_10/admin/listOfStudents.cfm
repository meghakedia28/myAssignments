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
	<tags:front>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<div class="page-title">
			<div class="container">
				<h2>Add faculties</h2>
			</div>
		</div>
	</header>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
	<main class="main-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
						<div class="boxed-section">
							<h2 class="section-title text-center">List of students:</h2>
							<cfset slNo = 0>
								<table class="table" id="listOfStudents" name="listOfStudents">
									<thead>
										<tr>
											<th>Name</th>
											<th>Email ID</th>
											<th>Active</th>
											<th>Contact Number</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Name</th>
											<th>Email ID</th>
											<th>Active</th>
											<th>Contact Number</th>
										</tr>
									</tfoot>
								</table>
							</div><!--boxed-section-->
					</div><!--col-md-12-->
				</div><!--row-->
			</div><!--conatiner-->
		</main>
	<script type="text/javascript" src="../js/listOfStudents.js"></script>
</tags:front>