
<cfoutput>
<!DOCTYPE html>
<html>
<head>
    <title>Add Department</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">

    <h3 class="mb-4 text-center">Add Department</h3>

    <div class="row justify-content-center">
        <div class="col-md-6">


            <form method="post" action="#buildURL('department.add')#"
                  class="border rounded p-4 shadow-sm bg-light">

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name"
                           class="form-control"
                           placeholder="Department Name"
                           required>
                </div>


                <div class="d-flex justify-content-between">
                    <a href="#buildURL('department.index')#"
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