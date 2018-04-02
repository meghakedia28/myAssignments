<!-------------------------------------------------------------------------------------------------------------
FileName    : testStart.cfm
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : displays the test questions

-------------------------------------------------------------------------------------------------------------->

		<link rel = "stylesheet" type = "text/css"
			href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet"
			href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet"
			href = "../../includes/css/testStyle.css">
			<div class = "page-title">
				<div class = "container">
				</div>
			</div>
		</header>
	</div>
	<cfif (structKeyExists(prc.results,"quizStructExists") AND (prc.results.quizStructExists  EQ  "true"))>
		<cfif (structKeyExists(prc.results, "relocate") AND (prc.results.relocate  EQ  "true"))>
			<cfscript>
				setNextEvent(event = "student.tests?noaccess");
			</cfscript>
		</cfif>
		<cfif (structKeyExists(prc.results, "endTest") AND (prc.results.endTest  EQ  "true"))>
			<div id = "testEndMsg" name = "testEndMsg">
				<h1> Test has ended, please come back in the next test
				</h1>
			</div>
		<cfelse>
			<main class = "main-content">
				<div class = "container">
					<div class = "row">
						<div class = "col-md-10">
							<h4>RULES:<br/>
								The test will end on :
								<cfoutput>#dateTimeFormat(session.stQuizStarts.endTime, "dd MMMMM,yyyy hh:nn tt")#
								</cfoutput><br />
								You can submit the test only once.<br />
								It is a MCQ based test, and one correct answer for each question.<br />
								Donot navigate while you are giving the test.<br />
								Please submit before the time ends.
							</h4>
							<h4 class = "endTest">
 								The test will end in : <span id = "timer"></span>
 							</h4>
						</div><!---col-md-10--->
						<div class = "col-md-12">
							<div class = "boxed-section request-form">
								<form name = "startTest" id = "startTest" action = "">
									<p class = "section-title text-center">
										<cfoutput>
											<input name = "userId" id = "userId" type = "hidden"
												value = "#session.stLoggedInUser.userId#">
											<input name = "quizId" id = "quizId" type = "hidden"
												value = "#session.stQuizStarts.quizId#">
											<input name = "startTime" id = "startTime" type = "hidden"
												value = "#dateTimeFormat(session.stQuizStarts.startTime,'yyyy/mm/dd HH:nn:ss')#">
											<input name = "endTime" id = "endTime" type = "hidden"
												value = "#dateTimeFormat(session.stQuizStarts.endTime,'yyyy/mm/dd HH:nn:ss')#">
											<input name = "nowTime" id = "nowTime" type = "hidden"
												value = "#dateTimeFormat(now(),'yyyy/mm/dd HH:nn:ss')#">
										</cfoutput>
										<div class = "questionHeader">
											<div>
												<label for = "question" >Question:</label>
												<div class = "answers">
													<span id = "questionNumber"></span>
													<span class = "questions" id = "question" name = "question" >
													</span>
												</div>
											</div>
										</div>
										<div class = "answerBlock">
											<label for = "options" >Select a correct option:</label>
											<div class = "options">
												<input type = "radio" name = "answer" id = "answer1"
													value = "option1">
												<span class = "answers" id = "optionAName" name = "optionAName" >
												</span>
											</div>
											<div class = "options">
												<input type = "radio" name = "answer" id = "answer2"
													value = "option2">
												<span class = "answers" id = "optionBName" name = "optionBName" >
												</span>
											</div>
											<div class = "options">
												<input type = "radio" name = "answer" id = "answer3"
													value = "option3">
												<span class = "answers" id = "optionCName" name = "optionCName" >
												</span>
											</div>
											<div class = "options">
												<input type = "radio" name = "answer" id = "answer4"
													value = "option4">
												<span class = "answers" id = "optionDName" name = "optionDName" >
												</span>
											</div>
										</div>
										<input type = "hidden" id = "total" name = "total" value = "">
										<div class = "field no-label">
											<div class = "control naviButton text-center" id = "navigationButton">
												<input type = "button" class = "button text-center"
													id = "nextQuestion" name = "nextQuestion" value = "Next"
													onclick = "return getNextQuestions()">
												<button type = "submit" class = "button text-center"
													id = "submitTest" name = "submitTest" value = "">Submit test</button>
											</div>
										</div>
									</form>
									<div id = "info" name = "info">
									</div>
								</div> <!---.boxed-section .request-form --->
							</div><!---col-md-12--->
						</div><!---row--->
					</div><!---conatiner--->
				</main>
			</cfif>
		<cfelse>
		<cfdump var = #prc.results#>
			<cfabort>
			<cfscript>
				setNextEvent(event = "student.tests?noaccess");
			</cfscript>
		</cfif>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
	<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script type = "text/javascript" src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src = "../../includes/js/testStartValidation.js"></script>
	<script type = "text/javascript" src = "../../includes/js/common.js"></script>