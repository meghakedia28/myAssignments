<cfscript>
structdelete(session,"stLoggedInUser");
		sessionInvalidate();
		sessionRotate();
</cfscript>
<cfoutput>

<h1>faculty.home</h1>
</cfoutput>