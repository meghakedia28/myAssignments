<!--- <cfset abc =6/> --->
<!--- <cfset xyz = Hash(abc,"MD5")/> --->
<!--- <cfdump var = #xyz# /> --->
<!--- <cfdump var=#session#/> --->
<!--- <cfdump var=#application#/> --->

<!-- <cfform name="dcffcg"> -->
<!-- 	<cfinput type="text" name="abc" id="abc"> -->
<!-- 	<button type="submit" id="def" name="def">submit</button> -->
<!-- </cfform> -->
<!-- <cfdump var = #form# abort="true" /> -->
<cfset mailService = createobject('component','assign_10.components.mailService')/>
<cfdump var =  #mailService#>