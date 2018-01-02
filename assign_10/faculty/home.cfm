<cfif NOT isUserLoggedIn() || session.stLoggedInUser.roleId NEQ 2>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
		<cfimport taglib = "../customTags/" prefix="tags">
			<tags:facultyFront>
				<div class="home-slider">
					<div class="container">
						<div class="slider">
							<ul class="slides">
								<li>
									<div class="slide-caption">
										<h2 class="slide-title">I Love to learn! <br> Welcome back school!</h2>
										<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
									</div>
									<img src="../dummy/kid.jpg" alt="">
								</li>
								<li>
									<div class="slide-caption">
										<h2 class="slide-title">I Love to Read! <br> Welcome back school!</h2>
										<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
									</div>
									<img src="../dummy/kid.jpg" alt="">
								</li>
								<li>
									<div class="slide-caption">
										<h2 class="slide-title">I Love to Play! <br> Welcome back school!</h2>
										<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
									</div>
									<img src="../dummy/kid.jpg" alt="">
								</li>
							</ul> <!-- .slides -->
						</div> <!-- .slider -->
					</div> <!-- .container -->
				</div> <!-- .home-slider -->
	<!---end of header--->
		</header>
	</div>
</tags:facultyFront>
