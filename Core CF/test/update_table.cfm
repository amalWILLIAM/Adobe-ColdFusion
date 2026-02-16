<cfscript>
    local.params = {
        name : {value = "Changed",cfsqltype = "cf_sql_varchar"},
        role : {value = "changed",cfsqltype = "cf_sql_varchar"}
    };

    queryExecute("update employees set 
    name = :name,
    role = :role
    where id = 2",local.params);
    writeoutput('updated successfully');
</cfscript>