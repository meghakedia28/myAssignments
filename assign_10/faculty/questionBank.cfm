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
		<link rel="stylesheet" href="../css/modify.css">
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
								<tr>
									<th>Sl no.</th>
									<th>questions</th>
									<th>option1</th>
									<th>option2</th>
									<th>option3</th>
									<th>option4</th>
									<th>answer</th>
									<th></th>
								</tr>
								<cfset slNo = 0 />
								<cfoutput query= "questionList">
									<tr>
										<cfset slNo = slNo + 1 />
										<td>#slNo#</td>
										<td>#encodeForHtml(questionList.question)#</td>
									 	<td>#encodeForHtml(questionList.option1)#</td>
								 		<td>#encodeForHtml(questionList.option2)#</td>
										<td>#encodeForHtml(questionList.option3)#</td>
										<td>#encodeForHtml(questionList.option4)#</td>
										<td>#encodeForHtml(questionList.correctAnswer)#</td>
										<td><input type="button" class="btn-sm edit">
    									    </button>
										</td>
										<td><input type="button" class="btn-sm delete">
    									    </button>
										</td>
									 </tr>
								</cfoutput>
							</table>
						</cfif>
					</div><!--box section-->
			</div>
		</div>
	</div>
</main>
</tags:facultyFront>