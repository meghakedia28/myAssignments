/**
* I am a new Model Object
*/
component singleton accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	userDetailsService function init(){

		return this;
	}

	/**
	* fetchStudentsDetails
	*/
	function fetchStudentsDetails(){
		var queryService = new query();
		local.queryService.addParam (name = "student", value = "student",
			cfsqltype = "cf_sql_varchar");
		local.queryService.addParam (name = "active", value = "1",
			cfsqltype = "cf_sql_integer");
		local.queryService.setName("studentsDetails");
		local.queryService.setSQL ("SELECT [user].[userId], [user].[firstName],
					[user].[lastName], [user].[emailid], [user].[contactNumber]
					FROM [user] JOIN [role] ON [user].[roleId] = [role].[roleId]
					WHERE [role].[name] = :student AND
					[user].[active] = :active");
		studentsDetails = local.queryService.execute().getResult();
		return studentsDetails;
	}

	function getStudentsDetails(){
		var studentsList = fetchStudentsDetails();
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

	function getFacultyList(){
		var queryService = new query();
		local.queryService.setName("fetchListOfFaculties");
		local.queryService.setSQL("SELECT [user].[userId], [user].[active], [user].[firstName],
					[user].[lastName], [user].[emailid], [user].[contactNumber], [subject].[name]
			        FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
					JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
					WHERE [user].[roleId] = 2");
		fetchListOfFaculties = local.queryService.execute().getResult();
		var result["data"] = {};
		var dataArray = ArrayNew(2);
		var i = 1;
			for (row in fetchListOfFaculties){
				local.dataArray[i][1] = encodeForHtml(row.name);
				local.dataArray[i][2] = encodeForHtml(row.firstName & " " & row.lastName);
				local.dataArray[i][3] = encodeForHtml(row.emailid);
				if (row.active == 1){
					local.dataArray[i][4] = "true";
				}
				else{
					local.dataArray[i][4] = "false";
				}
				local.dataArray[i][5] = encodeForHtml(fetchListOfFaculties.contactNumber);
				local.dataArray[i][6] = "<button type = 'button' class = 'btn btn-success btn-md'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
					data-id = '#row.userId#'><i class = 'glyphicon glyphicon-pencil'>&nbsp</i>
					edit</button>";
				local.i = local.i+1;
			}
		local.result.data = dataArray;
		return local.result;
	}

	function getStudentList(){
		var queryService = new query();
		local.queryService.setName("fetchListOfStudents");
		local.queryService.setSQL("SELECT [user].[userId], [user].[active], [user].[firstName],
			[user].[lastName],
			[user].[emailid], [user].[contactNumber] FROM [user]
			WHERE [user].[roleId] = 3");
		fetchListOfStudents = local.queryService.execute().getResult();
		var result["data"] = {};
		var dataArray = ArrayNew(2);
		var i = 1;
		for (row in fetchListOfStudents){
			local.dataArray[i][1] = encodeForHtml(row.firstName &
			 ' ' & row.lastName);
			local.dataArray[i][2] = encodeForHtml(row.emailid);
			if (row.active == 1){
				local.dataArray[i][3] = "Yes";
			}
			else{
				local.dataArray[i][3] = "No";
			}
			local.dataArray[i][4] = encodeForHtml(row.contactNumber);
			local.dataArray[i][5] = "<button type = 'button' class = 'btn btn-success btn-md'
					id = 'edit' name = 'edit' data-toggle = 'modal' data-target = '##rowEdit'
					data-id = '#row.userId#'><i class = 'glyphicon glyphicon-pencil'>&nbsp</i>edit</button>" ;
			local.i = local.i+1;
		}
		local.result.data = dataArray;
		return local.result;
	}

	function fetchStudentDetails(required numereic userId){
		var queryService = new query();
		local.queryService.addParam(name = "userId", value = "#arguments.userId#", cfsqltype = "cf_sql_bigint");
		local.queryService.setName("studentList");
		local.queryService.setSQL("SELECT user].[userId], [user].[active], [user].[firstName],
			[user].[lastName],
			[user].[emailid], [user].[contactNumber] FROM [user]
			WHERE [user].[userId] = :userId");
		studentList = local.queryService.execute().getResult();
		return studentList;
	}
	function getStudentDetails(required numeric userId){
		var userList = fetchStudentDetails(arguments.userId);
		var data = {};
		for(row in userList){
			local.data["firstName"] = row.firstName;
	 		local.data["lastName"] = row.lastName;
 			local.data["emailId"] = row.emailId;
 			local.data["active"] = row.active;
  			local.data["contactNumber"] = row.contactNumber;
		}
		return local.data;
	}

	function fetchFacultyDetails(required numereic userId){
		var queryService = new query();
		local.queryService.addParam(name = "userId", value = "#arguments.userId#", cfsqltype = "cf_sql_bigint");
		local.queryService.setName("facultyList");
		local.queryService.setSQL("SELECT [user].[userId], [user].[active], [user].[firstName],
					[user].[lastName], [user].[emailid], [user].[contactNumber], [subject].[name]
			        FROM [user] JOIN [userSubject] ON [user].[userId] = [userSubject].[userId]
					JOIN [subject] ON [userSubject].[subjectId] = [subject].[subjectId]
					WHERE [user].[userId] = :userId");
		facultyList = local.queryService.execute().getResult();
		return facultyList;
	}

	function getFacultyDetails(required numeric userId){
		var userList = fetchFacultyDetails(arguments.userId);
		var data = {};
		for(row in userList){
			local.data["subject"] = row.name;
			local.data["firstName"] = row.firstName;
	 		local.data["lastName"] = row.lastName;
 			local.data["emailId"] = row.emailId;
 			local.data["active"] = row.active;
  			local.data["contactNumber"] = row.contactNumber;
		}
		return local.data;
	}
}