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
				<h2>View results</h2>
			</div>
		</div>
	</header>
</div>
		<main class="main-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="boxed-section request-form">
								<cfset results =  createobject("component",'assign_10.components.facultyResultSet').generateResultSet() />
							 	<cfset Slno = 0>
								<table class="table" id="result" name="result">
									<tr>
										<th>Sl No.</th>
										<th>Quiz Name</th>
										<th>Start date time</th>
										<th>End date time</th>
										<th>Student's name</th>
										<th>Score percentage</th>
										<th>Rank</th>
									</tr>
									<cfoutput query="results">
										<tr>
											<cfset Slno = Slno + 1 />
											<td>#Slno#</td>
											<td>#name#</td>
										 	<td>#startDateTime#</td>
										 	<td>#endDateTime#</td>
									 		<td>#firstName# #lastName#</td>
									 		<td>#score# %</td>
											<td>#RANK#</td>
										</tr>
									</cfoutput>
								</table><br>
							</div>
						</div>
					</div>
				</div>
		</main>
	</tags:facultyFront>