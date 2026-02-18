<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="card shadow-sm" style="width: 360px;">
        <div class="card-body">
            <h5 class="card-title text-center mb-4">Sign Up</h5>

            <cfif structKeyExists(rc, "message")>
                <div class="alert alert-danger py-2 text-center">
                    #rc.message#
                </div>
            </cfif>

            <form action="#buildURL('users.save')#" method="post">

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text"
                           name="username"
                           class="form-control"
                           required>
                </div>


                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email"
                           name="email"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password"
                           name="password"
                           class="form-control"
                           required>
                </div>

                <button type="submit" class="btn btn-warning w-100">
                    Register
                </button>

            </form>

            <hr>

            <div class="text-center">
                <small class="text-muted">
                    Have an account?
                    <a href="#buildURL('users.login')#" class="text-decoration-none">
                        Sign In
                    </a>
                </small>
            </div>

        </div>
    </div>
</div>
</cfoutput>
