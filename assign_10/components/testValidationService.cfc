<cfcomponent output="false" >
	<cffunction name="checkTestTime" output="false" access="remote" returntype="boolean" returnformat="JSON">
		<cfset object =  createobject("component",'assign_10.components.getQuizDetails') />
		<cfset testDetails = object.quizDetails()>
		<cfset startTime =  #testDetails.startDateTime# />
		<cfset endTime =  #testDetails.endDateTime# />
		<cfset var currentTime = (DateFormat(now(),'yyyy-mm-dd') & ' ' & LSTimeFormat(now(),'hh:mm:ss')) />
		<cftry>
		<cftransaction>
		<cfquery name="checkTestOver">
			SELECT [score].[scoreId] FROM [score] JOIN [quiz]
			ON [score].[quizId] = [quiz].[quizId]
			WHERE [score].[userId] = <cfqueryparam value="#session.stLoggedInUser.userId#" cfsqltype="cf_sql_bigint"> AND
			[quiz].[quizId] = <cfqueryparam value="#testDetails.quizId#" cfsqltype="cf_sql_bigint">
		</cfquery>
		<cfif !((#currentTime# GTE #startTime#) AND (#currentTime# LTE #endTime#) AND (checkTestOver.RecordCount EQ 0)) >
			<cfreturn false>
		<cfelse>
			<cflock scope="session" timeout="30" >
				<cfset session.stQuizStarts = {'quizId' = #testDetails.quizId# , 'startTime' = #testDetails.startDateTime#, 'endTime' = #testDetails.endDateTime# } />
			</cflock>
				<cfreturn true>
		</cfif>
		</cftransaction>
		<cfreturn true>
		<cfcatch type="any">
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>