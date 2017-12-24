<cfcomponent output="false">
	<cffunction name="insertData" access="public" output="false" returnType="boolean" >
		<cfargument name="data" type="struct" required="true" >
		<cfargument name="role"	type="numeric" required="true">
		<cftry>
			<!---insert subject--->
			<cftransaction>
				<cfif StructKeyExists(arguments.data,'subject')>
					<cfquery name="insertSubject" >
						INSERT INTO [subject]
						(name) VALUES (
						<cfqueryparam value="#data.subject#" cfsqltype="cf_sql_varchar" > )
					</cfquery>
					<cfquery name="getSubjectId">
						SELECT [subjectId] FROM [subject]
						WHERE [name] = <cfqueryparam value="#data.subject#" cfsqltype="cf_sql_varchar" >
					</cfquery>
				</cfif>
				<cfquery name="insertion">
					INSERT INTO [user]
					(firstName,lastName,emailid,contactNumber,roleId,active) VALUES (
					<cfqueryparam value="#data.firstName#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.lastName#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.email#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#data.contactNumber#" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="#role#" cfsqltype="cf_sql_integer" >,
					0)
				</cfquery>
				<cfquery name="getUserId">
					SELECT [userId] FROM [user]
					WHERE [emailid] = <cfqueryparam value="#data.email#" cfsqltype="cf_sql_varchar" >
				</cfquery>
				<cfset var code = Hash(GenerateSecretKey("AES"),"SHA-512" )>
				<cfquery name="insertSalt">
					UPDATE [user]
					SET salt = '#code#'
					WHERE [userId] = #getUserId.userId#
				</cfquery>
				<cfif StructKeyExists(arguments.data,'subject')>
					<cfquery name="insertUserSubject">
						INSERT INTO [userSubject]
						(userId,subjectId) VALUES (#getUserId.userId#, #getSubjectId.subjectId#)
					</cfquery>
				</cfif>
				<!---create mailService object--->
					<cfset mailObject = createobject('component','assign_10/components/mailService').sendMails('#data.email#',"#data.firstName#","#code#")/>
			</cftransaction>
			<cfreturn true>
			<cfcatch type="any" >
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>