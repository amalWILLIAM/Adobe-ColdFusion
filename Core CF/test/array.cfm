<cfset employee_list = "Amal,Visahk,Ashly,Meera">
<cfoutput>
The list of employees in my company: #employee_list#<br>
</cfoutput><br>
<cftry>
<cfset employee_array = listToArray(employee_list)>
<cfoutput>
    The array of employees is: #listToArray(employee_array)#<br>
</cfoutput><br>
<cfcatch>
    <cfoutput>
        Error in converting list to array:<br>
        #cfcatch.message#
    </cfoutput>
</cfcatch>
</cftry>
