<cfscript>
local.sql = "DELETE FROM departments WHERE dept_id = :id";
local.params = { id: { value = url.id, cfsqltype="cf_sql_integer" } };

try {
    queryExecute(local.sql, local.params);
} catch(any e){
    writeOutput("Deleting department failed: " & e.message);
}

location("departments.cfm");
</cfscript>
