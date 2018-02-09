$(document).ready(function() {
	 $.noConflict();
	var userid = $('#id').val() ;
		$('#listOfStudents').DataTable({
            "processing": true,
       		"serverSide": true,
    		"ajax": {
    			"url" : "../components/listOfStudentsService.cfc?method=getStudentsList",
    			"data" :{}
    		},
    		  "columns": [
    		              { "DATA": "firstname & lastname" },
    		              { "DATA": "emailid" },
    		              { "DATA": "active",
    		            	  render: function (DATA) {
    		            		  if (DATA){
    		            			  return "Yes"
    		            		  }
    		            		  else{
    		            			  return "No"
    		            		  }    		            			  
    		            	  },},
    		              { "DATA": "contactNumber"}
    		          ]
        });
	});