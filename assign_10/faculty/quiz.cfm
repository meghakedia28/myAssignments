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
				<h2>Set a quiz</h2>
			</div>
		</div>
	</header>
</div>
		<script src="../js/quizValidation.js"></script>
		<link rel="stylesheet" href="../css/table.css">
	  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.full.min.js"></script>
		<script>
			$.noConflict();
			jQuery(document).ready(function($){
				$('#startTime').datetimepicker({
					 formatDate:'Y/m/d',
					minDate:0
				});
			});
		</script>
 	<main class="main-content">
		<div class="container">
			<div class="row">
				<cfform action="" name="quizForm" id="quizForm">
					<div class="col-md-6">
						<div class="boxed-section request-form">
							<h2 class="section-title text-center">Quiz information:</h2>
								<div class="field">
									<label for="quizName">Name of the quiz:</label>
									<div class="control"><cfinput type="text" id="quizName" name="quizName" placeholder="Give a name to the quiz">
									<div class="error-msg" id="error_quizname"></div></div>
								</div>
								<div class="field">
									<label for="startTime">Enter the start Time:</label>
									<div class="control"><cfinput type="text" id="startTime" name="startTime" placeholder="Enter the start date time">
									<div class="error-msg" id="error_starttime"></div></div>
								</div>
								<div class="field">
									<label for="endTime">Enter the end Time:</label>
									<div class="control">
									<cfselect id="endTime" name="endTime" >
										<option value="">Select the correct option</option>
										<option value="15">15 mins</option>
										<option value="30">30 mins</option>
										<option value="45">45 mins</option>
										<option value="60">60 mins</option>
										<option value="75">1 hr 15 mins</option>
										<option value="90">1hr 30 mins</option>
										<option value="105">1hr 45 mins</option>
										<option value="120">2hrs</option>
									</cfselect>
									<div class="error-msg" id="error_endtime"></div>
									</div>
								</div>
								<div class="field no-label">
									<div class="control">
										<input type="submit" class="button" value="Submit request">
									</div>
								</div>
							</div> <!-- .boxed-section .request-form -->
						</div><!--col-md-6-->
						<div class="col-md-6">
							<div class="boxed-section">
								<cfset questionList = createObject("component",'assign_10/components/getQuestionsService').getQuestions(#session.stLoggedInUser.userId#) >
								<div class="error-msg" id="error_questions"></div>
								<h2 class="section-title text-center">Question Bank:</h2>
								<div class="container_table">
									<cfif questionList.recordcount EQ 0>
										<h2>No questions has been set.<br />
										Please <a href="questions.cfm">set questions</a> before setting a quiz.</h2>
									<cfelse>
										<table class="table" id="questions" name="questions">
											<tr>
												<th></th>
												<th>questions</th>
												<th>option1</th>
												<th>option2</th>
												<th>option3</th>
												<th>option4</th>
												<th>answer</th>
											</tr>
											<cfoutput query= "questionList">
												<tr>
													<td><cfinput type="checkbox" class="question" name="questionId" id ="questionId_#questionList.questionId#" value="#questionList.questionId#"></td>
												 	<td>#encodeForHtml(questionList.question)#</td>
												 	<td>#encodeForHtml(questionList.option1)#</td>
											 		<td>#encodeForHtml(questionList.option2)#</td>
													<td>#encodeForHtml(questionList.option3)#</td>
													<td>#encodeForHtml(questionList.option4)#</td>
													<td>#encodeForHtml(questionList.correctAnswer)#</td>
												 </tr>
											</cfoutput>
										</table>
									</cfif>
								</div><!--container_table-->
							</div><!--box section-->
						</div><!--col-md-6-->
					</cfform>
				</div>
			</div>
		</main>
</tags:facultyFront>