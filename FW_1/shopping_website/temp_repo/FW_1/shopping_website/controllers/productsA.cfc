component accessors="true" {

    property productServices;

    public function init(fw) {
        variables.fw = fw;
        return this;
    }

    public function insert(rc) {
        productServices.addProduct(rc);
        fw.redirect('productsA.index');
    }

    public function index(rc) {

        rc.products = productServices.getAllProducts();

    }

    public function edit(rc) {
        rc.product = productServices.getProductById(rc.id);
    }

    public function update(rc) {
        productServices.updateProduct(rc);
        fw.redirect("productsA.index");
    }

    public function delete(rc) {
        productServices.deleteProduct(rc.id);
        fw.redirect("productsA.index");
    }

}
