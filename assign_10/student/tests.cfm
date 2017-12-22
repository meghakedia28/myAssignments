<cfif NOT isUserLoggedIn()>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfif structKeyExists(URL,'noaccess')>
	<p>You can access the test page only at the time of test.</p>
</cfif>
<!--- <cfif structKeyExists(form,'startTest')> --->
<!--- 	<cfset testValidation = createobject("component",'assign_10.components.testValidationService') /> --->
<!--- 	<cfset validTime =  testValidation.checkTestTime() /> --->
<!--- 	<cfdump var = #session# abort="true"/> --->
<!--- </cfif> --->
<cfmodule template="../customTags/studentFront.cfm" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../js/testValidate.js"></script>
		<div class="page-title">
			<div class="container">
				<h2>Add questions</h2>
			</div>
		</div>
	</header>
</div>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
							<div class="boxed-section request-form">
								<h2 class="section-title text-center">Question Details:</h2>
								<cfform name="questionsForm" id="questionsForm" action="testStart.cfm">
									<p class="section-title text-center">
										<cfset object =  createobject("component",'assign_10.components.getQuizDetails') />
										<cfset testDetails = object.quizDetails()>
										<cfoutput>
										<h3 class="section-title text-center"> Next test is at : #testDetails.startDateTime#</h3>
										<h3 class="section-title text-center"> Quiz Name: #testDetails.quizName#</h3>
										<h3 class="section-title text-center"> Subject : #testDetails.subjectName#</h3>
										<h3 class="section-title text-center"> Faculty : #testDetails.firstName# #testDetails.lastName#</h3>
										</cfoutput>
									</p>
									<cfinput type="hidden" name="randomString" id="randomString" value="">
									<cfinput name="startTime" id="startTime" type="hidden" value="#testDetails.startDateTime#">
									<cfinput name="endTime" id="endTime" type="hidden" value="#testDetails.endDateTime#">
									<cfinput name="nowTime" id="nowTime" type="hidden" value="#DateFormat(now(),'yyyy-mm-dd') & ' ' & LSTimeFormat(now(),'hh:mm:ss')#">

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
</cfmodule>