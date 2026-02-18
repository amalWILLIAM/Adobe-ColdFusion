component accessors="true" {

    public function insert(rc) {
        queryExecute(
            "INSERT INTO products (name, description, price, stock_quantity)
             VALUES (:name, :description, :price, :stock_quantity)",
            {
                name           : { value = rc.name, cfsqltype = "cf_sql_varchar" },
                description    : { value = rc.description, cfsqltype = "cf_sql_longvarchar" },
                price          : { value = rc.price, cfsqltype = "cf_sql_decimal" },
                stock_quantity : { value = rc.stock_quantity, cfsqltype = "cf_sql_integer" }
            }
        );
    }

    public function getAll() {

        return queryExecute(
            "SELECT * FROM products ORDER BY name ASC"
        );
    }

    public function getById(id) {
        return queryExecute(
            "SELECT * FROM products WHERE product_id = :id",
            {
                id : { value = id, cfsqltype = "cf_sql_integer" }
            }
        );
    }

    public function update(rc) {
        queryExecute(
            "UPDATE products SET
                name = :name,
                description = :description,
                price = :price,
                stock_quantity = :stock_quantity
             WHERE product_id = :id",
            {
                id             : { value = rc.id, cfsqltype = "cf_sql_integer" },
                name           : { value = rc.name, cfsqltype = "cf_sql_varchar" },
                description    : { value = rc.description, cfsqltype = "cf_sql_longvarchar" },
                price          : { value = rc.price, cfsqltype = "cf_sql_decimal" },
                stock_quantity : { value = rc.stock_quantity, cfsqltype = "cf_sql_integer" }
            }
        );
    }

    public function delete(id) {
        queryExecute(
            "DELETE FROM products WHERE product_id = :id",
            {
                id : { value = id, cfsqltype = "cf_sql_integer" }
            }
        );
    }

}
