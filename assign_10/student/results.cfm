<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 3>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:studentFront>
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
		<script>
			$(document).ready(function(){
				table = $("#result").DataTable({
				});
			});
		</script>
		<div class="page-title">
			<div class="container">
				<h2>Performance report:</h2>
			</div>
		</div>
	</header>
</div>
<main class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="boxed-section request-form">
					<cfset resultService =  createobject("component",'assign_10.components.viewResultsService') />
					<cfset marks = resultService.userResult(#session.stLoggedInUser.userId#)>
					<cfif marks.recordcount EQ 0 >
						<h2>You have No records </h2>
					<cfelse>
						<cfset Slno = 0>
						<table class="table" id="result" name="result">
							<thead>
								<tr>
									<th>Sl No.</th>
									<th>Quiz Name</th>
									<th>Start date time</th>
									<th>Score percentage</th>
									<th>Rank</th>
								</tr>
							</thead>
							<tbody>
								<cfoutput query="marks">
									<tr>
										<cfset Slno = Slno + 1 />
										<td>#Slno#</td>
									 	<td>#marks.name#</td>
									 	<td>#DateTimeFormat(marks.startDateTime, "dd MMMMM,yyyy hh:nn tt")#</td>
								 		<td>#marks.score# %</td>
								 		<cfset rank = resultService.getRanks(#marks.quizId#, #session.stLoggedInUser.userId#)/>
										<td>#rank#</td>
									</tr>
								</cfoutput>
							</tbody>
						</table><br>
					</cfif>
				</div>
			</div>
		</div>
	</div>
</main>
</tags:studentFront>