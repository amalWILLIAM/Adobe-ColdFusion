component {

    public function init(fw) {
        variables.framework = fw;
        return this;
    }

    public function getall(){

       return queryExecute("SELECT * FROM products");

    }

    public function getById(rc)
    {

        return local.execute = queryExecute("SELECT * FROM products WHERE product_id = :product_id",
        {

            product_id : {value = rc.product_id, cfsqltype = "cf_sql_integer"}

        });

 

    }

    public function addProduct(rc){

      local.sql =  queryExecute("INSERT INTO products(name,description,price,stock_quantity,image) VALUES (:name,:description,:price,:stock_quantity,:image)", {

            name : {value = rc.name, cfsqltype = "cf_sql_varchar"},
            description : {value = rc.description, cfsqltype = "cf_sql_varchar"},
            price : {value = rc.price, cfsqltype = "cf_sql_integer"},
            stock_quantity : {value = rc.stock_quantity, cfsqltype = "cf_sql_integer"},
            image : {value = rc.image, cfsqltype = "cf_sql_varchar"},
        });
   

    }

    public function updateProducts(rc)
    {
        local.sql = "
            UPDATE products
            SET name = :name,
                description = :description,
                price = :price,
                stock_quantity = :stock_quantity
        ";

        local.params = {
            product_id     : { value = rc.product_id, cfsqltype = "cf_sql_integer" },
            name           : { value = rc.name, cfsqltype = "cf_sql_varchar" },
            description    : { value = rc.description, cfsqltype = "cf_sql_varchar" },
            price          : { value = rc.price, cfsqltype = "cf_sql_decimal" },
            stock_quantity : { value = rc.stock_quantity, cfsqltype = "cf_sql_integer" }
        };

        // Only add image if exists
        if (structKeyExists(rc, "image"))
        {
            local.sql &= ", image = :image";

            local.params.image = {
                value = rc.image,
                cfsqltype = "cf_sql_varchar"
            };
        }

        local.sql &= " WHERE product_id = :product_id";

        return queryExecute(local.sql, local.params);
    }


    public function delete(rc)
    {

        queryExecute("DELETE FROM  products WHERE product_id =  :product_id",
        {

            product_id:{value = rc.product_id,cfsqlvalue="cf_sql_integer"}

        });

    }

    public function totalProducts(rc){

        return queryExecute("SELECT COUNT(*) as count FROM products");

    }

}