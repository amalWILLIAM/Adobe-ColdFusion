<cfscript>
emp = new test.Employee();

emp.addEmployee(
    name  = "amal",
    role  = "tester",
    phone = "7034269955",
    email = "amalwill@gmail.com"
);

writeOutput("Employee inserted via CFC");
</cfscript>
