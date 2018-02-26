<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 3>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif structKeyExists(url,"noaccess")>
	<p>You have already submitted your test OR the time of test has not yet started.</p>
</cfif>
<cfif structKeyExists(url,"error")>
	<p>Something went wrong.</p>
</cfif>
<cfimport taglib = "../customTags/" prefix = "tags">
	<tags:studentFront>
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
						<cfif structKeyExists(url, "endTest")>
							<p>The test has ended</p>
						</cfif>
						<h2 class = "section-title text-center">Quiz Details:</h2>
						<cfform name = "questionsForm" id = "questionsForm" action = "testStart.cfm">
							<cfoutput>
							<p class = "section-title text-center">
								<cfset object = createObject("component","demoApplication.components.getQuizDetails") />
								<cfset currentTime = "#DateFormat(now(),'yyyy/mm/dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#" />
								<cfset testDetails = object.currentQuizDetails(currentTime)>
								<cfif testDetails.quizId NEQ '' >
									<cfset testScore = object.getScore(#session.stLoggedInUser.userId# , #testDetails.quizId#)>
									<cfif testScore.RecordCount EQ 0>
										<cfinput name = "startTime" id = "startTime" type = "hidden"
											value = "#DateFormat(testDetails.startDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(testDetails.startDateTime,'HH:nn:ss')#">
										<cfinput name = "endTime" id = "endTime" type = "hidden"
											value = "#DateFormat(testDetails.endDateTime,'yyyy/mm/dd') & ' ' & TimeFormat(testDetails.endDateTime,'HH:nn:ss')#">
										<cfinput name = "nowTime" id = "nowTime" type = "hidden"
											value = "#DateFormat(now(),'yyyy/mm/dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#">
									<cfelse>
										<cfinput name = "startTime" id = "startTime" type = "hidden" value = "">
										<cfinput name = "endTime" id = "endTime" type = "hidden" value = "">
										<cfinput name = "nowTime" id = "nowTime" type = "hidden" value = "">
									</cfif>
									<cfif (structKeyExists(url,"submitEnd") AND (testScore.RecordCount NEQ 0))>
										<h3 class = "text-center">Congratulations! You have completed today's challenge.</h3>
										<h3 class = "text-center">You have scored: #testScore.score# </h3>
									</cfif>
									<cfif ((#currentTime# GTE #testDetails.startDateTime#) AND (#currentTime# LTE #testDetails.endDateTime#)) >
										<div id = "onGoingTest">
											<cfif (testScore.RecordCount EQ 0) >
												<h3 class = " text-center"> Hurry up! give the test before it ends.</h3>
											<cfelseif NOT(structKeyExists(url,"submitEnd"))>
												<h3 class = " text-center">You have completed today's challenge.</h3>
											</cfif>
											<h3 class = " text-center"> ON going test, started at
												: #DateTimeFormat(testDetails.startDateTime, "dd MMMMM,yyyy hh:nn tt")#</h3>
											<h3 class = " text-center"> The test Ends on
												: #DateTimeFormat(testDetails.endDateTime, "dd MMMMM,yyyy hh:nn tt")#</h3>
										</div>
									<cfelse>
										<div id = "upComingTest">
											<h3 class = "text-center"> Next test is at
												: #DateTimeFormat(testDetails.startDateTime, "dd MMMMM,yyyy hh:nn tt")# </h3>
										</div>
									</cfif>
										<h3 class = "section-title text-center"> Quiz Name: #testDetails.quizName#</h3>
										<h3 class = "section-title text-center"> Subject : #testDetails.subjectName#</h3>
										<h3 class = "section-title text-center"> Faculty : #testDetails.firstName# #testDetails.lastName#</h3>
								<cfelse>
									<h3> No test is yet to come.<br /> Tests will be displayed once the faculties set the upcoming tests.</h3>
								</cfif>
							</cfoutput>
						</p>
					</cfform>
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
<script src = "../js/testValidate.js"></script>
</tags:studentFront>