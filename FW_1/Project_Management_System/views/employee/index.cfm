<cfoutput>

<!DOCTYPE html>
<html>
<head>
    <title>Employees</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container py-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-semibold mb-0">Employees</h4>

        <a href="#buildURL('employee.addEmployeepage')#"
           class="btn btn-primary btn-sm">
            + Add Employee
        </a>
    </div>

    <div class="card shadow-sm mb-4">
        <div class="card-body p-0">

            <table class="table table-bordered table-striped table-hover align-middle text-center mb-0">
                <thead class="table-dark">
                    <tr>
                        <th style="width:80px;">ID</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th style="width:160px;">Actions</th>
                    </tr>
                </thead>

                <tbody>
                <cfoutput query="rc.employeeindex">
                    <tr>
                        <td>#emp_id#</td>
                        <td>#emp_name#</td>
                        <td>#role#</td>
                        <td>#email#</td>
                        <td>#dept_name#</td>
                        <td>
                            <a href="#buildURL('employee.updateEmployee')#&id=#emp_id#"
                               class="btn btn-warning btn-sm me-1">
                                Edit
                            </a>

                            <form action="#buildURL('employee.delete')#"
                                  method="post"
                                  class="d-inline">
                                <input type="hidden" name="id" value="#emp_id#">
                                <button type="submit"
                                        class="btn btn-danger btn-sm"
                                        onclick="return confirm('Delete employee #emp_id#?');">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </cfoutput>

                <cfif rc.employeeindex.recordcount EQ 0>
                    <tr>
                        <td colspan="6" class="text-muted py-4">
                            No employees found
                        </td>
                    </tr>
                </cfif>
                </tbody>
            </table>

        </div>
    </div>

    <div class="d-flex justify-content-end">
        <a href="#buildURL('department.index')#"
           class="btn btn-outline-primary btn-sm">
            -> Departments
        </a>
    </div>

</div>

</body>

</html>

</cfoutput>
