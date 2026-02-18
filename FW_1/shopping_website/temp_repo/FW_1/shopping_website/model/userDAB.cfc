component {

    public function init(fw)
    {

        variables.fw = fw;
        return this;

    }

    public function register(rc)
    {
        queryExecute("INSERT INTO users(username,email,password)
            VALUES(:username,:email,:password)",
            {

            username : {value = rc.username, cfsqltype = "cf_sql_varchar"},
            email    : {value = rc.email, cfsqltype = "cf_sql_varchar"},
            password : {value = rc.password, cfsqltype = "cf_sql_varchar"}

            }
        );

    }

    public function getByEmail(rc)
    {
        return 

            queryExecute("SELECT user_id,username,email,password,role FROM users WHERE email = :email",
                        {

                            email : {value = rc.email, cfsqltype = "cf_sql_varchar"}

                        }

            );

    }

}