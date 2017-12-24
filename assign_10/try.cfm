<cfset abc =6/>
<cfset xyz = Hash(abc,"MD5")/>
<cfdump var = #xyz# />
<cfdump var=#session#/>
<cfdump var=#application#/>

<cfset struc= {id={}, nam={}} />

<cfset struc.id= 1 />
<cfset struc.id = 2/>
<cfset struc.nam = 3 />
<cfdump var = #struc#>
<cfset find = StructFind(struc,"id") />
<cfdump var = #find#>