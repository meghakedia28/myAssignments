<!-------------------------------------------------------------------------------------------------------------
FileName    : noNavigation.cfm
Created By  : Megha Kedia
DateCreated : 28-March-2018
Description : has the layout which has no navigation.

-------------------------------------------------------------------------------------------------------------->

<cfset base = "https://localhost/demoApp">
<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset = "UTF-8">
		<meta http-equiv = "X-UA-Compatible" content = "IE = edge">
		<meta name = "viewport" content = "width = device-width, initial-scale = 1.0,maximum-scale = 1">

		<title>St. Joseph's High School</title>
		<!-- Loading third party fonts -->
		<cfoutput>
			<link href = "#base#/freeTemplateFiles/fonts/font-awesome.min.css" rel = "stylesheet" type = "text/css">
		<!-- Loading main css file -->
		<link rel = "stylesheet" href = "#base#/freeTemplateFiles/css/style.css">
		</cfoutput>
	</head>
	<body>
		<div id = "site-content">
			<header class = "site-header">
				<div class = "container">
					<a href = "home.cfm" id = "branding">
						<cfoutput>
							<img src = "#base#/freeTemplateFiles/images/logo.png" alt = "Lincoln high School">
						</cfoutput>
						<h1 class = "site-title">St. Joseph's High School</h1>
					</a> <!-- #branding -->
				</div>
			</header>
		</div>
	<!---end of header---->
	</body>
</html>
<cfoutput>#renderView()#</cfoutput>