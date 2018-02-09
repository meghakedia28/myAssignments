$(document).ready(function() {
	 $.noConflict();
	var userid = $('#id').val() ;
		$('#listOfFaculties').DataTable({
            "processing": true,
       		"serverSide": true,
    		"ajax": {
    			"url" : "../components/listOfFacultiesService.cfc?method=getFacultyList",
    			"data" :{}
    		},
    		  "columns": [
    		              { "DATA": "name" },
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