<cfscript>
empService = new model.EmployeeService();

data = {
    emp_name = form.emp_name,
    role     = form.role,
    email    = form.email,
    dept_id  = form.dept_id
};

empService.addEmployee(data);

location("index.cfm");
</cfscript>
