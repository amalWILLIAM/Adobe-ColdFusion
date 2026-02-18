<cfoutput>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Department</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">

    <h3 class="mb-4 text-center">Edit Department</h3>

    <div class="row justify-content-center">
        <div class="col-md-6">


            <cfoutput query="rc.departmentDetails">
            <form method="post"
                  action="#buildURL('department.update')#"
                  class="border rounded p-4 shadow-sm bg-light">

                <input type="hidden" name="id" value="#dept_id#">

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text"
                           name="name"
                           class="form-control"
                           value="#dept_name#"
                           required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="#buildURL('Department.index')#"
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
</cfoutput>
