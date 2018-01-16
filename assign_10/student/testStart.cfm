﻿<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccessz">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 3>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:studentFront>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<div class="page-title">
				<div class="container">
					<h2>Add questions</h2>
				</div>
			</div>
		</header>
	</div>
	<cfif structKeyExists(session,'stQuizStarts') >
		<cfset testScore = createobject("component",'assign_10.components.getQuizDetails').getScore(#session.stLoggedInUser.userId# , #session.stQuizStarts.quizId#)>
		<cfif (#session.stQuizStarts.endTime# LT #now()# ||testScore.recordCount NEQ 0)  >
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
							It is a MCQ based test, and one correct answer for each question.<br />
							Donot navigate while you are giving the test.<br />
							Please submit before the time ends.</h3>
							<h3 style="color:#FF0000" align="center">
 								The test will end in : <span id='timer'></span>
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
											<table class="table" id="questions" name="questions">
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