<cfscript>
    local.params = {
        name : {value = "amal",cfsqltype = "cf_sql_varchar" },
        role : {value = "tester",cfsqltype = "cf_sql_varchar" }
    };
    queryExecute("Delete 
    from employees where
    name = :name and
    role = :role",local.params);
    writeoutput('deleted successfully');
</cfscript>