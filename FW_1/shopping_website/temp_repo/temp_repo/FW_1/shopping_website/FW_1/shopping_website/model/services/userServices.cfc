component accessors = "true" {

    property userDAB;

    public function init(fw)
    {

        variables.fw = fw;
        return this;

    }

    public function userRegister(rc)
    {

        rc.password = hash(rc.password, "SHA-256");
        userDAB.register(rc);

    }

    public function Login(rc)
    {

        var user = userDAB.getByEmail(rc);

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