<!-------------------------------------------------------------------------------------------------------------
FileName    : addQuestions.cfm
Created By  : Megha Kedia
DateCreated : 18-March-2018
Description : has a form to add questions.

-------------------------------------------------------------------------------------------------------------->
		<div class = "page-title">
			<div class = "container">
				<h2>Add questions</h2>
			</div>
		</div>
	</header>
</div>
	<link rel = "stylesheet" type = "text/css"
			href = "//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
	<link rel = "stylesheet" type = "text/css"
			href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel = "stylesheet" type = "text/css"
			href = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<main class = "main-content">
			<div class = "container">
				<div class = "mid-row">
					<div class = "col-md-8">
						<div class = "boxed-section request-form">
							<h2 class = "section-title text-center">Question Details</h2>
							<!---form to add questions--->
							<cfform name = "questionsForm" id = "questionsForm" action = "">
								<div class = "field">
									<label for = "question">Question:</label>
									<div class = "control"><cftextarea class = "inputField"
										id = "question" name = "question" placeholder = "Enter the question">
										</cftextarea>
									<div class = "error-msg" id = "error_question"></div></div>
								</div><!---end of field--->
								<div class = "field">
									<label for = "optionA">Option A:</label>
									<div class = "control"><cfinput class = "inputField" type = "text"
										id = "optiona" name = "optiona" placeholder = "Enter the first option">
									<div class = "error-msg" id = "error_optiona"></div></div>
								</div><!---end of field--->
								<div class = "field">
									<label for = "optionB">Option B:</label>
									<div class = "control"><cfinput class = "inputField" type = "text"
										id = "optionb" name = "optionb" placeholder = "Enter the second option">
									<div class = "error-msg" id = "error_optionb"></div></div>
								</div><!---end of field--->
								<div class = "field">
									<label for = "optionC">Option C:</label>
									<div class = "control"><cfinput class = "inputField" type = "text"
										id = "optionc" name = "optionc" placeholder = "Enter the third option">
									<div class = "error-msg" id = "error_optionc"></div></div>
								</div><!---end of field--->
								<div class = "field">
									<label for = "optionD">Option D:</label>
									<div class = "control"><cfinput class = "inputField" type = "text"
										id = "optiond" name = "optiond" placeholder = "Enter the fourth option">
									<div class = "error-msg" id = "error_optiond"></div></div>
								</div><!---end of field--->
								<div class = "field">
									<label for = "correctAnswer">Correct Answer:</label>
									<div class = "control">
										<cfselect class = "inputField" id = "answer" name = "answer" >
											<option value = "">Select the correct option</option>
											<option value = "option1">Option A</option>
											<option value = "option2">Option B</option>
											<option value = "option3">Option C</option>
											<option value = "option4">Option D</option>
										</cfselect>
										<div class = "error-msg" id = "error_answer"></div>
									</div>
								</div><!---end of field--->
								<div class = "field no-label">
									<div class = "control">
										<button type = "submit" class = "button" id = "addQuestions"
											name = "addQuestions" > Done </button>
									</div>
								</div><!---end of field no-label--->
							</cfform>
						</div> <!--- .boxed-section .request-form --->
					</div><!---col-md-6--->
				</div><!---row--->
			</div><!---container--->
		</main>
	<script type = "text/javascript"
			src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type = "text/javascript"
			src = "https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
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
	<script type = "text/javascript"
			src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type = "text/javascript"
			src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<cfoutput>
		<script type = "text/javascript"
				src = "#base#/includes/js/addQuestions.js"></script>
	</cfoutput>
	<script type = "text/javascript"
			src = "../../includes/js/common.js"></script>
	<script type = "text/javascript"
			src = "../../includes/js/validateQuestions.js"></script>