component {

    public  struct function tableparams()
    {
        local.params = {

            name : {value : "amal",cfsqltype : "cf_sql_varchar"},
            role : {value : "developer",cfsqltype : "cf_sql_varchar"},
            phone : {value : 11111111111,cfsqltype : "cf_sql_varchar"},
            email : {value : "changed@gmail.com",cfsqltype : "cf_sql_varchar"}
        };

        return local.params;
    }

    public void function createtable()
    {


        local.params = tableparams();

        queryExecute("update employees
                    set
                    name = :name,
                    role = :role,
                    phone = :phone,
                    email = :email 
                    where id = 5",local.params);
    }
    
}