<cfset sessionExists = structKeyExists(session,"stLoggedInUser") />
<cfif NOT(sessionExists)>
	<cfdump var = "hvfd" abort>
	<cfscript>
		setNextEvent(event = "common.loginPage?noaccess");
	</cfscript>
<cfelseif session.stLoggedInUser.roleId NEQ 2>
	<cfscript>
		setNextEvent(event = "common.loginPage?noaccess");
	</cfscript>
</cfif>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<div class = "home-slider">
			<div class = "container">
				<div class = "slider">
					<ul class = "slides">
						<li>
							<div class = "slide-caption">
								<h2 class = "slide-title">I Love to learn! <br> Welcome back school!</h2>
								<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
							</div>
							<img src = "../../includes/images/kid.jpg" alt = "">
						</li>
						<li>
							<div class = "slide-caption">
								<h2 class = "slide-title">I Love to Read! <br> Welcome back school!</h2>
								<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
							</div>
							<img src = "../../includes/images/kid.jpg" alt = "">
						</li>
						<li>
							<div class = "slide-caption">
								<h2 class = "slide-title">I Love to Play! <br> Welcome back school!</h2>
								<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
							</div>
							<img src = "../../includes/images/kid.jpg" alt = "">
						</li>
					</ul> <!-- .slides -->
				</div> <!-- .slider -->
			</div> <!-- .container -->
		</div> <!-- .home-slider -->
	<!---end of header--->
	</header>
</div>
<script src = "../../includes/js/freeTemplatePlugins/jquery-1.11.1.min.js"></script>
<script src = "../../includes/js/freeTemplatePlugins/plugins.js"></script>
<script src = "../../includes/js/freeTemplatePlugins/app.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
