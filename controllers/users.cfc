component accessors = "true" {

    property userServices;

    public function init(fw){

        variables.fw = fw;
        return this;

    }

    public function register(){

    }

    public function save(rc){

        userServices.userregister(rc);

        variables.fw.redirect("users.login");

    }

    public function userLogin(rc){

        rc.success = userServices.login(rc);
        
        if(rc.success EQ true){

            if(session.user.role EQ "admin"){

                variables.fw.redirect("admin.dashboard");

            }else{

                variables.fw.redirect("users.index")

            }

        } 
      
        variables.fw.redirect("users.login");            

    }

    public function logout(rc) {

        structDelete(session, "user");
        sessionInvalidate();

        variables.fw.redirect(

            action = "users.login",
            preserve = "message",
            message = "You have been logged out successfully."
            
        );
    }


}