<!---<html>
	<head>
		<script src="../js/jquery-1.11.1.min.js"></script>
		<script src="../js/plugins.js"></script>
		<script src="../js/app.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
 
 <script>
  	 	<!---$.noConflict();--->
		jQuery(document).ready(function(){
    $("#startTime").timepicker({});
	  $( function() {
 		   $( "#date" ).datepicker({
		   	minDate: 0 
		   });
 		 } );
});
</script>
</head>
<body>
<cfform name="fghf">
<cfinput type="text" id="startTime" name="startTime" placeholder="Enter the start time">
<cfinput type="text" id="date" name="date" placeholder="Enter the date of the test">
</cfform>
</body>
</html>
<html>
	<head>
</html>
<script src="../js/jquery-1.11.1.min.js"></script>
		<script src="../js/plugins.js"></script>
		<script src="../js/app.js"></script>
<link rel="stylesheet" type="text/css" href="/jquery.datetimepicker.css"/ >
<script src="/jquery.js"></script>
<script src="/build/jquery.datetimepicker.full.min.js"></script>
<script>
	$.noConflict();
$('#datetimepicker').datetimepicker();
</script>
</head>
<body>
	<input id="datetimepicker" type="text" >
</body>
</html>
<cfset myList="John,Paul|George|Ringo"/>
<cfloop list="#myList#" delimiters=",|" index="na">
    <cfoutput>
        #name#
    </cfoutput>
</cfloop>--->
<cfdump var = "#form#">
<cfdump var = #form.QUESTIONID#>
<cfloop list="#form.QUESTIONID#" delimiters="," index="ind">
	<cfset i = #ind#>
	<cfoutput> #ind#
	#IsNumeric(i)#</cfoutput>
</cfloop>
<cfset a = #setQuiz(#form#,#session.stLoggedInUser.userId#)#>
<cfdump var = #a#>
<cffunction name="setQuiz" access="remote" output="false" returntype="boolean" >
		<cfargument name="data" required="true" type="struct">
		<cfargument name="id" required="true" type="numeric" >  
		<cfdump var = #data# >
		<cfdump var = #id# > 
		<cfset end = #data.startTime#>
		
		<cfset questionsList = #data.questionId#>
		<cftry>
			
				<cfquery name="insertQuiz">
				INSERT INTO [quiz]
				VALUES (
					<cfqueryparam value="#data.quizName#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.startTime#" cfsqltype="cf_sql_datetime" >,
					<cfqueryparam value="#data.startTime#" cfsqltype="cf_sql_datetime" >,
					<cfqueryparam value="#id#" cfsqltype="cf_sql_bigint" >)
				</cfquery> 
				
				<cfquery name="insertId">
					SELECT [quiz].[quizId] FROM [quiz]
					WHERE [name] = <cfqueryparam value ="#data.quizName#" cfsqltype="cf_sql_varchar" >
				</cfquery>
				<cfif insertId.RecordCount EQ 1>
				<cfquery name="end">
					SELECT [endDateTime] FROM [QUIZ] 
					WHERE [name] = <cfqueryparam value ="#data.quizName#" cfsqltype="cf_sql_varchar" >
				</cfquery>
				<cfquery name="getTime" >
					select DATEADD (n, #data.endTime#,'#end.endDateTime#') 'RESULT'
				</cfquery>
				<cfquery name="updateEndDateTime">
					UPDATE [quiz] 
					SET [endDateTime] = <cfqueryparam value= #getTime.RESULT# cfsqltype="cf_sql_datetime" > 
					WHERE [quizId] = <cfqueryparam value="#insertId.quizId#" cfsqltype="cf_sql_bigint">
				</cfquery>
				<cfdump var = #insertId#>
				<cfdump var = #end#>
				<cfdump var = #getTime# abort ="true" >
				
				<cfloop list="#questionsList#" delimiters="," index="ind">
				<cfquery name="insertQuizQuestion">
					INSERT INTO [quizQuestion]
					VALUES (
					<cfqueryparam value="#ind#" cfsqltype="cf_sql_numeric" >,
					<cfqueryparam value="#insertId.quizId#" cfsqltype="cf_sql_bigint">)
				</cfquery>
				</cfloop>
				<cfelse >
					<cfreturn false>
				</cfif>
				<cfreturn true>			
			<cfcatch type="any" >
				<cfreturn false>
			</cfcatch>
		</cftry>		
	</cffunction> 