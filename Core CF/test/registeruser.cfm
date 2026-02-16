<cfset form.username = "amal">
<cfset form.email ="amalwilliam@gmail.com">
<cfset form.amount = 100>

<cftransaction>
    <cftry>

        <cfquery datasource="cfdb">
            INSERT INTO users (username, email)
            VALUES (
                <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>

        <cfquery datasource="cfdb">
            INSERT INTO orders (user_id, amount)
            VALUES (
                LAST_INSERT_ID(),
                <cfqueryparam value="#form.amount#" cfsqltype="cf_sql_decimal">
            )
        </cfquery>

        <cftransaction action="commit">

    <cfcatch>
        <cftransaction action="rollback">
        <cfoutput>
        #cfcatch.message# <br>
        #cfcatch.detail#
    </cfoutput>
    </cfcatch>

    </cftry>
</cftransaction>
