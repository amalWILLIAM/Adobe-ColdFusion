<cfinclude template="/shopping_website/views/includes/header.cfm">

<cfoutput>

<div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="card shadow-sm" style="width: 360px;">
        <div class="card-body">
            <h5 class="card-title text-center mb-4">Sign In</h5>

            <cfif structKeyExists(rc, "message")>
                <div class="alert alert-danger py-2 text-center">
                    #rc.message#
                </div>
            </cfif>

            <form action="#buildURL('auth.authenticate')#" method="post">

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-warning w-100">Login</button>

            </form>

            <hr>

            <div class="text-center">
                <small class="text-muted">
                    New customer?
                    <a href="#buildURL('auth.register')#" class="text-decoration-none">Create an account</a>
                </small>
            </div>

        </div>
    </div>
</div>
</cfoutput>
