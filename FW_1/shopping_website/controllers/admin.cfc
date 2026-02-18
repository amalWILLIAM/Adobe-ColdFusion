component accessors = "true"{

    property userDAB;
    property userServices;

    public function init(fw){

        variables.fw = fw;
        return this;

    }

    private function checkAdmin(rc){


        if(!structKeyExists(session, "user") OR session.user.role NEQ "admin"){

            variables.fw.redirect(
                
                action = "user.login",
                preserve = "message",
                message = "Invalid Credentials"
                
                );
        }

    }

    public function dashboard(rc){

        checkAdmin(rc);

    }

}