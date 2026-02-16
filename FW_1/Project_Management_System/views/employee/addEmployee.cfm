
<cfoutput>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">

    <h3 class="mb-4 text-center">Add Employee</h3>

    <div class="row justify-content-center">
        <div class="col-md-6">


            <form method="post" action="#buildURL('employee.add')#"
                  class="border rounded p-4 shadow-sm bg-light">

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name"
                           class="form-control"
                           placeholder="Employee Name"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <input type="text" name="role"
                           class="form-control"
                           placeholder="Role"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email"
                           class="form-control"
                           placeholder="Email"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Department ID</label>
                    <input type="number" name="dep_id"
                           class="form-control"
                           placeholder="Department ID"
                           required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="#buildURL('employee.index')#"
                       class="btn btn-secondary btn-sm">
                        Back
                    </a>

                    <button type="submit"
                            class="btn btn-primary btn-sm">
                        Save
                    </button>
                </div>

            </form>


        </div>
    </div>

</div>

</body>
</html>
</cfoutput>