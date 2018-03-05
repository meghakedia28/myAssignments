<!---
NAME : enterDataService.cfc
CREATED BY : Megha Kedia
USE: insertion and updation of user information--->

<cfcomponent output = "false" extends = "addValidation" >
	<!---insertData : insert user information in db--->
	<cffunction name = "insertData" access = "public" output = "false" returnType = "boolean" >
		<cfargument name = "data" type = "struct" required = "true" >
		<cfargument name = "role"	type = "numeric" required = "true">
		<cftry>
			<!---insert subject--->
			<cftransaction>
				<cfif StructKeyExists(arguments.data,'subject')>
					<cfquery >
						INSERT INTO [subject]
						(name) VALUES (
						<cfqueryparam value = "#data.subject#" cfsqltype = "cf_sql_varchar" > )
					</cfquery>
					<cfquery name = "getSubjectId">
						SELECT [subjectId] FROM [subject]
						WHERE [name] = <cfqueryparam value = "#data.subject#" cfsqltype = "cf_sql_varchar" >
					</cfquery>
				</cfif>
				<cfquery>
					INSERT INTO [user]
					(firstName,lastName,emailid,contactNumber,roleId,active) VALUES (
					<cfqueryparam value = "#data.firstName#" cfsqltype = "cf_sql_varchar" >,
					<cfqueryparam value = "#data.lastName#" cfsqltype = "cf_sql_varchar" >,
					<cfqueryparam value = "#data.email#" cfsqltype = "cf_sql_varchar" >,
					<cfqueryparam value = "#data.contactNumber#" cfsqltype = "cf_sql_varchar" >,
					<cfqueryparam value = "#role#" cfsqltype = "cf_sql_integer" >,
					<cfqueryparam value = "0" cfsqltype = "cf_sql_integer">)
				</cfquery>
				<cfquery name = "getUserId">
					SELECT [userId] FROM [user]
					WHERE [emailid] = <cfqueryparam value = "#data.email#" cfsqltype = "cf_sql_varchar" >
				</cfquery>
				<cfset var code = Hash(GenerateSecretKey("AES"),"SHA-512" )>
				<cfquery>
					UPDATE [user]
					SET salt = <cfqueryparam value = "#code#" cfsqltype = "cf_sql_varchar">
					WHERE [userId] = <cfqueryparam value = "#getUserId.userId#" cfsqltype = "cf_sql_bigint">
				</cfquery>
				<cfif StructKeyExists(arguments.data,'subject')>
					<cfquery>
						INSERT INTO [userSubject]
						(userId,subjectId) VALUES (
						<cfqueryparam value = "#getUserId.userId#" cfsqltype = "cf_sql_bigint">,
						<cfqueryparam value = "#getSubjectId.subjectId#" cfsqltype = "cf_sql_bigint"> )
					</cfquery>
				</cfif>
				<!---create mailService object--->
				<cfset mailObject = createObject('component','demoApplication/components/mailService').sendMails('#data.email#',"#data.firstName#","#code#")/>
			</cftransaction>
			<cfreturn true>
			<cfcatch type = "database">
				<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
				<cfreturn false>
			</cfcatch>
			<cfcatch type = "any" >
				<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
	<!---updateUserInformationController : fetches userid to valiadte user exists or not, then calls all validation
	 is successfully validates the data then the updateUserInformation is done--->
	<cffunction name = "updateUserInformationController" access = "remote" returntype = "Struct" returnformat = "JSON">
		<cftry>
			<cfquery name = "userExists">
				SELECT [userId] FROM [user]
				WHERE [user].[emailid] = <cfqueryparam value = "#url.emailId#" cfsqltype = "cf_sql_varchar">
			</cfquery>
		<cfcatch type = "database">
			<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
			<cfset variables.insertionStruct.successfull = "false">
			<cfset variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.">
			<cfreturn variables.insertionStruct>
		</cfcatch>
		<cfcatch type = "any">
			<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset variables.insertionStruct.successfull = "false">
			<cfset variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.">
			<cfreturn variables.insertionStruct>
		</cfcatch>
		</cftry>
		<cftry >
			<cfif userExists.RecordCount NEQ 0>
				<cfset validateAllFields(userExists.userId) />
				<cfif StructIsEmpty(variables.errorStruct.errorId)>
					<cfset insertion = updateUserData(url,userExists.userId) />
					<cfif (insertion) >
						<cfset variables.insertionStruct.successfull = "true">
						<cfset variables.insertionStruct.message = "Data has been updated successfully">
						<cfreturn variables.insertionStruct>
					<cfelse>
						<cfset variables.insertionStruct.successfull = "false">
						<cfset variables.insertionStruct.message = "Error occured while updation of data.">
						<cfreturn variables.insertionStruct>
					</cfif>
				<cfelse>
					<cfreturn variables.errorStruct>
				</cfif>
			</cfif>
		<cfcatch type = "any">
			<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
			<cfset variables.insertionStruct.successfull = "false">
			<cfset variables.insertionStruct.message = "Some unexpected error has occured, Please try again later.">
			<cfreturn variables.insertionStruct>
		</cfcatch>
		</cftry>
	</cffunction>
	<!---updateUserData : update user information in db--->
	<cffunction name = "updateUserData" access = "public" returntype = "boolean">
		<cfargument name = "data" required = "true" type = "struct" >
		<cfargument name = "id" required = "true" type = "numeric">
			<cftry>
				<cftransaction>
					<cfquery>
						UPDATE [user]
							SET [user].[firstName] = <cfqueryparam value = "#data.firstName#" cfsqltype = "cf_sql_varchar">,
							[user].[lastName] = <cfqueryparam value = "#data.lastName#" cfsqltype = "cf_sql_varchar">,
							[user].[active] = <cfqueryparam value = "#data.active#" cfsqltype = "cf_sql_integer">,
							[user].[contactNumber] = <cfqueryparam value = "#data.contactNumber#" cfsqltype = "cf_sql_varchar">
							FROM [user]
							<cfif structKeyExists(url,"subject")>
								JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
								JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
							</cfif>
							WHERE [user].[userId] = <cfqueryparam value = "#arguments.id#" cfsqltype = "cf_sql_bigint">
						</cfquery>
						<cfif structKeyExists (data,"subject")>
							<cfquery>
								UPDATE [subject]
									SET [subject].[name] = <cfqueryparam value = "#data.subject#" cfsqltype = "cf_sql_varchar">
									FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
									JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
									WHERE [user].[userId] = <cfqueryparam value = "#arguments.id#" cfsqltype = "cf_sql_bigint">
			 				</cfquery>
		 				</cfif>
		 			</cftransaction>
			 	<cfcatch type = "database">
					<cflog file = "dbErrors" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cflog file = "dbErrors" application = "yes" type = "error" text = "#cfcatch.queryError#" >
					<cfreturn false>
				</cfcatch>
				<cfcatch type = "any">
					<cflog file = "error" text = "#cfcatch.message# #cfcatch.detail# #cfcatch.ExtendedInfo#" type = "Error" application = "yes">
					<cfreturn false>
				</cfcatch>
			</cftry>
		<cfreturn true>
	</cffunction>
</cfcomponent>