<cfoutput>

<!DOCTYPE html>
<html>
<head>
    <title>Employees</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">


<cfif StructKeyExists(rc,"employeeindex")>

    <div class="container py-4">

        <div class="d-flex justify-content-between align-items-center mt-4 mb-3">
            <h2 class="fw-bold text-dark">EMPLOYEES</h2>
         

            <div class="d-flex justify-content-end">
                    <form action="#buildURL('employee.search')#"
                        method="post"
                        class="d-inline">
                        <div class = "input-group border border-dark" style = "max-width:250px;">
                            <input type="text" class="form-control text-center" name="queryterm" placeholder = "Search   Here">
                            <button type="submit"
                                class="btn btn-primary btn-sm">
                                🔍
                            </button>
                        </div>    
                    </form>
            </div>
        </div>
        <div class="card shadow-sm mb-4">
            <div class="card-body p-0">

                <table class="table table-bordered table-striped table-hover align-middle text-center mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th style="width:80px;">ID</th>
                            <th>Name</th>
                            <th>Role</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th style="width:160px;">Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                    <cfoutput query="rc.employeeindex">
                        <tr>
                            <td>#emp_id#</td>
                            <td>#emp_name#</td>
                            <td>#role#</td>
                            <td>#email#</td>
                            <td>#dept_name#</td>
                            <td>
                                <a href="#buildURL('employee.updateEmployee')#&id=#emp_id#"
                                class="btn btn-warning btn-sm me-1">
                                    Edit
                                </a>

                                <form action="#buildURL('employee.delete')#"
                                    method="post"
                                    class="d-inline">
                                    <input type="hidden" name="id" value="#emp_id#">
                                    <button type="submit"
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Delete employee #emp_id#?');">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </cfoutput>

                    <cfif rc.employeeindex.recordcount EQ 0>
                        <tr>
                            <td colspan="6" class="text-muted py-4">
                                No employees found
                            </td>
                        </tr>
                    </cfif>
                    </tbody>
                </table>

                <cfif rc.totalpages GT 1>

                    
                    <nav>
                        <ul class = "pagination justify-content-center mt-3">
                            <li class ="page-item<cfif rc.page EQ 1>Disabled</cfif>">
                                <a class = "page-link" href = "#buildURL("employee.index")#&page=#rc.page - 1#">
                                    <<
                                </a>
                            </li>

                            <cfloop from="1" to="#rc.totalpages#" index="i">
                                <li class="page-item<cfif i EQ rc.page>active</cfif>">
                                    <a class = "page-link" href="#buildURL("employee.index")#&page=#i#">
                                        #i#
                                    </a>
                                </li>
                            </cfloop>

                            <li class = "page-item<cfif rc.page EQ rc.totalpages>disabled</cfif>">
                                <a class = "page-link" href = "#buildURL("employee.index")#&page=#rc.page + 1#">
                                    >>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </cfif>   

            </div>
        </div>

    <div class="d-flex justify-content-between align-items-center mb-4">
        
        <!-- Left side -->
            <a href="#buildURL('employee.addEmployeepage')#"
            class="btn btn-primary btn-sm">
                + Add Employee
            </a>

        <!-- Right side -->
            <a href="#buildURL('department.index')#"
            class="btn btn-outline-primary btn-sm">
                → Departments
            </a>

    </div>

<cfelseif StructKeyExists(rc,"employees")>  

    <div class="container py-4">

        <div class="d-flex justify-content-between align-items-center mt-4 mb-3">
            <h2 class="fw-bold text-dark">EMPLOYEES</h2>
         

            <div class="d-flex justify-content-end">
                    <form action="#buildURL('employee.search')#"
                        method="post"
                        class="d-inline">
                        <div class = "input-group border border-dark" style = "max-width:250px;">
                            <input type="text" class="form-control text-center" name="queryterm" placeholder = "Search   Here">
                            <button type="submit"
                                class="btn btn-primary btn-sm">
                                🔍
                            </button>
                        </div>    
                    </form>
            </div>
        </div>
        <div class="">
            <div class="card-body p-0">
                <cfset var count = rc.employees.recordcount>

                <cfif count GT 0>
                    <table class="table table-bordered table-striped table-hover align-middle text-center mb-0">
                        <thead class="table-dark">
                            <tr>
                                <th style="width:80px;">ID</th>
                                <th>Name</th>
                                <th>Role</th>
                                <th>Email</th>
                                <th>Department</th>
                                <th style="width:160px;">Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                        <cfoutput query="rc.employees">
                            <tr>
                                <td>#emp_id#</td>
                                <td>#emp_name#</td>
                                <td>#role#</td>
                                <td>#email#</td>
                                <td>#dept_name#</td>
                                <td>
                                    <a href="#buildURL('employee.updateEmployee')#&id=#emp_id#"
                                    class="btn btn-warning btn-sm me-1">
                                        Edit
                                    </a>

                                    <form action="#buildURL('employee.delete')#"
                                        method="post"
                                        class="d-inline">
                                        <input type="hidden" name="id" value="#emp_id#">
                                        <button type="submit"
                                                class="btn btn-danger btn-sm"
                                                onclick="return confirm('Delete employee #emp_id#?');">
                                            Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </cfoutput>
                        </tbody>
                    </table>
                <cfelse>
                        <h3 class = "text-center">No Results Found For #rc.queryterm#</h3>
                </cfif>    

            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3">

            <cfif count GT 0>

                <!-- Left side -->
                <a href="#buildURL('employee.index')#"
                class="btn btn-outline-primary btn-sm">
                    Back
                </a>
                
                <span class="text-muted small">
                    Showing <strong>#rc.employees.recordcount#</strong> results for <strong>#rc.queryterm#</strong>
                </span>

                <!-- Right side -->
                <a href="#buildURL('employee.addEmployeepage')#"
                class="btn btn-outline-primary btn-sm">
                    + Add Employee
                </a>

            <cfelse>

                <!-- Left side -->
                <a href="#buildURL('employee.index')#"
                class="btn btn-outline-primary btn-sm">
                    Back
                </a>
                
                <!-- Right side -->
                <a href="#buildURL('employee.addEmployeepage')#"
                class="btn btn-outline-primary btn-sm">
                    + Add Employee
                </a>
                
            </cfif>  
        </div>    

                          

    </div>    

</cfif>

</body>

</html>

</cfoutput>
