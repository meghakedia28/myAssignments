<cfcomponent output="false">
	<cffunction name="insertTest" access="remote" output="false" returntype="boolean" returnformat="JSON">
		<cftry>
 			<cftransaction>
				<cfquery name ="getQuizQuestion">
					SELECT [quizQuestionId] FROM [quizQuestion]
					WHERE [quizId] = <cfqueryparam value = "#session.stQuizStarts.quizId#" cfsqltype="cf_sql_bigint" />
					ORDER BY [quizQuestionId];
				</cfquery>
				<cfloop query = "getQuizQuestion">
					<cfif (NOT (structKeyExists(URL,#getQuizQuestion.quizQuestionId#)))>
						<cfset answer = "0" />
					<cfelse>
						<cfset answer = StructFind(URL,"#getQuizQuestion.quizQuestionId#") />
					</cfif>
					<cfquery name="insertScore">
						INSERT INTO [score]
						VALUES (
						<cfqueryparam value= "#session.stLoggedInUser.userId#" cfsqltype="cf_sql_bigint">,
						<cfqueryparam value = "#getQuizQuestion.quizQuestionId#" cfsqltype="cf_sql_bigint">,
						<cfqueryparam value = "#answer#" cfsqltype="cf_sql_varchar"> );
 					</cfquery>
				</cfloop>
				<cfset endsession = #destroySession()# />
 			 </cftransaction>
	  			<cfreturn true>
 			<cfcatch type="any">
 				<cfreturn false>
  			</cfcatch>
  		</cftry>
	</cffunction>
	<cffunction name="destroySession" output="false" access="remote">
		<cfif structKeyExists(session, 'stQuizStarts') >
			<cfset structdelete(session, 'stQuizStarts') />
		</cfif>
	</cffunction>
</cfcomponent>