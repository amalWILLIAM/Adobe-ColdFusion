<cfset langlist="php,python,coldfusion,java,go,rust">
<cfoutput>
The list of programming languages i know: #langlist#<br>
</cfoutput>
<br></br>
<cfset listArray = listLen(langlist)>
<cfoutput>
The list of programming languages i know in array format: #listArray#<br>
</cfoutput>
<br></br>
<cfset listItem = listGetAt(langlist, 3)>
<cfoutput>
The 3rd item in the list is: #listItem#<br>
</cfoutput>
<br></br>
<cfoutput>
    <cfif listContainsnocase(langlist, "Python")>
        Yes, I know Python<br>
    <cfelse>
        No, I don't know python<br>
    </cfif>
</cfoutput>
<br></br>