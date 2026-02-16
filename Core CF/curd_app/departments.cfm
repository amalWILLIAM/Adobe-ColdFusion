<cfscript>
deptService = new model.DepartmentService();
departments = deptService.getAll();
</cfscript>

<!DOCTYPE html>
<html>
<head>
    <title>Departments</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 50%; }
        th, td { padding: 8px; border: 1px solid #ccc; text-align: left; }
        a { text-decoration: none; margin-right: 10px; }
    </style>
</head>
<body>

<h2>Departments</h2>

<a href="addDepartment.cfm">Add Department</a>

<table>
    <tr>
        <th>Name</th>
        <th>Actions</th>
    </tr>

    <cfoutput query="departments">
        <tr>
            <td>#dept_name#</td>
            <td>
                <a href="editDepartment.cfm?id=#dept_id#">Edit</a>
                <a href="deleteDepartment.cfm?id=#dept_id#" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </cfoutput>

    <cfif departments.recordCount EQ 0>
        <tr>
            <td colspan="2" style="text-align:center;">No departments found.</td>
        </tr>
    </cfif>
</table>

</body>
</html>
