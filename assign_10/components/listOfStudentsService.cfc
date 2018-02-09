<cfcomponent>
	<cfset resultSet = {} />
	<cfset resultSet["draw"] = {} />
	<cfset resultSet["recordsTotal"] = {} />
	<cfset resultSet["recordsFiltered"] = {} />
	<cfset resultSet["data"] = {} />
	<cfset searchdata = "search[value]" />
	<cfset listColumns = "active,firstName,lastName,emailid,contactNumber" />
	<cffunction name="getStudentsList" access="remote" returntype="Struct" returnformat="JSON">
		<cfquery name="studentList">
			SELECT  #listColumns# FROM [user]
			WHERE [user].[roleId] = 3;
		</cfquery>
		<cfquery name="qFiltered">
		    SELECT #listColumns# FROM [user]
			WHERE [user].[roleId] = 3
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
		<cfset resultSet.recordsTotal = studentList.recordCount />
		<cfset resultSet.recordsFiltered = qFiltered.recordCount />
		<cfset resultSet.data = formatData(qFiltered) />
		<cfreturn resultSet >
	</cffunction>
	<cffunction name="formatData" access="public" returntype="any">
		<cfargument name="slist" required="true" type="any">
		<cfset startvalue = "start" />
		<cfset lengthvalue = "length" />
		<cfset dataArray=ArrayNew(2)>
		<cfset i = 1>
		<cfloop query = #arguments.slist# startRow = "#val(url[startvalue])+1#" endRow = "#val(url[startvalue]) + url[lengthvalue]#" >
				<cfset dataArray[i][1] = encodeForHtml(slist.firstName & ' ' & slist.lastName)>
				<cfset dataArray[i][2] = encodeForHtml(slist.emailid)>
				<cfif slist.active EQ 1 >
					<cfset dataArray[i][3] = "Yes" />
				<cfelse>
					<cfset dataArray[i][3] = "No" />
				</cfif>
				<cfset dataArray[i][4] = encodeForHtml(slist.contactNumber)>
			<cfset i = i+1 />
 		</cfloop>
		<cfreturn dataArray>
	</cffunction>
</cfcomponent>