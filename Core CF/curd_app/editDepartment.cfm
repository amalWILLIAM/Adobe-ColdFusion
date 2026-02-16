<cfscript>
deptService = new model.DepartmentService();
    departments = deptService.getAll();


local.sql = "SELECT * FROM departments WHERE dept_id = :id";
local.params = { id: { value = url.id, cfsqltype="cf_sql_integer" } };
local.execute = queryExecute(local.sql, local.params);
if (local.execute.recordCount) {
    department = {
        dept_id   = local.execute.dept_id[1],
        dept_name = local.execute.dept_name[1]
    };// Lucee 5+ supports this in cfscript
} else {
    department = {};
}
</cfscript>

<h2>Edit Department</h2>

<form action="updateDepartment.cfm" method="post">
    <input type="hidden" name="id" value="#department.dept_id#">

    <label>Department Name:</label>
    
    <input type="text" name="dept_name" value="#department.dept_name#" required><br><br>

    <input type="submit" value="Update Department">
</form>
