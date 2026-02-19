component accessors = "true"{

    property userServices;
    property productServices;
    property orderServices;

    public function init(fw){

        variables.fw = fw;
        return this;

    }

    private function checkAdmin(rc){


        if(!structKeyExists(session, "user") OR session.user.role NEQ "admin"){
            variables.fw.redirect(
                action = "auth.login",
                preserve = "message",
                message = "Invalid Credentials"
            );
        }

    }

    public function dashboard(rc){

        checkAdmin(rc);

        /* Products count query (query object) */
        rc.count = productServices.totalProducts();

        /* Total users as a number */
        var u = userServices.totalUsers();
        rc.totalUsers = (u.recordCount ? u.count[1] : 0);

        /* Total orders and revenue */
        var o = orderServices.totalOrders();
        rc.totalOrders = (o.recordCount ? o.count[1] : 0);

        var r = orderServices.totalRevenue();
        rc.totalRevenue = (r.recordCount ? r.revenue[1] : 0);


    }

}