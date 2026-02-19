<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<div class="container py-4">
    <h3>Order Details</h3>

    <div class="card bg-dark text-white mb-3">
        <div class="card-body">
            <p><strong>Order ID:</strong> #rc.order.order_id#</p>
            <p><strong>User ID:</strong> #rc.order.user_id#</p>
            <p><strong>Total:</strong> ₹ #numberFormat(rc.order.total_amount, "9,999.00")#</p>
            <p><strong>Status:</strong> #rc.order.status#</p>
            <p><strong>Created:</strong> #dateFormat(rc.order.created_at, "dd-mmm-yyyy")#</p>
        </div>
    </div>

    <a href="#buildURL('ordersA.index')#" class="btn btn-sm btn-outline-light">Back to list</a>
</div>
</cfoutput>
