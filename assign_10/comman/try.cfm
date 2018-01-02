<!--- <cfset abc =6/> --->
<!--- <cfset xyz = Hash(abc,"MD5")/> --->
<!--- <cfdump var = #xyz# /> --->
<!--- <cfdump var=#session#/> --->
<!--- <cfdump var=#application#/> --->


<cfset a = "a" />
<!--- <cfset var b = "b"> --->
<cfdump var = "lkkjjh">
<cffunction name = "tryv" output="true">
	<cfset c = 'c' />
	<cfset var d = 'd' />
	<cfdump var = "hjgvjh">
	<cfdump var= #variables#>
	<cfdump var= #local#>
	<!--- <cfdump var = #var.d#> --->
<!--- 	 ---><cfdump var = #local.d#>
</cffunction>
<!--- <cfdump var= #local#> --->

<cfset tryv() />
<cfdump var= #variables#>
