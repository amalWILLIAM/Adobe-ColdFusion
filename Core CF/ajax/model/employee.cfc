component {

    // AJAX-accessible method
    remote struct function updateEmployee(
        required numeric id,
        required string name,
        required string role,
        required string email
    )
    returnformat ="json" {

        try {

            queryExecute(
                "
                UPDATE employees
                SET
                    name  = :name,
                    role  = :role,
                    email = :email
                WHERE id = :id
                ",
                {
                    id    : { value = arguments.id,    cfsqltype = "cf_sql_integer" },
                    name  : { value = arguments.name,  cfsqltype = "cf_sql_varchar" },
                    role  : { value = arguments.role,  cfsqltype = "cf_sql_varchar" },
                    email : { value = arguments.email, cfsqltype = "cf_sql_varchar" }
                },
                { datasource = "cfdb" }
            );

            return {
                success : true,
                message : "Employee updated successfully"
            };

        } catch (any e) {

            return {
                success : false,
                message : e.message
            };
        }
    }

}
