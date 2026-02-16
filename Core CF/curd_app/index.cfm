<cfscript>
empService = new model.EmployeeService();
employees = empService.getAll();
</cfscript>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 8px; border: 1px solid #ccc; text-align: left; }
        a { text-decoration: none; margin-right: 10px; }
    </style>
</head>
<body>

<h2>Employees</h2>

<a href="addEmployee.cfm">Add Employee</a> | 
<a href="departments.cfm">Manage Departments</a>

<table>
    <tr>
        <th>Name</th>
        <th>Role</th>
        <th>Email</th>
        <th>Department</th>
        <th>Actions</th>
    </tr>

    <cfoutput query="employees">
        <tr>
            <td>#emp_name#</td>
            <td>#role#</td>
            <td>#email#</td>
            <td>#dept_name#</td>
            <td>
                <a href="editEmployee.cfm?id=#emp_id#">Edit</a>
                <a href="deleteEmployee.cfm?id=#emp_id#" onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>
            </td>
        </tr>
    </cfoutput>

    <cfif employees.recordCount EQ 0>
        <tr>
            <td colspan="5" style="text-align:center;">No employees found.</td>
        </tr>
    </cfif>
</table>

</body>
</html>
