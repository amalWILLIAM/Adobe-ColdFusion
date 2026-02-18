<cfscript>
deptService = new model.DepartmentService();

data = {
    dept_name = form.dept_name
};

try {
    local.sql = "INSERT INTO departments (dept_name) VALUES (:dept_name)";
    local.params = {
        dept_name: { value = data.dept_name, cfsqltype = "cf_sql_varchar" }
    };
    queryExecute(local.sql, local.params);

} catch(any e) {
    writeOutput("Failed to add department: " & e.message);
}

location("departments.cfm");
</cfscript>
