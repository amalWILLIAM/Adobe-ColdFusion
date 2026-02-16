<cfscript>
    local.params = (
    id : {primary key,auto_increment,cfsqltype : "cf_sql_integer"},
    Name : {not null,cfsqltype : "cf_sql_varchar"},
    HOD : {not null,cfsqltype : "cf_sql_integer"}
    );

    queryexecute("create table department",local.params);
</cfscript>