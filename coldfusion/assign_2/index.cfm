<cfset myName="Simon" />
<cfset myPosition="Developer" />
<!DOCTYPE html>
<html>
	<head>
		<title>assignment 2</title>
		<style>
				th {
				align= center;}
				td{
				align="right";}
		</style>
	</head>
	<body bgcolor="#E6E6E6">
		<div style="border: 1px solid; border-color: black; box-shadow: 10px 10px 50px 20px black;
			background-color: white; padding-left: 20px; padding-right: 20px; position: absolute;
			top: 50px; left: 20%; align: center; width: 60%;">
		<!--profile-pic-->
		<img src= "pics/mine.jpg" alt= "my_pic" style= "float: right; margin-right: 15px;
			margin-top: 40px; width: 175px; height: 200px";>
			<h1 style="font-family:verdana; margin-bottom:1px; margin-top:30px"> Megha Kedia </h1>
			<br>
				<b>Roll no:</b>  13012275432<br>
				<b>Branch:</b>   Information Technology<br>
				<b>Stream:</b>   B.Tech<br>
				<b>Email Id:</b>  megha.kedia@gmail.com<br>
				<b>Contact No:</b> 9876543210
			<h3>Objectives:</h3>
				I want to be a part of an Organisation where I can learn continuous and use my skills and talent to the best of my knowledge to serve the Organisation.
				I am ready to face challenges and opertunity.<br>
			<h3>Qualification:</h3>
				<table style="width:98%" margin-left="auto" margin-right="auto" border="1px" padding="20px";>
					<tr>
						<th>Year</th>
						<th>Semester</th>
						<th>CGPA</th>
					</tr>
					<tr>
						<td rowspan='2'><center>1st</td>
						<td><center>1st Semester</td>
						<td><center>8.23</td>
					</tr>
					<tr>
						<td><center> 2nd Semester</td>
						<td><center>8.13</td>
					</tr>
					<tr>
						<td rowspan='2'><center>2nd</td>
						<td><center>3rd Semester</td>
						<td><center>8.63</td>
					</tr>
					<tr>
						<td> <center>4th Semester</td>
						<td><center>9.1</td>
					</tr>
					<tr>
						<td rowspan='2'><center>3rd</td>
						<td><center>5th Semester</td>
						<td><center>9.3</td>
					</tr>
					<tr>
						<td> <center>6th Semester</td>
						<td><center>8.83</td>
					</tr>
					<tr>
						<td rowspan='2'><center>4th</td>
						<td><center>7th Semester</td>
						<td><center>9.5</td>
					</tr>
					<tr>
						<td> <center>8th Semester</td>
						<td><center>8.53</td>
					</tr>
				</table>
				<cfoutput>#myName#</cfoutput>	
				
			<h3>Area of Interest:</h3>
				<ul>
					<li>C, C++</li>
					<li>Operating System</li>
					<li>DataBase Management System</li>
				</ul>
			<h3>Hobbies:</h3>
				<ul>
					<li>Live Object Painting</li>
					<li>Playing Sudoku</li>
					<li>Solving Cubes</li>
				</ul>
			<h3>Declaration:</h3>
				Here by I declare that the above information is correct to the best of my knowledge.<br><br>
				Place:<br><br>
				<p>Date:<span style="float: right";>Signature</span></p>
		</div>
	</body>
</html>
