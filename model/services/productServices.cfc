component {

    public function init(fw) {
        variables.framework = fw;
        return this;
    }

    public function getall(){

       return queryExecute("SELECT * FROM products");
        

    }

    public function addProduct(rc){
        writedump("If you see this, we didn’t crash… yet.");
abort;

        return queryExecute("INSERT INTO products(name,description,price,stock_quantity) VALUES (:name,:description,:price,:stock_quantity)", {
            name = rc.name,
            description = rc.description,
            price = rc.price,
            stock_quantity = rc.stock_quantity
        });

    }

}