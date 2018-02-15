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
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
		<script type="text/javascript" src="../js/questionBankEditAndValidation.js"></script>
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
				<cfoutput><input type="hidden" id="userId" name="userId" value="#session.stLoggedInUser.userId#"></cfoutput>
				<h2 class="section-title text-center">Question Bank:</h2>
					<div class="export" id="buttons"></div>
					<table class="table" id="questions" name="questions">
						<thead>
							<tr>
								<th>Questions</th>
								<th>Option1</th>
								<th>Option2</th>
								<th>Option3</th>
								<th>Option4</th>
								<th>Answer</th>
								<th>Modify</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Questions</th>
								<th>Option1</th>
								<th>Option2</th>
								<th>Option3</th>
								<th>Option4</th>
								<th>Answer</th>
								<th>Modify</th>
							</tr>
						</tfoot>
						<div class="modal fade" id="rowEdit" role="dialog">
							<div class="modal-dialog modal-md">
								<!-- Modal content-->
						      <div class="modal-content">
							        <div class="modal-header">
								    	<h4 class="modal-title">Questions:</h4>
							         	<button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div><!--modal-header-->
									<div class="modal-body">
										 <cfform name="editForm" id="editForm" action="" method="post">
											<div class="field">
												<label for="question">Question:</label>
												<cftextarea id="question" name="question" placeholder="Enter the question" value=""></cftextarea>
												<div class="error-msg" id="error_question"></div>
											</div>
											<div class="field">
												<label for="optionA">Option A:</label>
												<cfinput type="text" id="optiona" name="optiona" placeholder="Enter the first option" value="">
												<div class="error-msg" id="error_optiona"></div>
											</div>
											<div class="field">
												<label for="optionB">Option B:</label>
												<cfinput type="text" id="optionb" name="optionb" placeholder="Enter the second option" value="">
												<div class="error-msg" id="error_optionb"></div>
											</div>
											<div class="field">
												<label for="optionC">Option C:</label>
												<cfinput type="text" id="optionc" name="optionc" placeholder="Enter the third option" value="">
												<div class="error-msg" id="error_optionc"></div>
											</div>
											<div class="field">
												<label for="optionD">Option D:</label>
												<cfinput type="text" id="optiond" name="optiond" placeholder="Enter the fourth option" value="">
												<div class="error-msg" id="error_optiond"></div>
											</div>
											<div class="field">
												<label for="correctAnswer">Correct Answer:</label>
												<div>
													<cfselect id="answer" name="answer" check="" >
														<option value="">Select the correct option</option>
														<option value="option1">option A</option>
														<option value="option2">option B</option>
														<option value="option3">option C</option>
														<option value="option4">option D</option>
													</cfselect>
													<div class="error-msg" id="error_answer"></div>
												</div>
											</div>
											<cfinput type="hidden" id="questionId" name="questionId" value="">
										</cfform>
							 		</div><!--modal-body-->
							 		<div class="modal-footer">
								 	  <button type="button" class="btn btn-default" >+Add Questions</button>
							          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							        </div><!--modal-footer-->
								  </div><!--modal-content-->
						  		</div><!--modal dialog-->
					  	</div><!--modal fade-->
				</table>
			</div>
		</div>
	</div>
</main>
</tags:facultyFront>