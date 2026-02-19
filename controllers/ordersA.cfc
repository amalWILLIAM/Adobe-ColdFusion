component accessors="true" {

    property orderServices;

    public function init(fw) {
        variables.fw = fw;
        return this;
    }

    public function index(rc){
       rc.orders = orderServices.getAll();

        return "ordersA/index";
    }

    public function view(rc){

        try{
            rc.order = orderServices.getOrderById(rc);
            return "ordersA/view";
        }catch(any e){
            writedump(e.message);
            abort;
        }

    }

    public function edit(rc){

        try{
            rc.order = orderServices.getOrderById(rc);
            return "ordersA/edit";
        }catch(any e){
            writedump(e.message);
            abort;
        }

    }

    public function updateStatus(rc){

        try{
            orderServices.updateOrderStatus(rc);
            variables.fw.redirect("ordersA.index");
        }catch(any e){
            writedump(e.message);
            abort;
        }

    }

}

