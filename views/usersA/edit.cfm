<cfinclude template="/shopping_website/views/includes/header.cfm">

<cfoutput>
<div class="container py-4">
    <h3>Edit User</h3>

    <cfif rc.user.recordCount EQ 1>
        <cfset u = rc.user>
        <form method="post" action="#buildURL('usersA.update')#">
            <input type="hidden" name="user_id" value="#u.user_id#">

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input name="username" class="form-control" value="#u.username#">
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input name="email" class="form-control" value="#u.email#">
            </div>

            <div class="mb-3">
                <label class="form-label">Role</label>
                <select name="role" class="form-select">
                    <option value="user" <cfif u.role EQ 'user'>selected</cfif>>User</option>
                    <option value="admin" <cfif u.role EQ 'admin'>selected</cfif>>Admin</option>
                </select>
            </div>

            <button class="btn btn-primary">Save</button>
            <a href="#buildURL('usersA.index')#" class="btn btn-secondary">Cancel</a>
        </form>
    <cfelse>
        <div class="alert alert-warning">User not found.</div>
    </cfif>

</div>
</cfoutput>
