component {


    public query function getAll(){

        try{

            local.sql = "SELECT e.emp_id,e.emp_name,e.role,e.email,d.dept_name
            FROM employees e
            JOIN departments d ON e.dept_id = d.dept_id
            ";

            local.params = {};

            return queryExecute(local.sql,local.params);

        }

        catch(any e){

            writeOutput("Fetching Employee Details Failed :" & e.message);
            return [];

        }
    }

    

    public struct function getById(required numeric id){

        local.sql = "SELECT * FROM employees WHERE emp_id = :id";

        local.params = {

            id : {value = id ,cfsqltype = "cf_sql_integer"}

        };

        local.execute = queryExecute(local.sql,local.params);

        if (local.execute.recordCount){

            return local.execute[1];

        }else{

            return {};

        }

    }

    public void function addEmployee(required struct data){

        transaction{
            try{

                local.sql = "INSERT INTO employees
                            (emp_name,role,email,dept_id)
                            VALUES
                            (:emp_name,:role,:email,:dept_id)
                            ";

                local.params = {

                    emp_name : {value = data.emp_name,cfsqltype = "cf_sql_varchar"},
                    role : {value = data.role,cfsqltype = "cf_sql_varchar"},
                    email : {value = data.email,cfsqltype = "cf_sql_varchar"},
                    dept_id : {value = data.dept_id,cfsqltype = "cf_sql_integer"}

                };

                queryExecute(local.sql,local.params);
            
            
            }catch(any e){

                    transaction(action = "rollback");
                    
                    writeOutput("Employee Insertion Failed :" & e.message);
        
            }

        } 
    
    }
    public void function updateEmployee(required struct data){

        try{

            local.sql = "UPDATE employees
                        SET
                        emp_name = :name,
                        role = :role,
                        email = :email,
                        dept_id = :dept_id
                        WHERE emp_id = :id";

            local.params = {

                id : {value = data.id,cfsqltype = "cf_sql_integer"},
                name : {value = data.name,cfsqltype = "cf_sql_varchar"},
                email : {value = data.email,cfsqltype = "cf_sql_varchar"},
                dept_id : {value = data.dept_id,cfsqltype = "cf_sql_integer"}

            };

            queryExecute(local.sql,local.params);

        }catch(any e){

            writeOutput("Updating Employee failed :" & e.message);

        }    
        
    }

    public void function deleteEmployee(required numeric id){

        try{

            local.sql = "DELETE FROM employees
                        WHERE emp_id = :id";

            
            local.params = {

                id : {value = id,cfsqltype = "cf_sql_integer"}

            };

            queryExecute(local.sql,local.params);
         
        }catch(any e){

            writeOutput("Deleting Employee Failed :" & e.message);

        }    

    }

}
