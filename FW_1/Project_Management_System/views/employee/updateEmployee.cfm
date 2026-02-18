
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">

    <h3 class="mb-4 text-center">Edit Employee</h3>

    <div class="row justify-content-center">
        <div class="col-md-6">

            <!--- FW/1 passes data in rc --->
            <cfoutput query="rc.employeeindex">
            <form method="post"
                  action="#buildURL('employee.update')#"
                  class="border rounded p-4 shadow-sm bg-light">

                <!-- Employee ID (required for update) -->
                <input type="hidden" name="id" value="#emp_id#">

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text"
                           name="name"
                           class="form-control"
                           value="#emp_name#"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <input type="text"
                           name="role"
                           class="form-control"
                           value="#role#"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email"
                           name="email"
                           class="form-control"
                           value="#email#"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Department ID</label>
                    <input type="number"
                           name="dep_id"
                           class="form-control"
                           value="#dept_id#"
                           required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="#buildURL('employee.index')#"
                       class="btn btn-secondary btn-sm">
                        Back
                    </a>

                    <button type="submit"
                            class="btn btn-primary btn-sm">
                        Update
                    </button>
                </div>

            </form>
            </cfoutput>

        </div>
    </div>

</div>

</body>
</html>
