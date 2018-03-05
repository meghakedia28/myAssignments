<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../common/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 3>
	<cflocation url = "../common/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:studentFront>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<div class="page-title">
				<div class="container">
					<h2>Add questions</h2>
				</div>
			</div>
		</header>
	</div>
	<cfif structKeyExists(session,"stQuizStarts") >
		<cfif !(#session.stQuizStarts.endTime# GT #now()# && #session.stQuizStarts.startTime# LT #now()#)  >
			<cfset killSession = createObject("component","demoApplication.components.onTestSubmit").destroySession() >
			<cflocation url = "tests.cfm?noaccess">
		</cfif>
		<cfset testScore = createObject("component","demoApplication.components.getQuizDetails").getScore(#session.stLoggedInUser.userId# , #session.stQuizStarts.quizId#)>
		<cfif (#session.stQuizStarts.endTime# LT #now()# || (#testScore.recordCount# NEQ 0))  >
			<div id="testEndMsg" name="testEndMsg"><h1> Test time has ended, please come back in the next test </h1></div>
		<cfelse>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<h3>NOTE:<br/>
							The test will end on : <cfoutput>#DateTimeFormat(session.stQuizStarts.endTime, "dd MMMMM,yyyy hh:nn tt")#</cfoutput><br />
							You can submit the test only once.<br />
							It is a MCQ based test, and one correct answer for each question.<br />
							Donot navigate while you are giving the test.<br />
							Please submit before the time ends.</h3>
							<h3 style="color:#FF0000" align="center">
 								The test will end in : <span id="timer"></span>
 							</h3>
					</div><!---col-md-10--->
					<div class="col-md-12">
						<div class="boxed-section request-form">
						<h2 class="section-title text-center">Questions:</h2>
								<cfform name="startTest" id="startTest" action="">
									<p class="section-title text-center">
										<cfinput name="startTime" id="startTime" type="hidden" value="#DateFormat(session.stQuizStarts.startTime,'yyyy/mm/dd') & ' ' & TimeFormat(session.stQuizStarts.startTime,'HH:nn:ss')#">
										<cfinput name="endTime" id="endTime" type="hidden" value="#DateFormat(session.stQuizStarts.endTime,'yyyy/mm/dd') & ' ' & TimeFormat(session.stQuizStarts.endTime,'HH:nn:ss')#">
										<cfinput name="nowTime" id="nowTime" type="hidden" value="#DateFormat(now(),'yyyy/mm/dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#">
										<cfset object =  createObject("component","demoApplication.components.getQuizQuestions") />
										<cfset questions = object.quizQuestions(#session.stQuizStarts.quizId#)>
										<cfset questionNumber = 0>
											<table class="table" id="questions" name="questions">
												<thead>
													<tr>
														<th>Sl No.</th>
														<th>questions</th>
														<th>option1</th>
														<th>option2</th>
														<th>option3</th>
														<th>option4</th>
													</tr>
												</thead>
												<tbody>
													<cfoutput query="questions">
														<tr>
															<cfset questionNumber = questionNumber + 1 />
															<td>#questionNumber#</td>
														 	<td>#encodeForHtml(question)#</td>
														 	<td><cfinput type="radio" name="#quizQuestionId#" id="option1" value= "option1">#encodeForHtml(option1)#</td>
													 		<td><cfinput type="radio" name="#quizQuestionId#" id="option2" value= "option2">#encodeForHtml(option2)#</td>
															<td><cfinput type="radio" name="#quizQuestionId#" id="option3" value= "option3">#encodeForHtml(option3)#</td>
															<td><cfinput type="radio" name="#quizQuestionId#" id="option4" value= "option4">#encodeForHtml(option4)#</td>
														</tr>
													</cfoutput>
												</tbody>
											</table><br>
											<div class="field no-label">
												<div class="control  text-center">
													<button type="submit" class="button text-center" id="submitTest" name="submitTest" value="">Submit test</button>
												</div>
											</div>
									</cfform>
								</div> <!---.boxed-section .request-form --->
							</div><!---col-md-12--->
						</div><!---row--->
					</div><!---conatiner--->
				</main>
			</cfif>
		<cfelse>
			<cflocation url = "tests.cfm?noaccess">
		</cfif>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../js/testStartValidation.js"></script>
</tags:studentFront>