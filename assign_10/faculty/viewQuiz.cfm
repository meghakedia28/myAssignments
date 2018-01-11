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
  	   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
		<div class="page-title">
			<div class="container">
				<h2>View quiz Details</h2>
			</div>
		</div>
	</header>
</div>
<cfset quizDetails =  createobject("component",'assign_10.components.viewQuizListService') />
<cfset quizList = quizDetails.getQuizList(#session.stLoggedInUser.userId#) />
<main class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="boxed-section request-form">
					<cfset quizNumber = 0>
					<table class="table" id="quiz_#quizId#" name="quizId">
						<tr>
							<th>Sl No.</th>
							<th>Quiz name</th>
							<th>Start date time</th>
							<th>End date time</th>
							<th>View questions</th>
						</tr>
						<cfoutput query="quizList">
							<tr>
								<cfset quizNumber = quizNumber + 1 />
								<td>#quizNumber#</td>
							 	<td>#quizList.name#</td>
							 	<td>#quizList.startDateTime#</td>
						 		<td>#quizList.endDateTime#</td>
								<cfset questionList = quizDetails.getQuestionList(#quizList.quizId#) />
								<cfset questionNumber = 0>
						 		<td><button type="button" class="btn btn-success btn-md" id = "questionId_#quizId#" name="questionId"  data-toggle="modal" data-target="###quizId#" >Questions</button>
						 			<div class="modal fade" id="#quizId#" role="dialog">
 									   <div class="modal-dialog modal-lg">
										<!-- Modal content-->
									      <div class="modal-content">
									        <div class="modal-header">
										    	<h4 class="modal-title">Questions of #quizList.name#:</h4>
									         		<button type="button" class="close" data-dismiss="modal">&times;</button>
									        </div><!--modal-header-->
											<div class="modal-body">
									        	<table class="table table-sm" id="#quizId#" name="question" >
													<tr>
														<th>Sl No.</th>
														<th>Questions</th>
														<th>Option1</th>
														<th>Option2</th>
														<th>Option3</th>
														<th>Option4</th>
													</tr>
								 					<cfloop query="questionList">
											 			<tr>
												 			<cfset questionNumber = questionNumber + 1 />
												 			<td>#questionNumber#</td>
												 			<td>#questionList.question#</td>
												 			<td>#questionList.option1#</td>
												 			<td>#questionList.option2#</td>
												 			<td>#questionList.option3#</td>
												 			<td>#questionList.option4#</td>
												 		</tr>
									 				</cfloop>
									 			</table>
									 		</div><!--modal-body-->
									 		<div class="modal-footer">
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									       </div><!--modal-footer-->
										  </div><!--modal-content-->
								  		</div><!--modal dialog-->
								  	</div><!--modal fade-->
								</td>
							</tr>
						</cfoutput>
					</table>
				</div>
			</div>
		</div>
	</div>
</main>
</tags:facultyFront>