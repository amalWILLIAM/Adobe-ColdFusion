<cfscript>
empService = new model.EmployeeService();

data = {
    id       = form.id,
    name     = form.name,
    role     = form.role,
    email    = form.email,
    dept_id  = form.dept_id
};

empService.updateEmployee(data);

location("index.cfm"); // Redirect back to the list
</cfscript>
