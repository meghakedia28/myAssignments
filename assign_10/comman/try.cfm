<cfset send = #sendMails()#>
<cffunction name="sendMails" access="public" output="false" returntype="boolean">
		<cfmail type="html" from="megha.kedia28@gmail.com" to="sunish58@gmail.com" subject="An email sent" port="587" >
   				This email has to send to you, because the admin of the "QUIZ CENTER" has tried to add you.<br>
				<p>In case of any query you can reply back. We are happy to help.</p>
			</cfmail>
			<cfreturn true>
	</cffunction>
<cfdump var = #send#>

<!--- <cfset abc =6/> --->
<!--- <cfset xyz = Hash(abc,"MD5")/> --->
<!--- <cfdump var = #xyz# /> --->
<!--- <cfdump var=#session#/> --->
<!--- <cfdump var=#application#/> --->


<!-- <cfset a = "a" /> -->
<!-- <!--- <cfset var b = "b"> ---> -->
<!-- <cfdump var = "lkkjjh"> -->
<!-- <cffunction name = "tryv" output="true"> -->
<!-- 	<cfset c = 'c' /> -->
<!-- 	<cfset var d = 'd' /> -->
<!-- 	<cfdump var = "hjgvjh"> -->
<!-- 	<cfdump var= #variables#> -->
<!-- 	<cfdump var= #local#> -->
<!-- 	<!--- <cfdump var = #var.d#> ---> -->
<!-- <!--- 	 ---><cfdump var = #local.d#> -->
<!-- </cffunction> -->
<!-- <!--- <cfdump var= #local#> ---> -->

<!-- <cfset tryv() /> -->
<!-- <cfdump var= #variables#> -->
