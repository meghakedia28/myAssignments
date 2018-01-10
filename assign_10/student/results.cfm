<cfset sessionExists = structKeyExists(session,'stLoggedInUser') />
<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif NOT(sessionExists)>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
<cfelseif session.stLoggedInUser.roleId NEQ 3>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:studentFront>
  	   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
		<div class="page-title">
			<div class="container">
				<h2 style="font-weight: bold;">Performance report:</h2>
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
					<cfset object =  createobject("component",'assign_10.components.viewResultsService') />
					<cfset marks = object.userResult(#session.stLoggedInUser.userId#)>
					<cfif marks.recordcount EQ 0 >
						<h2>You have No records </h2>
					<cfelse>
						<cfset Slno = 0>
						<table class="table" id="result" name="result">
							<tr>
								<th>Sl No.</th>
								<th>Quiz Name</th>
								<th>Start time</th>
								<th>Score percentage</th>
								<th>Rank</th>
							</tr>
							<cfoutput query="marks">
								<tr>
									<cfset Slno = Slno + 1 />
									<td>#Slno#</td>
								 	<td>#name#</td>
								 	<td>#startDateTime#</td>
							 		<td>#score# %</td>
							 		<cfset rank = object.getRanks(#marks.quizId#, #session.stLoggedInUser.userId#)/>
									<td>#rank#</td>
								</tr>
							</cfoutput>
						</table><br>
					</cfif>
				</div>
			</div>
		</div>
	</div>
</main>
</tags:studentFront>