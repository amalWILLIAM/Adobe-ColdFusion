component accessors="true" {

    property productServices;

    public function init(fw) {
        variables.framework = fw;
        return this;
    }

    public function index(rc){
       rc.products = productServices.getAll();
        return "products/index";
    }

    public function add(rc){
        writedump("If you see this, we didn’t crash… yet.");
abort;
        productServices.addProduct(rc);

    }

}