component accessors = "true" {


    public function register(rc)
    {

        rc.hashedpassword = generateBCryptHash(rc.password);
        

        rc.sql = "INSERT INTO users(username,password)
                    values(:username,:password)";

        rc.params = {

            username : {value = rc.username , cfsqltype = "cf_sql_varchar"},
            password : {value = rc.hashedpassword , cfsqltype = "cf_sql_varchar"}

        };

        rc.execute = queryExecute(local.sql,local.params);
        

        variables.fw.redirect("auth.login");


    }

}