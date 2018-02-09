<cfcomponent>
	<cfset resultSet = {} />
	<cfset resultSet["draw"] = {} />
	<cfset resultSet["recordsTotal"] = {} />
	<cfset resultSet["recordsFiltered"] = {} />
	<cfset resultSet["data"] = {} />
	<cfset searchdata = "search[value]" />
	<cfset listColumns = "active,firstName,lastName,emailid,contactNumber,name" />
	<cffunction name="getFacultyList" access="remote" returntype="Struct" returnformat="JSON">
		<cfquery name="facultyList">
			SELECT #listColumns#
			FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
			JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
			WHERE [user].[roleId] = 2;
		</cfquery>
		<cfquery name="qFiltered">
		    SELECT #listColumns#
		        FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
			JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
			WHERE [user].[roleId] = 2
		    <cfif URL[searchdata] NEQ 0>
		        AND (<cfloop list="#listColumns#" index="thisColumn">
						<cfif thisColumn neq listFirst(listColumns)> OR
						</cfif>#thisColumn# LIKE
							<cfif thisColumn is "active"><!--- special case --->
								<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#val(URL[searchdata])#" />
							<cfelseif thisColumn is "contactNumber"><!---special case--->
								<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#val(URL[searchdata])#" />
							<cfelse>
								<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(URL[searchdata])#%" />
							</cfif>
					</cfloop>)
		    </cfif>
		   ORDER BY
			<cfloop from="0" to="#listlen(listColumns)#" index="ind">
				<cfset col = "order[#ind#][column]" />
				<cfset direc = "order[#ind#][dir]" />
				<cfif structKeyExists(URL,#col#)>
					<cfif ind neq 0>,</cfif>
						#listGetAt(listColumns,ind+1)#
					<cfif structKeyExists(URL, #direc#)> #url[direc]#</cfif>
				</cfif>
			</cfloop>
		</cfquery>
		<!--- Total data set length --->
		<cfset resultSet.draw = URL.draw />
		<cfset resultSet.recordsTotal = facultyList.recordCount />
		<cfset resultSet.recordsFiltered = qFiltered.recordCount />
		<cfset resultSet.data = formatData(qFiltered) />
		<cfreturn resultSet >
	</cffunction>
	<cffunction name="formatData" access="public" returntype="any">
		<cfargument name="flist" required="true" type="any">
		<cfset startvalue = "start" />
		<cfset lengthvalue = "length" />
		<cfset dataArray=ArrayNew(2)>
		<cfset i = 1>
		<cfloop query = #arguments.flist# startRow = "#val(url[startvalue])+1#" endRow = "#val(url[startvalue]) + url[lengthvalue]#" >
				<cfset dataArray[i][1] = encodeForHtml(flist.name)>
				<cfset dataArray[i][2] = encodeForHtml(flist.firstName & ' ' & flist.lastName)>
				<cfset dataArray[i][3] = encodeForHtml(flist.emailid)>
				<cfif flist.active EQ 1 >
					<cfset dataArray[i][4] = "Yes" />
				<cfelse>
					<cfset dataArray[i][4] = "No" />
				</cfif>
				<cfset dataArray[i][5] = encodeForHtml(flist.contactNumber)>
			<cfset i = i+1 />
 		</cfloop>
		<cfreturn dataArray>
	</cffunction>
</cfcomponent>