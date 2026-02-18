<!DOCTYPE html>
<html>
<head>
    <title>Add Department</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        label { display: block; margin-top: 10px; }
        input[type="text"] { width: 300px; padding: 5px; }
        input[type="submit"] { margin-top: 10px; padding: 5px 10px; }
        a { text-decoration: none; margin-bottom: 10px; display: inline-block; }
    </style>
</head>
<body>

<h2>Add Department</h2>

<a href="departments.cfm">Back to Departments</a>

<form action="saveDepartment.cfm" method="post">
    <label>Department Name:</label>
    <input type="text" name="dept_name" required>

    <br><br>
    <input type="submit" value="Add Department">
</form>

</body>
</html>
