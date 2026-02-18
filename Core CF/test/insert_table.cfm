<cfscript>
    local.params ={
        name = {value :"amal" ,cfsqltype : "cf_sql_varchar"},
        role = {value :"tester" ,cfsqltype : "cf_sql_varchar"},
        phone = {value :7034269955 ,cfsqltype : "cf_sql_varchar"},
        email = {value :"amalwill@gmail.com" ,cfsqltype : "cf_sql_varchar"}
        };

        queryexecute("insert into employees(name,role,phone,email)
        values(:name,:role,:phone,:email)",local.params);
        writeOutput("Insert successful");

</cfscript>