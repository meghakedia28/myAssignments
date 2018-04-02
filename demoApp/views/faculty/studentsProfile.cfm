<!-------------------------------------------------------------------------------------------------------------
FileName    : studentsProfile.cfm
Created By  : Megha Kedia
DateCreated : 18-March-2018
Description : displays all the students information along with view scores(
			  of the quiz set by the faculty(user) for each students.

-------------------------------------------------------------------------------------------------------------->
		<link rel = "stylesheet" type = "text/css"
			href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
		<link rel = "stylesheet"
			href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel = "stylesheet"
			href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<div class = "page-title">
			<div class = "container">
				<h2>View Students Profile</h2>
			</div>
		</div>
	</header>
</div>
<main class = "main-content">
	<div class = "container">
		<div class = "row">
			<div class = "col-md-12">
				<div class = "boxed-section request-form">
					<h2 class = "section-title text-center">Students profile:</h2>
					<div class = "export" id = "exportButtons"></div><!---export buttons--->
					<table class = "display" id = "allResult" name = "allResult">
						<thead>
							<tr>
								<th>Name</th>
								<th>Email Id</th>
								<th>Contact No.</th>
								<th>View Scores</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Name</th>
								<th>Email Id</th>
								<th>Contact No.</th>
								<th>View Scores</th>
							</tr>
						</tfoot>
					</table><br>
				</div><!---box section--->
			</div><!---col-md-12--->
		</div><!---row--->
	</div><!---conatiner--->
</main>
<div class = "modal fade" id = "viewScore" role = "dialog">
	<div class = "modal-dialog modal-lg">
	<!-- Modal content-->
	     <div class = "modal-content">
	     	<div class = "modal-header">
	       		<h4 class = "modal-title"></h4>
	        	<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
	       	</div><!--modal-header-->
			<div class = "modal-body">
				<cfoutput><input type = "hidden" id = "userId" name = "userId"
				value = "#session.stLoggedInUser.userId#"></cfoutput>
				<table class = "table table-md" id = "resultScore" name = "resultScore">
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
			</div><!--modal-body-->
			<div class = "modal-footer">
	        	<button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
	    	</div><!--modal-footer-->
		</div><!--modal-content-->
	</div><!--modal dialog-->
</div><!--modal fade-->
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
<script type = "text/javascript"
	src = "//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
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
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type = "text/javascript" src = "../../includes/js/studentsProfile.js"></script>
