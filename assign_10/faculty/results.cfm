﻿<cfif NOT isUserLoggedIn() || session.stLoggedInUser.roleId NEQ 2>
		<cflocation url = "../comman/loginPage.cfm?noaccess">
</cfif>
<cfmodule template="../customTags/facultyFront.cfm" >
	<div class="page-title">
		<div class="container">
			<h2>View results</h2>
		</div>
	</div>
</header>
</div>
		<main class="main-content">
			<div class="fullwidth-block inner-content">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<form action="#" class="contact-form">
								<p>
									<label for="name">Name</label>
									<span class="control"><input type="text" id="name" placeholder="Your name"></span>
								</p>
								<p>
									<label for="email">Email</label>
									<span class="control"><input type="text" id="email" placeholder="Email"></span>
								</p>
								<p>
									<label for="website">Website</label>
									<span class="control"><input type="text" id="website" placeholder="Website"></span>
								</p>
								<p>
									<label for="message">Name</label>
									<span class="control"><textarea id="message" placeholder="Message"></textarea></span>
								</p>
								<p class="text-right">
									<input type="submit" value="Send message">
								</p>
							</form>
						</div>
						<div class="col-md-6">
							<div class="contact-info">
								<address>
									<strong>Address</strong>
									<p>Company Name INC. <br>290-2912 Oits Ave <br>Bronx, NY 10465</p>
								</address>
								<div class="contact">
									<strong>Contact</strong>
									<p>
										<a href="tel:532930098891">(532) 930 098 891</a>
										<a href="mailto:office@companyname.com">office@companyname.com</a> <br>
														
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- .fullwidth-block -->
		</main>
	</cfmodule>