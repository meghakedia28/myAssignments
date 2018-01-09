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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<div class="page-title">
			<div class="container">
				<h2>Add questions</h2>
			</div>
		</div>
	</header>
</div>
		<script type="text/javascript" src="../js/validQuestions.js"></script>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="boxed-section request-form">
							<h2 class="section-title text-center">Question Details:</h2>
							<cfform name="questionsForm" id="questionsForm" action="">
								<div class="field">
									<label for="question">Question:</label>
									<div class="control"><cftextarea id="question" name="question" placeholder="Enter the question"></cftextarea>
									<div class="error-msg" id="error_question"></div></div>
								</div>
								<div class="field">
									<label for="optionA">Option A:</label>
									<div class="control"><cfinput type="text" id="optiona" name="optiona" placeholder="Enter the first option">
									<div class="error-msg" id="error_optiona"></div></div>
								</div>
								<div class="field">
									<label for="optionB">Option B:</label>
									<div class="control"><cfinput type="text" id="optionb" name="optionb" placeholder="Enter the second option">
									<div class="error-msg" id="error_optionb"></div></div>
								</div>
								<div class="field">
									<label for="optionC">Option C:</label>
									<div class="control"><cfinput type="text" id="optionc" name="optionc" placeholder="Enter the third option">
									<div class="error-msg" id="error_optionc"></div></div>
								</div>
								<div class="field">
									<label for="optionD">Option D:</label>
									<div class="control"><cfinput type="text" id="optiond" name="optiond" placeholder="Enter the fourth option">
									<div class="error-msg" id="error_optiond"></div></div>
								</div>
								<div class="field">
									<label for="correctAnswer">Correct Answer:</label>
									<div class="control"><cfselect id="answer" name="answer" >
															<option value="">Select the correct option</option>
															<option value="option1">option A</option>
															<option value="option2">option B</option>
															<option value="option3">option C</option>
															<option value="option4">option D</option>
														</cfselect>
									<div class="error-msg" id="error_answer"></div></div>
								</div>
								<div class="field no-label">
									<div class="control">
										<button type="submit" class="button" id="addQuestions" name="addQuestions" > Done </button>
									</div>
								</div>
							</cfform>
						</div> <!-- .boxed-section .request-form -->
					</div>
				</div>
			</main>
	</tags:facultyFront>