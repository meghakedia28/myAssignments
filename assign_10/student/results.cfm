<cfif NOT isUserLoggedIn()>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfmodule template="../customTags/studentFront.cfm" >
	<script>
		
	
	</script>
	</script>
	<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
							<div class="boxed-section request-form">
								<div class="control">
									<button type="submit" class="button" id="addQuestions" name="addQuestions" > Done </button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
</cfmodule>