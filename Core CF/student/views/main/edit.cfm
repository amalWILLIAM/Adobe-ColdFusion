<cfoutput>
<h2>Edit Student</h2>

<cfif structKeyExists(rc, "student")>
    <form action="#buildURL('main.update')#" method="post">
        <input type="hidden" name="id" value="#rc.student.id#">

        <label>Name:</label><br>
        <input type="text" name="name" value="#rc.student.name#" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" value="#rc.student.email#" required><br><br>

        <label>Course:</label><br>
        <input type="text" name="course" value="#rc.student.course#"><br><br>

        <button type="submit">Update</button>
        <a href="#buildURL('main.default')#">Cancel</a>
    </form>
<cfelse>
    <p style="color:red;">No student data found.</p>
</cfif>
</cfoutput>