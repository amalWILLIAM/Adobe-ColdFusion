<cfset myVar=false>

<cfloop condition="myVar eq false">

  <cfoutput>

  myVar = #myVar#  (still in loop)

 </cfoutput>

  <cfif RandRange(1,10) eq 10>

    <cfset myVar="true">
    

  </cfif>
  <cfdump var="myVar" label="Value of myVar">

</cfloop>

<cfoutput>

myVar = #myVar# (loop has finished)

</cfoutput>