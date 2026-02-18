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

    public function searchEmployee(required string queryterm , string sortorder = "ASC")
    {

        var safeOrder = (ucase(arguments.sortorder) EQ "ASC") ? "ASC" : "DESC";

        local.sql = "SELECT e.emp_id , e.emp_name , e.role , e.email ,d.dept_name
                    FROM employees e 
                    join departments d on e.dept_id = d.dept_id 
                    WHERE e.emp_name LIKE ? OR e.role LIKE ? OR e.email LIKE ?
                    ORDER BY e.emp_name #safeOrder#";

        local.params = [

            arguments.queryterm & "%",
            arguments.queryterm & "%",
            arguments.queryterm & "%"

        ];



        local.execute = queryExecute(local.sql,local.params);


        return(local.execute);

    }

    public any function getEmployeepaged(required numeric page, required numeric pagesize)
    {

        local.offset = (page -1) * pagesize;


        local.dataQ = queryExecute("SELECT e.emp_id , e.emp_name , e.role , e.email ,d.dept_name 
                                FROM employees e
                                JOIN departments d ON e.dept_id = d.dept_id
                                ORDER BY e.emp_id
                                Limit :pagesize
                                Offset :offset",
                                {

                                    pagesize : {value = pagesize , cfsqltype = "cf_sql_integer"},
                                    offset : {value = local.offset , cfsqltype = "cf_sql_integer"}

                                });


        
        local.countQ = queryExecute("SELECT COUNT(*) AS totalcount FROM employees");




        return {

            data : local.dataQ,

            totalrows : local.countQ.totalcount

        };

    }

}