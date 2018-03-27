/*----------------------------------------------------------------------------------------------------------
							FileName    : userDetailsService.cfc
							Created By  : Megha Kedia
							DateCreated : 18-March-2018
							Description : the file gives services with respect to users.

------------------------------------------------------------------------------------------------------------*/

component singleton = "true" accessors = "true"{

	// Properties


	/**
	 * Constructor
	 */
	userDetailsService function init(){

		return this;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : fetchUserList()
Description    : executes query to fetch the user List.
Arguments      : numeric role
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchUserList(required numeric role){
		var userListService = new query();
		local.userListService.setName("userList");
		local.userListService.addParam(name = "roleId", value = "#arguments.role#",
			cfsqltype = "cf_sql_bigint");
		if (arguments.role == 2 || arguments.role == 3){
			var sql = "SELECT [user].[userId], [user].[active], [user].[firstName],
							[user].[lastName], [user].[emailid], [user].[contactNumber], [user].[roleId]";
			if (arguments.role == 2){
				sql &= ", [subject].[name] FROM [user] JOIN [userSubject]
								ON [user].[userId] = [userSubject].[userId]
								JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]";
			}
			else if (arguments.role == 3){
				sql &= " FROM [user]";
			}
			sql &= " WHERE [user].[roleId] = :roleId";
		}
		local.userListService.setSQL(local.sql);
		userList = local.userListService.execute().getResult();
		return userList;
	}
/*----------------------------------------------------------------------------------------------------------
Function Name  : getUserList()
Description    : fetches the user List and formates the result to display in datatable.
Arguments      : struct data
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getUserList(required struct data){
		if (structKeyExists (arguments.data,'role')){
			getList = fetchUserList(arguments.data.role);
		}
		var result["data"] = {};
		var dataArray = ArrayNew(2);
		var i = 1;
			for (row in getList){
				var j = 1;
				if (row.roleId == 2){
					local.dataArray[i][j++] = encodeForHtml(row.name);
				}
				local.dataArray[i][j++] = encodeForHtml(row.firstName & " " & row.lastName);
				local.dataArray[i][j++] = encodeForHtml(row.emailid);
				if (row.active == 1){
					local.dataArray[i][j++] = "true";
				}
				else{
					local.dataArray[i][j++] = "false";
				}
				local.dataArray[i][j++] = encodeForHtml(row.contactNumber);
				local.dataArray[i][j++] = "<button type = 'button' class = 'btn btn-success btn-md'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
					data-id = '#row.userId#'><i class = 'glyphicon glyphicon-pencil'>&nbsp</i>
					edit</button>";
				local.i = local.i+1;
			}
		local.result.data = dataArray;
		return local.result;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : fetchUserDetails()
Description    : fetches the user details based on userid and role.
Arguments      : numeric userId,
				numeric role
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function fetchUserDetails(required numeric userId, required numeric role){
		var userDetailsService = new query();
		local.userDetailsService.addParam(name = "userId", value = "#arguments.userId#",
			cfsqltype = "cf_sql_bigint");
		local.userDetailsService.setName("userDetails");
		if (arguments.role == 2 || arguments.role == 3){
			var sql = "SELECT [user].[userId], [user].[active], [user].[firstName],
							[user].[lastName], [user].[emailid], [user].[contactNumber], [user].[roleId]";
			if (arguments.role == 2){
				sql &= ", [subject].[name]
			       			 FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
							JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]";
			}
			else if (arguments.role == 3){
				sql &= " FROM [user]";
			}
			sql &= " WHERE [user].[userId] = :userId";
		}
		local.userDetailsService.setSQL(sql);
		userDetails = local.userDetailsService.execute().getResult();
		return userDetails;
	}
/*----------------------------------------------------------------------------------------------------------
Function Name  : getUserDetails()
Description    : fetches the details for a perticular user and formats it to return a proper structure.
Arguments      : struct data
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getUserDetails(required struct data){
		if (structKeyExists(arguments.data,'userId')){
			var getUserRoleService = new query();
			local.getUserRoleService.addParam(name = "userId", value = "#arguments.data.userId#",
				cfsqltype = "cf_sql_bigint");
			local.getUserRoleService.setName("getUserRole");
			local.getUserRoleService.setSQL("SELECT [user].[roleId]
												FROM [user] WHERE [user].[userId] = :userId");
			getUserRole = local.getUserRoleService.execute().getResult();
			var userInformation = fetchUserDetails(arguments.data.userId, getUserRole.roleId);
		}
		var result = {};
		for(row in local.userInformation){
			if (row.roleId == 2){
				local.result["subject"] = row.name;
			}
			local.result["firstName"] = row.firstName;
	 		local.result["lastName"] = row.lastName;
 			local.result["emailId"] = row.emailId;
 			local.result["active"] = row.active;
  			local.result["contactNumber"] = row.contactNumber;
		}
		return local.result;
	}

/*----------------------------------------------------------------------------------------------------------
Function Name  : getStudentsDetails()
Description    : fetches the list of students for viewing scores.
Arguments      : none
Return Type    : struct
------------------------------------------------------------------------------------------------------------*/

	function getStudentsDetails(){
		var studentsList = fetchUserList(3);
		var dataArray = ArrayNew(2);
		var result["data"] = {};
		var i = 1;
		for (row in local.studentsList){
			dataArray[i][1] = encodeForHTML(row.firstName) & " " & encodeForHTML(row.lastName);
			dataArray[i][2] = encodeForHTML(row.emailId);
			dataArray[i][3] = encodeForHTML(row.contactNumber);
			dataArray[i][4] = "<button type = 'button' class = 'btn btn-success btn-md' id = 'result'
			name = 'result'  data-toggle = 'modal' data-target = '##viewScore'
			data-id = '#row.userId#' >view all tests scores</button>";
			local.i = local.i + 1;
		}
		local.result.data = dataArray;
		return result;
	}
}
