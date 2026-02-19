<cfinclude template="/shopping_website/views/includes/header.cfm">

<cfoutput>
<div class="container py-4">
    <h3>Admin: Manage Users</h3>

    <div class="table-responsive mt-3">
        <table class="table table-dark table-hover align-middle">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="rc.users">
                    <tr>
                        <td>#user_id#</td>
                        <td>#username#</td>
                        <td>#email#</td>
                        <td>#role#</td>
                        <td>
                            <a href="#buildURL('usersA.edit')#&user_id=#user_id#" class="btn btn-sm btn-outline-light">Edit</a>
                            <a href="#buildURL('usersA.delete')#&user_id=#user_id#" class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this user?');">Delete</a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</div>
</cfoutput>
