<cfif NOT isUserLoggedIn() || session.stLoggedInUser.roleId NEQ 2>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:facultyFront>
  	   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<div class="page-title">
			<div class="container">
				<h2 style="font-weight: bold;">Set a quiz</h2>
			</div>
		</div>
	</header>
</div>
		<script src="../js/quizValidation.js"></script>
	  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
					<div class="col-md-6">
							<div class="boxed-section request-form">
								<h2 class="section-title text-center">Quiz information:</h2>
								<cfform action="" name="quizForm" id="quizForm">
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
										<div class="control"><cfselect id="endTime" name="endTime" >
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
										<div class="error-msg" id="error_endtime"></div></div>
									</div>
									<div class="field no-label">
										<div class="control">
											<input type="submit" class="button" value="Submit request">
										</div>
									</div>
							</div> <!-- .boxed-section .request-form -->
						</div>
								<div class="container">
									<div class="row">
										<div class="boxed-section w3-container w3-responsive">
											<cfquery name = "list">
												Select questionId,question,option1,option2,option3,option4,correctAnswer
												FROM [questionBank]
												WHERE userId =<cfqueryparam value="#session.stLoggedInUser.userId#" cfsqltype="cf_sql_bigint" />
											</cfquery>
										<div class="error-msg" id="error_questions"></div>
											<h1>Question Bank </h1>
											<table class="w3-card-4 w3-small" id="questions" name="questions">
												<tr>
													<th></th>
													<th>questions</th>
													<th>option1</th>
													<th>option2</th>
													<th>option3</th>
													<th>option4</th>
													<th>answer</th>
												</tr>
												<cfoutput query= "list">
													<tr>
														<td><cfinput type="checkbox" class="question" name="questionId" id ="questionId_#questionId#" value="#questionId#"></td>
													 	<td>#question#</td>
													 	<td>#option1#</td>
												 		<td>#option2#</td>
														<td>#option3#</td>
														<td>#option4#</td>
														<td>#correctAnswer#</td>
													 </tr>
												</cfoutput>
											</table>
										</cfform>
									</div>
								</div>
							</div>
						</main>
</tags:facultyFront>