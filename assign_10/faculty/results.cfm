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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
		<!-- <link rel="stylesheet" href="../css/error.css"> -->
		<div class="page-title">
			<div class="container">
				<h2>View results</h2>
			</div>
		</div>
	</header>
</div>
	<script type="text/javascript" src="../js/facultyResultSet.js"></script>
		<main class="main-content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
						<!---modal to select quiz--->
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#quizList">Filter by quiz</button>
							<!-- Modal -->
							  <div class="modal fade" id="quizList" role="dialog">
							    <div class="modal-dialog">
							     <!-- Modal content-->
							     <form name="quizList" id="quizList" >
							      <div class="modal-content">
							        <div class="modal-header">
							          <h4 class="modal-title">Modal Header</h4>
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div>
							        <div class="modal-body">
								        <cfset quizList =  createobject("component",'assign_10.components.facultyResultSet').listOfQuiz(#session.stLoggedInUser.UserId#) />
										<cfset slno = 0>
										<table class="table" id="quiz" name="quiz">
											<tr>
												<td>SL no</td>
												<td></td>
												<td>Quiz Name</td>
											</tr>
											<tr>
												<cfoutput query="quizList">
												<tr>
												<cfset slno = slno + 1>
													<td>#slno#</td>
													<td><input type="checkbox" id="quizId_#quizList.quizId#" name="quizId" value= "#quizList.quizId#"/></td>
													<td><h4>#quizList.name#</h4></td>
												</tr>
												</cfoutput>
											</tr>
										</table>
									</div>
							        <div class="modal-footer">
							          <button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
							          <input type="submit" id="submitForm" class="btn btn-default" data-dismiss="modal" value="Search">
							        </div>
							      </div>
								</form>
							    </div>
							  </div>
							<div class="boxed-section request-form" id = "resultSets">
								<cfset resultSet =  createobject("component",'assign_10.components.facultyResultSet') />
								<cfset allQuizResults = resultSet.generateResultSet(#session.stLoggedInUser.UserId#) />
								<cfset Slno = 0>
								<table class="table" id="result" name="result">
									<tr>
										<th>Sl No.</th>
										<th>Quiz Name</th>
										<th>Start date time</th>
										<th>End date time</th>
										<th>Student's name</th>
										<th>Score percentage</th>
										<th>Rank</th>
									</tr>
									<cfoutput query="allQuizResults">
										<tr>
											<cfset Slno = Slno + 1 />
											<td>#Slno#</td>
											<td>#allQuizResults.name#</td>
										 	<td>#DateTimeFormat(allQuizResults.startDateTime, "dd MMMMM,yyyy hh:nn tt")#</td>
										 	<td>#DateTimeFormat(allQuizResults.endDateTime, "dd MMMMM,yyyy hh:nn tt")#</td>
									 		<td>#allQuizResults.firstName# #allQuizResults.lastName#</td>
									 		<td>#allQuizResults.score# %</td>
											<td>#allQuizResults.RANK#</td>
										</tr>
									</cfoutput>
								</table><br>
								<table class="table" id="filterTable" name="result" >
								</table>
							</div>
						</div>
					</div>
				</div>
		</main>
	</tags:facultyFront>