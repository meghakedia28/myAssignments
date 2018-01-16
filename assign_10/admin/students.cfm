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
		<div class="page-title">
			<div class="container">
				<h2>Student are our pride</h2>
			</div>
		</div>
	</header>
</div>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../js/validation.js"></script>
	<main class="main-content">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="boxed-section request-form">
						<h2 class="section-title text-center">Student's information</h2>
						<cfform name="form" id="form" action="">
							<div class="field">
								<label for="firstName">First Name:</label>
								<div class="control">
									<cfinput type="text" id="firstName" name="firstName" placeholder="Enter the first name">
									<div class="error-msg" id="error_firstname"></div>
								</div>
							</div>
							<div class="field">
								<label for="lastName">Last Name:</label>
								<div class="control">
									<cfinput type="text" id="lastName" name="lastName" placeholder="Enter the last name">
									<div class="error-msg" id="error_lastname"></div>
								</div>
							</div>
							<div class="field">
								<label for="email">Email Address:</label>
								<div class="control">
									<cfinput type="text" id="email" name="email" placeholder="example@mail.com">
									<div class="error-msg" id="error_email"></div>
								</div>
							</div>
							<div class="field">
								<label for="contactNumber">Contact Number:</label>
								<div class="control">
									<cfinput type="text" id="contactNumber" name="contactNumber" placeholder="Enter the contact number">
									<div class="error-msg" id="error_contactnumber"></div>
								</div>
							</div>
							<div class="field no-label">
								<div class="control">
									<button type="submit" class="button" id="addStudents" name="addStudents" > Done </button>
								</div>
							</div>
						</cfform>
					</div> <!-- .boxed-section .request-form -->
				</div><!--col-md-6-->
				<div class="col-md-6">
					<div class="boxed-section w3-container w3-responsive">
						<cfset getFacultyList = createobject("component",'assign_10/components/viewListOfUser').getStudentList()/>
						<div class="error-msg" id="error_questions"></div>
						<h2 class="section-title text-center">List of students:</h2>
						<div class="container_table" id="list">
							<cfset slNo = 0>
							<table class="table table-sm" id="listOfStudents" name="listOfStudents">
								<tr>
									<th>SL No.</th>
									<th>Name</th>
									<th>Email ID</th>
									<th>Active</th>
									<th>Contact Number</th>
								</tr>
								<cfoutput query= "getFacultyList">
									<tr>
										<cfset slNo = slNo + 1 />
										<td>#slNo#</td>
										<td>#getFacultyList.firstName# #getFacultyList.lastName#</td>
									 	<td>#getFacultyList.emailid#</td>
								 		<td>#getFacultyList.active#</td>
								 		<td>#getFacultyList.contactNumber#</td>
									</tr>
								</cfoutput>
							</table>
						</div><!--contanier_table-->
					</div><!--boxed-section w3-conatiner w3-responsive-->
				</div><!--col-md-6-->
			</div><!--row-->
		</div><!--container-->
	</main>
</tags:front>