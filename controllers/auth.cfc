component accessors = "true" {

    property userServices;

    public function init(fw){
        variables.fw = fw;
        return this;
    }

    // Show login form
    public function login(rc){
        return "auth/login";
    }

    // Show register form
    public function register(rc){
        return "auth/register";
    }

    // Handle registration form post
    public function save(rc){
        userServices.userRegister(rc);
        variables.fw.redirect("auth.login");
    }

    // Handle login post (keeps same behaviour as previous users.userLogin)
    public function authenticate(rc){
        rc.success = userServices.login(rc);

        if(rc.success EQ true){
            if(session.user.role EQ "admin"){
                variables.fw.redirect("admin.dashboard");
            } else {
                variables.fw.redirect("users.index");
            }
        }

        variables.fw.redirect("auth.login");
    }

    // Logout
    public function logout(rc){
        structDelete(session, "user");
        sessionInvalidate();

        variables.fw.redirect(
            action = "auth.login",
            preserve = "message",
            message = "You have been logged out successfully."
        );
    }

}
