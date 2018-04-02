<!-------------------------------------------------------------------------------------------------------------
		FileName    : tests.cfm
		Created By  : Megha Kedia
		DateCreated : 28-March-2018
		Description : displays the informationa about the test.

-------------------------------------------------------------------------------------------------------------->

		<link rel = "stylesheet"
			href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet"
			href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<div class = "page-title">
			<div class = "container">
				<h2>Give Quiz:</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
					<div class = "boxed-section request-form">
						<cfoutput>
							<cfif (structKeyExists(prc,"endTestMessage"))>
								<p class = "text-center">#prc.endTestMessage#</p>
							</cfif>
							<h2 class = "section-title text-center">Quiz Details:</h2>
							<cfform name = "testStartForm" id = "testStartForm" action = "testStart.cfm">
								<p class = "section-title text-center">
									<cfif (structKeyExists(prc.test,"noTest")
										AND (prc.test.noTest EQ "false"))>
										<cfif ((structKeyExists(prc.test,"testCompleted"))
											AND (prc.test.testCompleted EQ "false"))>
												<cfinput name = "startTime" id = "startTime" type = "hidden"
													value = "#prc.test.quizDetails.startDateTime#">
												<cfinput name = "endTime" id = "endTime" type = "hidden"
													value = "#prc.test.quizDetails.endDateTime#">
												<cfinput name = "nowTime" id = "nowTime" type = "hidden"
													value = "#prc.test.currentTime#">
										<cfelseif ((structKeyExists(prc.test,"testCompleted"))
											AND (prc.test.testCompleted EQ "true"))>
												<cfinput name = "startTime" id = "startTime" type = "hidden"
													value = "">
												<cfinput name = "endTime" id = "endTime" type = "hidden"
													value = "">
												<cfinput name = "nowTime" id = "nowTime" type = "hidden"
													value = "">
										</cfif>
										<cfif (structKeyExists(prc.test,"submit")
											AND (prc.test.submit EQ "true"))>
												<h3 class = "text-center">Congratulations!
													You have completed today's challenge.</h3>
												<h3 class = "text-center">You have scored:
													#prc.score# </h3>
										</cfif>
										<cfif ((structKeyExists(prc.test,"onGoingTest"))
											AND (prc.test.onGoingTest EQ "true")) >
												<div id = "onGoingTest">
													<cfif ((structKeyExists(prc.test,"completed"))
														AND (prc.test.completed EQ "false")) >
															<h3 class = " text-center">
																Hurry up! give the test before it ends.</h3>
													<cfelseif ((structKeyExists(prc.test,"completed"))
														AND (prc.test.completed EQ "true")) >
															<h3 class = " text-center">
																You have completed today's challenge.</h3>
													</cfif>
													<h3 class = " text-center"> ON going test, started at
														: #prc.test.quizDetails.startDateTime#</h3>
													<h3 class = " text-center"> The test Ends on
														: #prc.test.quizDetails.endDateTime#</h3>
												</div>
										<cfelseif ((structKeyExists(prc.test,"onGoingTest"))
											AND (prc.test.onGoingTest EQ "false"))>
												<div id = "upComingTest">
													<h3 class = "text-center"> Next test is at
														: #prc.test.quizDetails.startDateTime# </h3>
												</div>
										</cfif>
											<h3 class = "section-title text-center">
												Quiz Name: #prc.test.quizDetails.quizName#</h3>
											<h3 class = "section-title text-center">
												Subject : #prc.test.quizDetails.subjectName#</h3>
											<h3 class = "section-title text-center">
												Faculty : #prc.test.quizDetails.firstName#
														  #prc.test.quizDetails.lastName#</h3>
									<cfelseif (structKeyExists(prc,"noTest")
										AND (prc.test.noTest EQ "true"))>
											<h3> No test is yet to come.<br />Tests will be displayed
												once the faculties set the upcoming tests.</h3>
									</cfif>
								</p>
							</cfform>
						</cfoutput>
						<div class = "field no-label">
							<div class = "control  text-center">
								<span id = "startTestButton">&nbsp;</span>
							</div>
						</div>
					</div> <!--- .boxed-section .request-form --->
				</div><!---col-md-12--->
			</div><!---row--->
		</div><!---conatiner--->
	</main>
<script type = "text/javascript"
			src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type = "text/javascript"
			src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type = "text/javascript"
			src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script src = "../../includes/js/testValidate.js"></script>
<script type = "text/javascript" src = "../../includes/js/common.js"></script>