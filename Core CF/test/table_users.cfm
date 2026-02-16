<cfscript>
    local.params = {
        id : {primary key,auto_increment,cfsqltype : "cf_sql_integer"},
        username : {cfsqltype = "cf_sql_varchar",maxlength = 50, null = false},
        email : {cfsqltype = "cf_sql_varchar",maxlength = 100, null = false}

    };
    queryexecute("create table users",local.params);
    writeoutput("table created successfully");
</cfscript>
