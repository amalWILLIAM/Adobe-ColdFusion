<cfscript>
deptService = new model.DepartmentService();
departments = deptService.getAll();
</cfscript>

<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        label { display: block; margin-top: 10px; }
        input[type="text"], input[type="email"], select { width: 300px; padding: 5px; }
        input[type="submit"] { margin-top: 10px; padding: 5px 10px; }
        a { text-decoration: none; margin-right: 10px; }
    </style>
</head>
<body>

<h2>Add Employee</h2>

<a href="index.cfm">Back to Employees</a>

<form action="saveEmployee.cfm" method="post">
    <label>Name:</label>
    <input type="text" name="emp_name" required>

    <label>Role:</label>
    <input type="text" name="role" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Department:</label>
    <select name="dept_id" required>
        <cfoutput query="departments">
            <option value="#dept_id#">#dept_name#</option>
        </cfoutput>
    </select>

    <br><br>
    <input type="submit" value="Add Employee">
</form>

</body>
</html>
