component accessors="true" {

    property productsDAB;

    public function init(fw) {
        variables.fw = fw;
        return this;
    }

    public function addProduct(rc) {
        productsDAB.insert(rc);
    }

    public function getAllProducts() {
        return productsDAB.getAll();
    }

    public function getProductById(id) {
        return productsDAB.getById(id);
    }

    public function updateProduct(rc) {
        productsDAB.update(rc);
    }

    public function deleteProduct(id) {
        productsDAB.delete(id);
    }

}
