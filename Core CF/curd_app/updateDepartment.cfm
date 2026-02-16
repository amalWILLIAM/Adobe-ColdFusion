<cfscript>
deptService = new model.DepartmentService();

local.sql = "
    UPDATE departments 
    SET dept_name = :dept_name
    WHERE dept_id = :id
";
local.params = {
    id: { value = form.id, cfsqltype="cf_sql_integer" },
    dept_name: { value = form.dept_name, cfsqltype="cf_sql_varchar" }
};

try {
    queryExecute(local.sql, local.params);
} catch(any e){
    writeOutput("Updating department failed: " & e.message);
}

location("departments.cfm");
</cfscript>

