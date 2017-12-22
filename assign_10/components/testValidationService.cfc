<cfcomponent output="false" >
	<cffunction name="checkTestTime" output="false" access="remote" returntype="boolean" returnformat="JSON">
		<cfset object =  createobject("component",'assign_10.components.getQuizDetails') />
		<cfset testDetails = object.quizDetails()>
		<cfset startTime =  #testDetails.startDateTime# />
		<cfset endTime =  #testDetails.endDateTime# />
		<cfset var currentTime = (DateFormat(now(),'yyyy-mm-dd') & ' ' & LSTimeFormat(now(),'hh:mm:ss')) />
		<cfif !((#currentTime# GTE #startTime#) AND (#currentTime# LTE #endTime#))>
			<cfreturn false>
		<cfelse>
			<cflock scope="session" timeout="30" >
				<cfset session.stQuizStarts = {'quizId' = #testDetails.quizId# , 'startTime' = #testDetails.startDateTime#, 'endTime' = #testDetails.endDateTime# } />
			</cflock>
			<cfreturn true>
		</cfif>
	</cffunction>
	<cffunction name="destroySession" output="false" access="remote">
		<cfif structKeyExists(session, 'stQuizStarts') >
			<cfset structdelete(session, 'stLoggedInUser') />
		</cfif>
	</cffunction>
</cfcomponent>