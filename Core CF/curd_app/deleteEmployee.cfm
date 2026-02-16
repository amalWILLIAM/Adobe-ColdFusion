<cfscript>
empService = new model.EmployeeService();

empService.deleteEmployee(url.id);

location("index.cfm"); // Redirect back to the list
</cfscript>
