<cfoutput>
<h2>Add / Edit Student</h2>

<form action="#buildURL('main.save')#" method="post">
    <!-- Hidden ID field for edit mode -->
    <cfif structKeyExists(rc, "editStudent")>
        <input type="hidden" name="id" value="#rc.editStudent.id#">
    </cfif>

    <label>Name:</label><br>
    <input type="text" name="name" 
           value="#structKeyExists(rc, 'editStudent') ? rc.editStudent.name : ''#" 
           required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" 
           value="#structKeyExists(rc, 'editStudent') ? rc.editStudent.email : ''#" 
           required><br><br>

    <label>Course:</label><br>
    <input type="text" name="course" 
           value="#structKeyExists(rc, 'editStudent') ? rc.editStudent.course : ''#" 
           required><br><br>

    <input type="submit" value="#structKeyExists(rc, 'editStudent') ? 'Update Student' : 'Add Student'#">
    <cfif structKeyExists(rc, "editStudent")>
        <a href="#buildURL('main.default')#">Cancel Edit</a>
    </cfif>
</form>

<hr>

<h2>Student List</h2>
<cfif structKeyExists(rc, "students") AND arrayLen(rc.students)>
    <table border="1" cellpadding="8" cellspacing="0">
        <tr style="background-color:##e0e0e0;">
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Action</th>
        </tr>

        <cfloop array="#rc.students#" index="stu">
            <tr>
                <td>#stu.id#</td>
                <td>#stu.name#</td>
                <td>#stu.email#</td>
                <td>#stu.course#</td>
                <td>
                    <form action="#buildURL('main.edit')#" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="#stu.id#">
                        <input type="submit" value="Edit">
                    </form>
                    <form action="#buildURL('main.delete')#" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="#stu.id#">
                        <input type="submit" value="Delete" 
                               onclick="return confirm('Are you sure you want to delete #stu.name#?');">
                    </form>
                </td>
            </tr>
        </cfloop>
    </table>
<cfelse>
    <p><em>No student records found.</em></p>
</cfif>
</cfoutput>
