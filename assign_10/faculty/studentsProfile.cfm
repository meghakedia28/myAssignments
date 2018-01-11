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
		<div class="page-title">
			<div class="container">
				<h2>View Students Profile</h2>
			</div>
		</div>
	</header>
</div>
		<main class="main-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="boxed-section request-form">
								<cfset results =  createobject("component",'assign_10.components.getStudents').getStudentsDetails() />
								<cfset Slno = 0>
								<table class="table" id="result" name="result">
									<tr>
										<th>Sl No.</th>
										<th>Name</th>
										<th>Email Id</th>
										<th>Contact No.</th>
										<th>View Scores</th>
									</tr>
									<cfoutput query="results">
										<tr>
											<cfset Slno = Slno + 1 />
											<td>#Slno#</td>
											<td>#firstName# #lastName#</td>
											<td>#emailid#</td>
											<td>#contactNumber#</td>
											<td><a href="studentsResults.cfm?Id=#userId#" target="_blank">view all tests scores</a></td>
										</tr>
									</cfoutput>
								</table><br>
							</div>
						</div>
					</div>
				</div>
		</main>
	</tags:facultyFront>