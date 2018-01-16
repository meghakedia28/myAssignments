<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cftry>
	<cfset object =  createobject("component",'assign_10.components.facultyResultSet') />
	<cfset marks = object.individualResultSet(#URL.Id#)>
	<cfset studentExists = createobject("component",'assign_10.components.getStudents').getSingleStudentDetails(#URL.Id#) />
		<cfif #marks.quizId# EQ '' AND  #studentExists.firstName# EQ '' >
				<cfinclude template="../unauthorized.cfm">
		<cfelse>
			<cfimport taglib = "../customTags/" prefix="tags">
				<tags:noNavigation>
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
					<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
					<div class="page-title">
						<div class="container">
							<h2>Performance Report for<br/> <cfoutput> #studentExists.firstName#  #studentExists.lastName#</cfoutput>:</h2>
						</div>
					</div>
				</header>
			</div>
			<main class="main-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="boxed-section request-form">
							<cfif #marks.quizId# EQ '' AND  #studentExists.firstName# NEQ '' >
								<h2> No test record found for this student</h2>
							<cfelse>
								<cfset Slno = 0>
									<table class="table" id="result" name="result">
										<tr>
											<th>Sl No.</th>
											<th>Quiz Name</th>
											<th>Start date time</th>
											<th>Score percentage</th>
											<th>Rank</th>
										</tr>
										<cfoutput query="marks">
											<tr>
												<cfset Slno = Slno + 1 />
												<td>#Slno#</td>
											 	<td>#name#</td>
											 	<td>#startDateTime#</td>
										 		<td>#score# %</td>
												<td>#RANK#</td>
											</tr>
										</cfoutput>
									</table><br>
								</cfif>
								</div><!--boxed section-->
							</div><!--col-md-12-->
						</div><!--row-->
					</div><!--container-->
				</main>
			</tags:noNavigation>
		</cfif>
	<cfcatch type="any">
		<cflocation url="studentsProfile.cfm">
	</cfcatch>
	</cftry>