component accessors = "true" {

    public function init(fw)
    {

        variables.fw = fw;
        return this;

    }

    public function userRegister(rc)
    {

        rc.password = hash(rc.password, "SHA-256");
        
        queryExecute("INSERT INTO users(username,email,password)
            VALUES(:username,:email,:password)",
            {

            username : {value = rc.username, cfsqltype = "cf_sql_varchar"},
            email    : {value = rc.email, cfsqltype = "cf_sql_varchar"},
            password : {value = rc.password, cfsqltype = "cf_sql_varchar"}

            }
        );

    }

    public function Login(rc)
    {

        var user = queryExecute("SELECT user_id,username,email,password,role FROM users WHERE email = :email",
                        {

                            email : {value = rc.email, cfsqltype = "cf_sql_varchar"}

                        }

            );

        if(user.recordCount EQ 1){

            var hashedpassword = hash(rc.password, "SHA-256");

            if(hashedpassword EQ user.password){

                session.user = {

                    userID   : user.user_id,
                    username : user.username,
                    email    : user.email,
                    role     : user.role

                };


                return true;

            } 

        }
          
        return false;
    }
    
}