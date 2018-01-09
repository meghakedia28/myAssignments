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
				<h2 style="font-weight: bold;">View quiz Details</h2>
			</div>
		</div>
	</header>
</div>
<cfset quizList =  createobject("component",'assign_10.components.viewQuizListService').getQuizList(#session.stLoggedInUser.userId#) />
<main class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="boxed-section request-form">
					<cfset quizNumber = 0>
					<table class="table" id="quiz" name="quiz">
						<tr>
							<th>Sl No.</th>
							<th>Quiz name</th>
							<th>Start date time</th>
							<th>End date time</th>
						</tr>
						<cfoutput query="quizList">
							<tr>
								<cfset quizNumber = quizNumber + 1 />
								<td>#quizNumber#</td>
							 	<td>#name#</td>
							 	<td>#startDateTime#</td>
						 		<td>#endDateTime#</td>
							</tr>
						</cfoutput>
					</table>
				</div>
			</div>
		</div>
	</div>
</main>
</tags:facultyFront>