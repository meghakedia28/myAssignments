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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
	  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.14/jquery.datetimepicker.full.min.js"></script>
		<script src="../js/quizValidation.js"></script>
		<link rel="stylesheet" href="../css/table.css">
		<script>
			$.noConflict();
			jQuery(document).ready(function($){
				$('#questions').DataTable({
				 "bLengthChange": false,
				 "searching": false
					});
				$('#startTime').datetimepicker({
					 formatDate:'Y/m/d',
					minDate:0
				});
			});
		</script>
		<style>
			.lineform {
			float: left;
			padding: 10px 30px 10px 30px;
			}
			.submitbtn {
			padding: 40px 0px 0px 0px;
			}
			.box{
			border-style: groove;
			}
		</style>
 	<main class="main-content">
		<div class="container">
			<div class="row">
				<cfform action="" name="quizForm" id="quizForm">
					<div class="col-md-12">
					<h2 class="section-title text-center">Quiz information:</h2>
						<div class="request-form">
						<div class="box">
							<div class="lineform">
									<label for="quizName">Name of the quiz:</label>
									<div ><cfinput type="text" id="quizName" name="quizName" placeholder="Give a name to the quiz">
									<div class="error-msg" id="error_quizname"></div></div>
								</div>
								<div class="lineform">
									<label for="startTime">Enter the start Time:</label>
									<div ><cfinput type="text" id="startTime" name="startTime" placeholder="Enter the start date time">
									<div class="error-msg" id="error_starttime"></div></div>
								</div>
								<div class="lineform">
									<label for="endTime">Enter the end Time:</label>
									<div >
									<cfselect id="endTime" name="endTime" >
										<option value="">Select the duration of test:</option>
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
								<div class="submitbtn lineform">
									<div >
										<input type="submit" class="button" value="Submit request">
									</div>
								</div>
								</div>
							</div> <!-- .boxed-section .request-form -->
						</div><!--col-md-6-->
						<div class="col-md-12">
							<div class="boxed-section">
								<cfset questionList = createObject("component",'assign_10/components/getQuestionsService').getQuestions(#session.stLoggedInUser.userId#) >
								<div class="error-msg text-center" id="error_questions"></div>
								<h2 class="section-title text-center">Question Bank:</h2>
								<div class="">
									<cfif questionList.recordcount EQ 0>
										<h2>No questions has been set.<br />
										Please <a href="questions.cfm">set questions</a> before setting a quiz.</h2>
									<cfelse>
										<table class="table" id="questions" name="questions">
											<thead>
											<tr>
												<th></th>
												<th>Questions</th>
												<th>Option1</th>
												<th>Option2</th>
												<th>Option3</th>
												<th>Option4</th>
												<th>Answer</th>
											</tr>
											</thead>
											<tbody>
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
											</tbody>
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