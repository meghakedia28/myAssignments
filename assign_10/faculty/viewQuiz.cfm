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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel="stylesheet" href="../css/editDelete.css">
		<div class="page-title">
			<div class="container">
				<h2>View quiz Details</h2>
			</div>
		</div>
	</header>
</div>
<script>
	$(document).ready(function() {
				$('#quiz').DataTable();
			});
</script>
<cfset quizDetails =  createobject("component",'assign_10.components.viewQuizListService') />
<cfset quizList = quizDetails.getQuizList(#session.stLoggedInUser.userId#) />
<main class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="boxed-section request-form">
					<cfset quizNumber = 0>
					<table class="table" id="quiz" name="quizId">
						<thead>
							<tr>
								<th>Sl No.</th>
								<th>Quiz name</th>
								<th>Start date time</th>
								<th>End date time</th>
								<th>View questions</th>
							</tr>
						</thead>
						<tbody>
						<cfoutput query="quizList">
							<tr>
								<cfset quizNumber = quizNumber + 1 />
								<td>#quizNumber#</td>
							 	<td>#quizList.name#</td>
							 	<td>#DateTimeFormat(quizList.startDateTime, "dd MMMMM,yyyy hh:nn tt")#</td>
						 		<td>#DateTimeFormat(quizList.endDateTime, "dd MMMMM,yyyy hh:nn tt")#</td>
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
														<th></th>
													</tr>
								 					<cfloop query="questionList">
											 			<tr>
												 			<cfset questionNumber = questionNumber + 1 />
												 			<td>#questionNumber#</td>
												 			<td>#encodeForHtml(questionList.question)#</td>
												 			<td>#encodeForHtml(questionList.option1)#</td>
												 			<td>#encodeForHtml(questionList.option2)#</td>
												 			<td>#encodeForHtml(questionList.option3)#</td>
												 			<td>#encodeForHtml(questionList.option4)#</td>
												 			<td><input type="button" class="btn-sm delete">
    									    					</button></td>
												 		</tr>
									 				</cfloop>
									 			</table>
									 		</div><!--modal-body-->
									 		<div class="modal-footer">
										 	  <button type="button" class="btn btn-default" >+Add Questions</button>
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									        </div><!--modal-footer-->
										  </div><!--modal-content-->
								  		</div><!--modal dialog-->
								  	</div><!--modal fade-->
								</td>
							</tr>
						</cfoutput>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</main>
</tags:facultyFront>