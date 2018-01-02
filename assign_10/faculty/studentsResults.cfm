<cfif NOT isUserLoggedIn()>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cftry>
	<cfset object =  createobject("component",'assign_10.components.facultyResultSet') />
	<cfset marks = object.individualResultSet(#URL.Id#)>
		<cfif #marks.quizId# EQ ''>
			<cfinclude template="../unauthorized.cfm">
		<cfelse>
			<cfimport taglib = "../customTags/" prefix="tags">
				<tags:noNavigation>
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
					<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
					<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
					<div class="page-title">
						<div class="container">
							<h2>Performance Report for<br/> <cfoutput>#marks.firstName# #marks.lastName#</cfoutput>:</h2>
						</div>
					</div>
				</header>
			</div>
			<main class="main-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">

							<cfset Slno = 0>
									<table class="w3-centered col-md-12 " id="result" name="result">
										<tr>
											<th>Sl No.</th>
											<th>Quiz Name</th>
											<th>Start time</th>
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
									</div>


								</div> <!-- .boxed-section .request-form -->
							</div>
							</main>
				</tags:noNavigation>
			</cfif>
	<cfcatch type="any">
		<cflocation url="studentsProfile.cfm">
	</cfcatch>
	</cftry>