<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:studentFront>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
			<div class="page-title">
				<div class="container">
					<h2>Add questions</h2>
				</div>
			</div>
		</header>
	</div>
	<cfif structKeyExists(session,'stQuizStarts') >
		<cfif (#session.stQuizStarts.endTime# LT #now()#)  >
			<h1> Test time has ended, please come back in the next test </h1>
			<div id="testEndMsg" name="testEndMsg"></div>
		<cfelse>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<h3>NOTE:<br/>
							The test will end on :<cfoutput> #session.stQuizStarts.endTime#</cfoutput><br />
							You can submit the test only once.<br />
							It is a MCQ based test, and one correct answer for each question.</h3>
							<h3 style="color:#FF0000" align="center">
 								You will be logged out in : <span id='timer'></span>
 							</h3>
					</div>
					<div class="col-md-12">
						<div class="boxed-section request-form">
						<h2 class="section-title text-center">Questions:</h2>
								<cfform name="startTest" id="startTest" action="">
									<p class="section-title text-center">
									<cfinput name="startTime" id="startTime" type="hidden" value="#session.stQuizStarts.startTime#">
									<cfinput name="endTime" id="endTime" type="hidden" value="#session.stQuizStarts.endTime#">
									<cfinput name="nowTime" id="nowTime" type="hidden" value="#DateFormat(now(),'yyyy-mm-dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#">

										<cfset object =  createobject("component",'assign_10.components.getQuizQuestions') />
										<cfset questions = object.quizQuestions(#session.stQuizStarts.quizId#)>
										<cfset questionNumber = 0>
											<table class="w3-large w3-striped w3-bordered" id="questions" name="questions">
												<tr>
													<th>Sl No.</th>
													<th>questions</th>
													<th>option1</th>
													<th>option2</th>
													<th>option3</th>
													<th>option4</th>
												</tr>
												<cfoutput query="questions">
													<tr>
														<cfset questionNumber = questionNumber + 1 />
														<td>#questionNumber#</td>
													 	<td>#question#</td>
													 	<td><cfinput type="radio" name="#quizQuestionId#" id="option1" value= "option1">#option1#</td>
												 		<td><cfinput type="radio" name="#quizQuestionId#" id="option2" value= "option2">#option2#</td>
														<td><cfinput type="radio" name="#quizQuestionId#" id="option3" value= "option3">#option3#</td>
														<td><cfinput type="radio" name="#quizQuestionId#" id="option4" value= "option4">#option4#</td>
													</tr>
												</cfoutput>
											</table><br>
											<div class="field no-label">
												<div class="control  text-center">
													<button type="submit" class="button text-center" id="submitTest" name="submitTest" value="">Submit test</button>
												</div>
											</div>

									</cfform>
								</div> <!-- .boxed-section .request-form -->
							</div>
					</main>
				</cfif>
		<cfelse>
			<cflocation url = "tests.cfm?noaccess">
		</cfif>
		<script src="../js/testStartValidation.js"></script>
</tags:studentFront>