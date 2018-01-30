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
		<script type="text/javascript" src="../js/editRecordValidation.js"></script>
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
			<div class="boxed-section">
				<cfset questionList = createObject("component",'assign_10/components/getQuestionsService').getQuestions(#session.stLoggedInUser.userId#) >
				<div class="error-msg" id="error_questions"></div>
				<h2 class="section-title text-center">Question Bank:</h2>
					<cfif questionList.recordcount EQ 0>
						<h2>No questions has been set.<br />
						Please <a href="questions.cfm">set questions</a> before setting a quiz.</h2>
					<cfelse>
						<table class="table" id="questions" name="questions">
							<thead>
								<tr>
									<th>Sl no.</th>
									<th>Questions</th>
									<th>Option1</th>
									<th>Option2</th>
									<th>Option3</th>
									<th>Option4</th>
									<th>Answer</th>
									<th>Edit/Delete</th>
								</tr>
							</thead>
							<tbody>
								<cfset slNo = 0 />
								<cfset editService =  createObject("component",'assign_10/components/editDeleteQuestionsService')>
								<cfoutput query= "questionList">
									<tr id ="#questionList.questionId#">
										<cfset slNo = slNo + 1 />
										<td>#slNo#</td>
										<td>#encodeForHtml(questionList.question)#</td>
									 	<td>#encodeForHtml(questionList.option1)#</td>
								 		<td>#encodeForHtml(questionList.option2)#</td>
										<td>#encodeForHtml(questionList.option3)#</td>
										<td>#encodeForHtml(questionList.option4)#</td>
										<td>#encodeForHtml(questionList.correctAnswer)#</td>
										<cfset editable = editService.checkEditability(#questionList.questionId#) >
										<cfif editable>
											<td><a href id="edit" data-toggle="modal" data-target="##edit_#questionList.questionId#">Edit</a>
											 /
											<a href id="delete" data-toggle="modal" data-target="##delete_#questionList.questionId#">Delete</a>
											<div class="modal fade" id="edit_#questionList.questionId#" role="dialog">
		 									   <div class="modal-dialog modal-md">
												<!-- Modal content-->
											      <div class="modal-content">
											        <div class="modal-header">
												    	<h4 class="modal-title">Edit record:</h4>
											         		<button type="button" class="close" data-dismiss="modal">&times;</button>
											        </div><!--modal-header-->
													<div class="modal-body">
													<!--form inside the modal-->
												        <cfform name="editForm_#questionList.questionId#" id="editForm_#questionList.questionId#" action="">
															<div class="field">
																<label for="question">Question:</label>
																<div ><cftextarea id="question_#questionList.questionId#" name="question" placeholder="Enter the question" value="#questionList.question#"></cftextarea>
																<div class="error-msg" id="error_question"></div></div>
															</div>
															<div class="field">
																<label for="optionA">Option A:</label>
																<div ><cfinput type="text" id="optiona_#questionList.questionId#" name="optiona" placeholder="Enter the first option" value="#questionList.option1#">
																<div class="error-msg" id="error_optiona"></div></div>
															</div>
															<div class="field">
																<label for="optionB">Option B:</label>
																<div ><cfinput type="text" id="optionb_#questionList.questionId#" name="optionb" placeholder="Enter the second option" value="#questionList.option2#">
																<div class="error-msg" id="error_optionb"></div></div>
															</div>
															<div class="field">
																<label for="optionC">Option C:</label>
																<div><cfinput type="text" id="optionc_#questionList.questionId#" name="optionc" placeholder="Enter the third option" value="#questionList.option3#">
																<div class="error-msg" id="error_optionc"></div></div>
															</div>
															<div class="field">
																<label for="optionD">Option D:</label>
																<div><cfinput type="text" id="optiond_#questionList.questionId#" name="optiond" placeholder="Enter the fourth option" value="#questionList.option4#">
																<div class="error-msg" id="error_optiond"></div></div>
															</div>
															<div class="field">
																<label for="correctAnswer">Correct Answer:</label>
																<div>
																	<cfselect id="answer_#questionList.questionId#" name="answer" check="#questionList.correctAnswer#" >
																		<option value="">Select the correct option</option>
																		<option value="option1">option A</option>
																		<option value="option2">option B</option>
																		<option value="option3">option C</option>
																		<option value="option4">option D</option>
																	</cfselect>
																	<div class="error-msg" id="error_answer"></div>
																</div>
															</div>
															<cfinput type="hidden" id="questionId" name="questionId" value="#questionList.questionId#">
														</cfform>
										 			</div><!--modal-body-->
											 		<div class="modal-footer">
												 	  <button type="submit" class="btn btn-default" id="submitEditForm" name="submitEditFrom" onClick="return updateRow(this)" value="#questionList.questionId#">update</button>
												 	  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											        </div><!--modal-footer-->
												  </div><!--modal-content-->
										  		</div><!--modal dialog-->
										  	</div><!--modal fade-->
											<div class="modal fade" id="delete_#questionList.questionId#" role="dialog">
		 									   <div class="modal-dialog modal-md">
												<!-- Modal content-->
											      <div class="modal-content">
											        <div class="modal-header">
												    	<h4 class="modal-title">Delete record:</h4>
											         		<button type="button" class="close" data-dismiss="modal">&times;</button>
											        </div><!--modal-header-->
													<div class="modal-body">
													<!--form inside the modal-->
														<h3>Are you sure you want to delete this record?</h3>
													</div><!--modal-body-->
											 		<div class="modal-footer">
												 	  <button type="submit" class="btn btn-default" id="confirmDelete" name="confirmDelete" value="#questionList.questionId#" onClick="deleteRow(this)">Yes</button>
												 	  <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
											        </div><!--modal-footer-->
												  </div><!--modal-content-->
										  		</div><!--modal dialog-->
										  	</div><!--modal fade-->
										  	</td>
										<cfelse>
											<td>Edit / Delete</td>
										</cfif>

									 </tr>
								</cfoutput>
							</tbody>
						</table>
					</cfif>
				</div><!--box section-->
		</div>
	</div>
</div>
</main>
</tags:facultyFront>