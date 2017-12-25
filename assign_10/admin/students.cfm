<cfif NOT isUserLoggedIn() || session.stLoggedInUser.roleId NEQ 1>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
	<cfmodule template="../customTags/front.cfm" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/validation.js"></script>
		<div class="page-title">
			<div class="container">
				<h2>Student are our pride</h2>
			</div>
		</div>
	</header>
</div>
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
											<div class="error-msg" id="error_firstname"></div></div>
									</div>
									<div class="field">
										<label for="lastName">Last Name:</label>
										<div class="control">
											<cfinput type="text" id="lastName" name="lastName" placeholder="Enter the last name">
										<div class="error-msg" id="error_lastname"></div></div>
									</div>
									<div class="field">
										<label for="email">Email Address:</label>
										<div class="control">
											<cfinput type="text" id="email" name="email" placeholder="example@mail.com">
										<div class="error-msg" id="error_email"></div></div>
									</div>
									<div class="field">
										<label for="contactNumber">Contact Number:</label>
										<div class="control">
											<cfinput type="text" id="contactNumber" name="contactNumber" placeholder="Enter the contact number">
										<div class="error-msg" id="error_contactnumber"></div></div>
									</div>
									<!---<div class="field">
										<label for="password">Password:</label>
										<div class="control"><input type="text" id="password" placeholder="Enter the password"></div>
									</div>
									<div class="field">
										<label for="confirmPassword">Confirm Password:</label>
										<div class="control"><input type="text" id="confirmPassword" placeholder="Enter the password again"></div>
									</div>--->
									<div class="field no-label">
										<div class="control">
											<button type="submit" class="button" id="addStudents" name="addStudents" > Done </button>
										</div>
									</div>
								</cfform>
							</div> <!-- .boxed-section .request-form -->
						</div>
						<div class="col-md-6">
							<div class="boxed-section best-students">
								<h2 class="section-title  text-center">Other activities:</h2>
								<div class="field no-label">
										<div class="control text-center">
											<a href = "">View list of faculties</a>
										</div>
										<div class="control text-center">
											<a href = "">View list of students</a>
										</div>
										<div class="control text-center">
											<a href = "faculties.cfm">Add faculties</a>
										</div>
								</div>
							</div>
						</div>
					</div>
		</main>
</cfmodule>