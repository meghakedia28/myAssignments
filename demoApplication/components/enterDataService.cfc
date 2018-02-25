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
				<cfset mailObject = createObject('component','demoApplication/components/mailService').sendMails('#data.email#',"#data.firstName#","#code#")/>
			</cftransaction>
			<cfreturn true>
			<cfcatch type="any" >
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
	<cffunction name="updateUserData" access="public" returntype="boolean">
		<cfargument name="data" required="true" type="struct" >
		<cfargument name="id" required="true" type="numeric">
		<cftry>
			<cftransaction>
				<cfquery name="updateuserDetails">
					UPDATE [user]
						SET [user].[firstName] = <cfqueryparam value="#data.firstName#" cfsqltype="cf_sql_varchar">,
						[user].[lastName] = <cfqueryparam value="#data.lastName#" cfsqltype="cf_sql_varchar">,
						[user].[contactNumber] = <cfqueryparam value="#data.contactNumber#" cfsqltype="cf_sql_varchar">,
						[subject].[name] = <cfqueryparam value="#data.subject#" cfsqltype="cf_sql_varchar">
						FROM  [subject] JOIN [userSubject] ON [subject].[subjectId] = [userSubject].[subjectId]
						JOIN [user] ON [user].[userId] = [userSubject].[userId]
						WHERE [user].[userId] = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">
				</cfquery>
				<cfquery name="updateSubject">
					UPDATE [subject]
						SET	[subject].[name] = <cfqueryparam value="#data.subject#" cfsqltype="cf_sql_varchar">
						FROM  [subject] JOIN [userSubject] ON [subject].[subjectId] = [userSubject].[subjectId]
						JOIN [user] ON [user].[userId] = [userSubject].[userId]
						WHERE [user].[userId] = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">
				</cfquery>
			</cftransaction>
			<cfreturn true>
			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>