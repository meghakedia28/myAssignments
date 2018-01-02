<cfif NOT isUserLoggedIn()>
	<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif structKeyExists(URL,'noaccess')>
	<p>You have already submitted your test OR the time of test has not yet started.</p>
</cfif>
<cfif structKeyExists(URL,'error')>
	<p>Something went wrong.</p>
</cfif>
<cfimport taglib = "../customTags/" prefix="tags">
	<tags:studentFront>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<div class="page-title">
			<div class="container">
				<h2>Give Quiz:</h2>
			</div>
		</div>
	</header>
</div>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
							<div class="boxed-section request-form">
								<cfif structKeyExists(URL, 'endTest')>
									<p>the test has ended</p>
								</cfif>
								<h2 class="section-title text-center">Quiz Details:</h2>
								<cfform name="questionsForm" id="questionsForm" action="testStart.cfm">
									<p class="section-title text-center">
										<cfset object =  createobject("component",'assign_10.components.getQuizDetails') />
										<cfset testDetails = object.quizDetails()>
										<cfif structKeyExists(URL,'submitEnd')>
											<p class="section-title text-center">successfully submitted</p>
											<cfinput name="startTime" id="startTime" type="hidden" value="">
											<cfinput name="endTime" id="endTime" type="hidden" value="">
											<cfinput name="nowTime" id="nowTime" type="hidden" value="">
										<cfelse>
												<cfinput name="startTime" id="startTime" type="hidden" value="#testDetails.startDateTime#">
												<cfinput name="endTime" id="endTime" type="hidden" value="#testDetails.endDateTime#">
												<cfinput name="nowTime" id="nowTime" type="hidden" value="#DateFormat(now(),'yyyy-mm-dd') & ' ' & TimeFormat(now(),'HH:nn:ss')#">
										</cfif>
										<cfoutput>
											<!--- <cfdump var = #testDetails.quizId# abort="true"> --->
											<cfif testDetails.quizId NEQ '' >
												<h3 class="section-title text-center"> Next test is at : #testDetails.startDateTime#</h3>
												<h3 class="section-title text-center"> Quiz Name: #testDetails.quizName#</h3>
												<h3 class="section-title text-center"> Subject : #testDetails.subjectName#</h3>
												<h3 class="section-title text-center"> Faculty : #testDetails.firstName# #testDetails.lastName#</h3>
											<cfelse>
												<h2> No test is yet to come.<br /> Tests will be displayed once the faculties set the upcoming tests.</h2>
											</cfif>
										</cfoutput>
									</p>
									<div class="field no-label">
									<div class="control  text-center">
 											<!--<button type="submit" class="button text-center" id="startTest" name="startTest" value="<cfoutput>#testDetails.quizId#</cfoutput>" disabled="true" >Start test</button> -->
 											<span id="fooBar">&nbsp;</span>
									</div>
 									</div>
								</cfform>
							</div> <!-- .boxed-section .request-form -->
						</div>
		</main>
		<script>
			(function(){
				var serverTime = new Date($('#nowTime').val()).getTime();
				var startTime = new Date($('#startTime').val()).getTime();
				var endTime = new Date($('#endTime').val()).getTime();
				var displayDiff = startTime - serverTime ;
				var escapeDiff = endTime - startTime;
				var diff = endTime - serverTime;
				if (serverTime < startTime){
					setTimeout(function(){createButton(escapeDiff);},displayDiff);
				}
				else if (serverTime >= startTime && serverTime <= endTime){
					createButton(diff);
				}

				var questionsForm = $('#questionsForm');

				function createButton(time){
					var element = $('<button type="submit" class="button text-center" id="startTest" name="startTest">Start test</button>');
					$('#fooBar').append(element);
					setTimeout(function(){$('#startTest').remove();},time);
				}
			})();
		</script>
		<script src="../js/testValidate.js"></script>
</tags:studentFront>