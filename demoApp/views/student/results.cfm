<!-------------------------------------------------------------------------------------------------------------
FileName    : results.cfm
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : displays the student results.

-------------------------------------------------------------------------------------------------------------->

		<link rel = "stylesheet" type = "text/css"
			href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<div class = "page-title">
			<div class = "container">
				<h2>Performance Report</h2>
				<cfset userName = "Student name: " &
								  session.stLoggedInUser.userFirstName &
								  " " &
								  session.stLoggedInUser.userLastName />
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
				<div class = "boxed-section request-form">
					<h2 class = "section-title text-center">Performance Report</h2>
					<div class = "export" id = "exportButtons"></div>
					<table class = "table" id = "result" name = "result">
						<thead>
							<tr>
								<th>Quiz Name</th>
								<th>Start date time</th>
								<th>Score percentage</th>
								<th>Rank</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Quiz Name</th>
								<th>Start date time</th>
								<th>Score percentage</th>
								<th>Rank</th>
							</tr>
						</tfoot>
					</table><br>
				</div><!---box-section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<script type = "text/javascript"
	src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type = "text/javascript"
	src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type = "text/javascript" src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type = "text/javascript"
	src = "https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type = "text/javascript"
	src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type = "text/javascript"
	src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type = "text/javascript"
	src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type = "text/javascript"
	src = "https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script type = "text/javascript"
	src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" language="JavaScript">
	<cfoutput>
		var #toScript(userName, "userName")#;
	</cfoutput>
</script>
<cfoutput>
	<script type = "text/javascript" src = "#base#/includes/js/studentResult.js"></script>
	<script type = "text/javascript" src = "#base#/includes/js/common.js"></script>
</cfoutput>