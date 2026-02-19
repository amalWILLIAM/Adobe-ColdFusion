component accessors="true" {

    property userServices;

    public function init(fw){
        variables.fw = fw;
        return this;
    }

    private function checkAdmin(rc){
        if(!structKeyExists(session, "user") OR session.user.role NEQ "admin"){
            variables.fw.redirect("auth.login");
        }
    }

    public function index(rc){
        checkAdmin(rc);
        rc.users = userServices.getNonAdminUsers();
        return "usersA/index";
    }

    public function edit(rc){
        checkAdmin(rc);
        rc.user = userServices.getUserById(rc);
        return "usersA/edit";
    }

    public function update(rc){
        checkAdmin(rc);
        userServices.updateUser(rc);
        variables.fw.redirect("usersA.index");
    }

    public function delete(rc){
        checkAdmin(rc);
        userServices.deleteUser(rc);
        variables.fw.redirect("usersA.index");
    }

}
