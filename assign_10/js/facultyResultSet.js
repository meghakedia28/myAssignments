$(document).ready(function(){
	$('#quiz').DataTable();
	$('#result').DataTable();
	$('#submitForm').click(function(){
		var postData = $('form').serialize();
		$.ajax({
			url : "../components/facultyResultSet.cfc?method=filterOnQuiz",
			data : {
				arrayOfQuizId : "&"+postData
			},
			success : function(result){
				var slNo = 0;
				var row = "";
				title = "<thead><tr><th>Sl No.</th><th>Quiz Name</th><th>Start date time</th><th>End date time</th><th>Student's name</th><th>Score percentage</th><th>Rank</th></tr></thead>"
				var obj = $.parseJSON(result);
				 $.each(obj, function( index, value ) {
					 slNo = slNo + 1;
                     row = row +"<tbody><tr><td>" + slNo + "</td><td>" + value.NAME + "</td><td>" + value.STARTDATETIME +
                    		 "</td><td>" + value.ENDDATETIME + "</td><td>" + value.FIRSTNAME + " " + value.LASTNAME +
                    		 "</td><td>" + (parseFloat(value.SCORE / 100.00)*100.00).toFixed(2) + " %" + "</td><td>" + value.RANK + "</td></tr></tbody>" ;
                     
                  });
				 $("#filterTable").html('');
				 if (row != ''){
					 $("#result").hide();
					 $('#filterTable').DataTable();
					 $("#filterTable").append(title+row);
				 }
				 else{
					 $("#filterTable").html("No student has given this test");
				 }
              },
			});
		});
	});
