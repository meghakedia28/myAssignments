<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
 <cfimport taglib = "../customTags/" prefix = "tags">
	<tags:facultyFront>
		<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet" type = "text/css" href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<div class = "page-title">
			<div class = "container">
				<h2>View Students Profile</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
				<div class = "boxed-section request-form">
					<cfset results = createObject("component","demoApplication.components.getUserDetailsService").getStudentsDetails() />
					<cfset Slno = 0>
					<table class = "display" id = "result" name = "result">
						<thead>
							<tr>
								<th>Sl No.</th>
								<th>Name</th>
								<th>Email Id</th>
								<th>Contact No.</th>
								<th>View Scores</th>
							</tr>
						</thead>
						<tbody>
						<cfoutput query = "results">
							<tr>
								<cfset Slno = Slno + 1 />
								<td>#Slno#</td>
								<td>#results.firstName# #results.lastName#</td>
								<td>#results.emailid#</td>
								<td>#results.contactNumber#</td>
								<cfset resultSet = createObject("component","demoApplication.components.facultyResultSet") />
								<cfset marks = resultSet.individualStudentResultSet(#results.userId#, #session.stLoggedInUser.userId#)>
								<cfset studentExists = createObject("component","demoApplication.components.getUserDetailsService").getUserDetails(#results.userId#) />
									<td><button type = "button" class = "btn btn-success btn-md" id = "result_#userId#"
										name = "result"  data-toggle = "modal" data-target = "###userId#" >view all tests scores</button>
										<div class = "modal fade" id = "#userId#" role = "dialog">
	 									   	<div class = "modal-dialog modal-lg">
											<!-- Modal content-->
										      <div class = "modal-content">
										        <div class = "modal-header">
											    	<h4 class = "modal-title">Performance Report for #studentExists.firstName#  #studentExists.lastName#:</h4>
										         	<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
										        </div><!--modal-header-->
												<div class = "modal-body">
											        <cfif #marks.quizId# EQ '' AND  #studentExists.firstName# NEQ '' >
														<h2> No test record found for this student</h2>
													<cfelse>
														<cfset questionNo = 0>
														<table class = "table table-sm" id = "#userId#" name = "result">
															<tr>
																<th>Sl No.</th>
																<th>Quiz Name</th>
																<th>Start date time</th>
																<th>Score percentage</th>
															<th>Rank</th>
															</tr>
															<cfloop query = "marks">
																<tr>
																	<cfset questionNo = questionNo + 1 />
																	<td>#questionNo#</td>
																 	<td>#marks.name#</td>
																 	<td>#DateTimeFormat(marks.startDateTime, "dd MMMMM,yyyy hh:nn tt")#</td>
																 	<td>#marks.score# %</td>
																	<td>#marks.RANK#</td>
																</tr>
															</cfloop>
														</table><br>
													</cfif>
										 		</div><!--modal-body-->
										 		<div class = "modal-footer">
										          <button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
										       </div><!--modal-footer-->
											</div><!--modal-content-->
									  	</div><!--modal dialog-->
								 	</div><!--modal fade-->
								  </td>
								</tr>
							</cfoutput>
						</tbody>
					</table><br>
				</div><!---box section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
	$(document).ready(function() {
		$('#result').DataTable();
	});
</script>
</tags:facultyFront>