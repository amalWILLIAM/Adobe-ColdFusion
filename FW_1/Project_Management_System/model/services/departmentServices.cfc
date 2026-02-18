component {

    public function getall()
    {


        local.sql = "SELECT * FROM departments";


        local.execute = queryExecute(local.sql);

        return local.execute;

    }

    public function getById(id)
    {

        local.sql = "SELECT * FROM departments WHERE dept_id = :id ";


        local.params = {

            id : {value = id , cfsqltype = "cf_sql_integer"}

        };

        local.execute = queryExecute(local.sql,local.params);

        return local.execute;

    }

    public function addDepartment(rc)
    {

        local.sql = "INSERT INTO departments(dept_name) VALUES(:name)";

        local.params = {

            name : {value = rc.name , cfsqltype = "cf_sql_varchar"}

        };

        local.execute = queryExecute(local.sql,local.params);

    }

    public function updateDepartment(rc)
    {

        try{
           

            local.sql = "UPDATE departments SET dept_name = :name WHERE dept_id = :id";

            local.params = {

                id : {value = rc.id , cfsqltype = "cf_sql_integer"},

                name : {value = rc.name , cfsqltype = "cf_sql_varchar"}

            };

            local.execute = queryExecute(local.sql,local.params);

        }catch(any e){

            writeoutput("FAILED!! : " & e.message);

        };

    }


    public function deleteDepartment(rc)
    {

        local.sql = "DELETE from departments WHERE dept_id = :id";

        local.params = {

            id : {value = rc.id , cfsqltype = "cf_sql_integer"}

        };

        queryExecute(local.sql,local.params);

    }

    

}