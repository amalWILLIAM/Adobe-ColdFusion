<cftry>
    <cfquery datasource="cfdb">
        SELECT 1
    </cfquery>

    <cfoutput>Database Connected Successfully</cfoutput>

    <cfcatch>
        <cfoutput>
            Database Connection Failed<br>
            #cfcatch.message#
        </cfoutput>
    </cfcatch>
</cftry>
