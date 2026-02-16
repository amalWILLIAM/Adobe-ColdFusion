component {


    public query function getall()
    {
        try{

        local.sql = "SELECT e.emp_id , e.emp_name , e.role ,e.email ,d.dept_name
                    FROM employees e
                    inner join departments d on e.dept_id = d.dept_id";

        local.params = {};

        
        return queryExecute(local.sql,local.params);

        }catch(any e){

            writeOutput("failed :" & e.message);

        }

    }

    public any function getById(id)
    {



        local.sql = "SELECT * FROM employees WHERE emp_id = :id";

        local.params = {

            id : {value = id ,cfsqltype = "cf_sql_integer"}

        };

        local.execute = queryExecute(local.sql,local.params);

        return local.execute;

    }

    
    public any function addEmployee( required struct data)
    {

        try{

        local.sql = "INSERT INTO employees(emp_name,role,email,dept_id)
                    VALUES(:name,:role,:email,:dep_id)";


        
        local.params = {

            name : {value =  data.name, cfsqltype = "cf_sql_varchar"},
            role : {value =  data.role , cfsqltype = "cf_sql_varchar"},
            email : {value =  data.email , cfsqltype = "cf_sql_varchar"},
            dep_id : {value =  data.dep_id , cfsqltype = "cf_sql_varchar"}

        }

        local.execute = queryExecute(local.sql,local.params);
        }catch(any e){

            writeoutput("failed query ,:" & e.message );

        }

        return local.execute;

    }

    public any function updateEmployee(data)
    {

        try{

        
            local.sql = "UPDATE employees
                        SET 
                        emp_name = :name,
                        role = :role,
                        email = :email
                        WHERE 
                        emp_id = :id";


            local.params = {

                id : {value = data.id , cfsqltype = "cf_sql_integer"},
                name : {value = data.name , cfsqltype = "cf_sql_varchar"},
                role : {value = data.role , cfsqltype = "cf_sql_varchar"},
                email : {value = data.email , cfsqltype = "cf_sql_varchar"}

            }

            queryExecute(local.sql,local.params);


        }catch(any e){
           
            writeoutput("failed :"& e.message);

        }    


    }
    
     public any function deleteEmployee(rc)
    {
        
        
        
        local.sql = "DELETE FROM employees WHERE emp_id = :id";


        local.params = {

            id : {value = id , cfsqltype = "cf_sql_integer"},

        }

        queryExecute(local.sql,local.params);


    }

    public any function sortEmployee(rc)
    {

        local.sql = "SELECT emp_id,emp_name,role,email,dep_id
                    FROM employees
                    ORDER BY "
                
        local.params = {};

        local.execute = queryExecute(local.sql,local.params);


    }
    

}