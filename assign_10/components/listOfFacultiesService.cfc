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
			SELECT [user].[userId], #listColumns#
			FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
			JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
			WHERE [user].[roleId] = 2;
		</cfquery>
		<cfquery name="qFiltered">
		    SELECT [user].[userId], #listColumns#
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
				<cfset dataArray[i][6] = "<button type='button' class='btn btn-success btn-md' id = 'edit' name='edit' data-toggle='modal' data-target='##rowEdit' data-id='#flist.userId#'><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>edit</button>
				<button type='button' class='btn btn-danger btn-md' id = 'edit' name='edit' data-toggle='modal' data-target='##rowDelete'><i class='glyphicon glyphicon-trash'>&nbsp</i>Delete</button>" />
			<cfset i = i+1 />
 		</cfloop>
		<cfreturn dataArray>
	</cffunction>
	<cffunction name="populateData" access="remote" returntype="String" returnformat="plain">
		<cfargument name="id" required="true" type="numeric">
		<cfset variables.html = "" />
		<cfquery name="facultyList">
			SELECT #listColumns#
			FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
			JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
			WHERE [user].[userId]= <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">;
		</cfquery>
		<cfsavecontent variable="variables.html" >
			<cfoutput>
			<form class="form-horizontal" method="post">
			<div class="modal-content">
		        <div class="modal-header">
			    	<h4 class="modal-title">Edit record:</h4>
		         		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div><!--modal-header-->
				<div class="modal-body">
				<!--form inside the modal-->
					<form class="form-horizontal" name="editForm" id="editForm" action="">
						<div class="box-body">
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="subject">Subject:</label>
								<div class="col-sm-6">
									<input id="subject" name="subject" placeholder="Enter the subject" value="#facultyList.name#"></input>
									<div class="error-msg" id="error_subject"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="name">Name:</label>
								<div class="col-sm-6">
									<input id="name" name="name" placeholder="Enter the name" value="#facultyList.firstName# #facultyList.lastName#"></input>
									<div class="error-msg" id="error_name"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="emailId">Email Id:</label>
								<div class="col-sm-6">
									<input id="emailId" name="emailId" value="#facultyList.emailid#" readonly></input>
									<div class="error-msg" id="error_emailId"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="active">Active:</label>
								<div class="col-sm-6">
									<input id="active" name="active" value="#(facultyList.active)? 'true': 'false'#" readonly ></input>
									<div class="error-msg" id="error_active"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="contactNumber">Contact Number:</label>
								<div class="col-sm-6">
									<input id="contactNumber" name="contactNumber" placeholder="Enter the contact number" value="#facultyList.contactNumber#"></input>
									<div class="error-msg" id="error_contactNumber"></div>
								</div>
							</div><!---form-body--->
								<input type="hidden" id="userId" name="userId">
						</div>
					</form>
				</div>
				<div class="modal-footer">
			 	  <button type="submit" class="btn btn-default" id="submitEditForm" name="submitEditFrom" onClick="" value="##">Update</button>
			 	  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div><!--modal-footer-->
		        </form>
			</div>
			</cfoutput>
		</cfsavecontent>
		<cfreturn variables.html>
	</cffunction>
</cfcomponent>