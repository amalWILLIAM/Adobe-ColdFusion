component accessors = "true" {

    property userServices;

    public function init(fw){
        variables.fw = fw;
        return this;
    }

    public function index(rc){
        return "users/index";
    }

    public function register(rc){
        return "auth/register";
    }

    public function save(rc){
        userServices.userRegister(rc);
        variables.fw.redirect("auth.login");
    }

}
