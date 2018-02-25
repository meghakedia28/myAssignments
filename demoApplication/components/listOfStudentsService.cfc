<cfcomponent>
	<cfset resultSet = {} />
	<cfset resultSet["draw"] = {} />
	<cfset resultSet["recordsTotal"] = {} />
	<cfset resultSet["recordsFiltered"] = {} />
	<cfset resultSet["data"] = {} />
	<cfset searchdata = "search[value]" />
	<cfset listColumns = "userId,active,firstName,lastName,emailid,contactNumber" />
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
				<cfset dataArray[i][4] = encodeForHtml(slist.contactNumber) />
				<cfset dataArray[i][5] = "<button type='button' class='btn btn-success btn-md' id = 'edit' name='edit' data-toggle='modal' data-target='##rowEdit' data-id='#slist.userId#'><i class= 'glyphicon glyphicon-pencil'>&nbsp</i>edit</button>" />
			<cfset i = i+1 />
 		</cfloop>
		<cfreturn dataArray>
	</cffunction>
	<cffunction name="populateData" access="remote" returntype="String" returnformat="plain">
		<cfargument name="id" required="true" type="numeric">
		<cfset variables.html = "" />
		<cfquery name="studentList">
			SELECT #listColumns#
			FROM [user]
			WHERE [user].[userId]= <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">;
		</cfquery>
		<cfquery name="checkPasswordSet">
			SELECT (case when ( select count([user].[hashPassword])
			FROM [user] WHERE [user].[hashPassword] IS NOT NULL AND [user].[userId] =
			 <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_bigint">) > 0
			then 'true'
			else 'false'
			END) AS SetPassword;
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
								<label class="col-sm-4 control-label" for="firstName">First name:</label>
								<div class="col-sm-6">
									<input type="text" id="firstName" name="firstName" placeholder="Enter the first name" value="#studentList.firstName#"></input>
									<div class="error-msg" id="error_firstname"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="lastName">Last name:</label>
								<div class="col-sm-6">
									<input type="text" id="lastName" name="lastName" placeholder="Enter the last name" value="#studentList.lastName#"></input>
									<div class="error-msg" id="error_lastname"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="emailId">Email Id:</label>
								<div class="col-sm-6">
									<input type="text" id="emailId" name="emailId" value="#studentList.emailid#" readonly></input>
									<div class="error-msg" id="error_emailId"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="active">Active:</label>
								<div class="col-sm-6">
									<cfif checkPasswordSet.SetPassword >
										<select id="active" name="active" >
											<option value= "1" selected>true</option>
											<option value= "0">false</option>
										</select>
									<cfelse>
										<input type="text" id="active" name="active" value="#(studentList.active)? 'true': 'false'#" readonly ></input>
									</cfif>
									<div class="error-msg" id="error_active"></div>
								</div>
							</div><!---form-body--->
							<div class="form-body field">
								<label class="col-sm-4 control-label" for="contactNumber">Contact Number:</label>
								<div class="col-sm-6">
									<input id="contactNumber" name="contactNumber" placeholder="Enter the contact number" value="#studentList.contactNumber#"></input>
									<div class="error-msg" id="error_contactnumber"></div>
								</div>
							</div><!---form-body--->
								<input type="hidden" id="userId" name="userId" value="#arguments.id#">
						</div>
					</form>
				</div>
				<div class="modal-footer">
			 	  <button type="submit" class="btn btn-default" id="submitEditForm" name="submitEditFrom" onClick="" value="#arguments.id#">Update</button>
			 	  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div><!--modal-footer-->
		       <!--  </form> -->
			</div>
			</cfoutput>
		</cfsavecontent>
		<cfreturn variables.html>
	</cffunction>
</cfcomponent>