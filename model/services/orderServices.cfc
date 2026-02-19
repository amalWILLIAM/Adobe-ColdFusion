component {

    public function init(fw) {
        variables.framework = fw;
        return this;
    }

    public function getAll(){

       return queryExecute("SELECT * FROM orders ORDER BY created_at DESC");

    }

    public function getOrderById(rc){

        var oid = "";

        if (structKeyExists(rc, 'order_id')) {
            oid = rc.order_id;
        } else if (structKeyExists(rc, 'ORDER_ID')) {
            oid = rc.ORDER_ID;
        } else {
            for (var k in rc) {
                if (lcase(trim(k)) == 'order_id') {
                    oid = rc[k];
                    break;
                }
            }
        }

        return queryExecute("SELECT * FROM orders WHERE order_id = :order_id", {
            order_id : {value = oid, cfsqltype = "cf_sql_integer"}
        });

    }

    public function updateOrderStatus(rc){

        var oid = "";
        var status = "";

        if (structKeyExists(rc, 'order_id')){
            oid = rc.order_id;
        } else if (structKeyExists(rc, 'ORDER_ID')){
            oid = rc.ORDER_ID;
        } else {
            for (var k in rc){
                if (lcase(trim(k)) == 'order_id'){
                    oid = rc[k]; break;
                }
            }
        }

        if (structKeyExists(rc, 'status')){
            status = rc.status;
        } else if (structKeyExists(rc, 'STATUS')){
            status = rc.STATUS;
        }

        if (len(trim(oid)) AND len(trim(status))) {
            queryExecute("UPDATE orders SET status = :status WHERE order_id = :order_id", {
                status: {value = status, cfsqltype = "cf_sql_varchar"},
                order_id: {value = oid, cfsqltype = "cf_sql_integer"}
            });
        }

    }

    public function totalOrders(){

        return queryExecute("SELECT COUNT(*) AS count FROM orders");

    }

    public function totalRevenue(){

        return queryExecute("SELECT COALESCE(SUM(total_amount),0) AS revenue FROM orders");

    }

}
