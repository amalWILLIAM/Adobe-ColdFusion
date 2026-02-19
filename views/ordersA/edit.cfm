<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<div class="container py-4">
    <h3>Edit Order Status</h3>

    <cfif rc.order.recordCount EQ 1>
        <cfset o = rc.order>
        <form method="post" action="#buildURL('ordersA.updateStatus')#">
            <input type="hidden" name="order_id" value="#o.order_id#">

            <div class="mb-3">
                <label class="form-label">Current Status</label>
                <select name="status" class="form-select">
                    <option value="Pending" <cfif o.status EQ 'Pending'>selected</cfif>>Pending</option>
                    <option value="Shipped" <cfif o.status EQ 'Shipped'>selected</cfif>>Shipped</option>
                    <option value="Delivered" <cfif o.status EQ 'Delivered'>selected</cfif>>Delivered</option>
                    <option value="Cancelled" <cfif o.status EQ 'Cancelled'>selected</cfif>>Cancelled</option>
                </select>
            </div>

            <button class="btn btn-primary">Save</button>
            <a href="#buildURL('ordersA.index')#" class="btn btn-secondary">Back</a>
        </form>
    <cfelse>
        <div class="alert alert-warning">Order not found.</div>
    </cfif>

</div>
</cfoutput>
