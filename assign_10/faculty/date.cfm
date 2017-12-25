<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  
 
</head>
<body>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 <script>
  $( function() {
    $( "#date" ).datepicker();
  } );
  </script>
 <cfform name="form" action="" id ="form" >
<p>Date: <cfinput type="text" name="date" id="date"></p>
<cfoutput>
 <cfinput type="checkbox" name="SelectedDepts" value="4"> Sales<br> 
</cfoutput> </cfform>
</body>
</html>