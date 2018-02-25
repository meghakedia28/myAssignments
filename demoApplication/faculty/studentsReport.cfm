<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfset scoreIds  = createObject("component",'demoApplication.components/facultyResultSet').getScoreIds(#session.stLoggedInUser.UserId#) />
<cfset scoreIdsList = ValueList(scoreIds.scoreId,",") />
<cfif NOT (structKeyExists(url,'Id')) || NOT (listFindNoCase(scoreIdsList, url.Id))>
	<cflocation url = "results.cfm">
<cfelse>
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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
  	   	<script type="text/javascript" src="../js/studentsReportForFaculty.js"></script>
			<div class="page-title">
				<div class="container">
					<h2>View Students Report:</h2>
				</div>
			</div>
		</header>
	</div>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="export" id="buttons"></div>
						<div class="boxed-section">
							<cfoutput>
							<cfset scoreDetails = createObject('component','demoApplication/components/facultyResultSet').getScoreDetails(url.Id) />
		 					<h6 >Name: #scoreDetails.firstName# #scoreDetails.lastName#</h6>
		 					<h6 >Quiz Name: #scoreDetails.name#</h6>
		 					</cfoutput>
							<table class="table table-sm" id="studentsReportTable" name="studentsReportTable" >
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
	</tags:facultyFront>
</cfif>