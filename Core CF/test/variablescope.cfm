<cffunction name="test" access="public" returnType="void">
    <cfset var name = "amal">
    <cfoutput>
    hello #name# welcome to coldfusion
    </cfoutput>
</cffunction>
<cfset test()><br></br>


<cfset var.name = "amal william">
<cfoutput>
hello #var.name# welcome to coldfusion
</cfoutput> <br></br>

<cfparam name ="name" default ="amal william">
<cfset name="say my name">
<cfoutput>
hello #name#
</cfoutput>
<br></br>

<cfset name="amal">
<cfif IsDefined("name")>
<cfoutput>
you are #name#
</cfoutput>
<cfelse>
i don't know
</cfif>
<br></br>


<cfset scope.name="suvive">
<cfoutput>
i will #scope.name#
</cfoutput>
<br></br>

<cfset local.name="amal_local">
<cfoutput>
local name is #local.name#
</cfoutput>
<br></br>

<cffunction name="testLocal" access="public" returnType="void">
    <cfset local.name = "amal_local_function">
    <cfoutput>
    local name in function is #local.name#
    </cfoutput>
</cffunction>
<cfset testLocal()>
<br></br>

<cfoutput>
    These are the CGI variables:<br>
    <cfdump var="#cgi#" label="CGI Variables">
</cfoutput>

