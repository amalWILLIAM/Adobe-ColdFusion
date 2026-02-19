<cfinclude template="/shopping_website/views/includes/header.cfm">

<cfoutput>
<div class="container-fluid">

    <div class="row">

        <!-- Sidebar Space (since layout already has sidebar) -->
        <div class="col-md-12 px-5">

            <h3 class="text-white mb-4 fw-semibold">Orders</h3>

            <div class="section-card">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h6 class="text-white mb-0">Order List</h6>
                </div>

                <div class="table-responsive">
                    <table class="table table-dark table-hover align-middle mb-0">

                        <thead>
                            <tr class="text-secondary">
                                <th>Order ID</th>
                                <th>User ID</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Created</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <cfif rc.orders.recordCount EQ 0>
                                <tr>
                                    <td colspan="6" class="text-center text-secondary py-4">
                                        No orders found.
                                    </td>
                                </tr>
                            <cfelse>

                                <cfloop query="rc.orders">
                                    <tr>
                                        <td class="fw-semibold">#order_id#</td>
                                        <td>#user_id#</td>
                                        <td>₹ #numberFormat(total_amount, "9,999.00")#</td>

                                        <td>
                                            <cfif status EQ "Pending">
                                                <span class="badge bg-warning text-dark">
                                                    Pending
                                                </span>
                                            <cfelseif status EQ "Shipped">
                                                <span class="badge bg-info text-dark">
                                                    Shipped
                                                </span>
                                            <cfelseif status EQ "Delivered">
                                                <span class="badge bg-success">
                                                    Delivered
                                                </span>
                                            <cfelseif status EQ "Cancelled">
                                                <span class="badge bg-danger">
                                                    Cancelled
                                                </span>
                                            <cfelse>
                                                <span class="badge bg-secondary">
                                                    #status#
                                                </span>
                                            </cfif>
                                        </td>

                                        <td>#dateFormat(created_at, "dd-mmm-yyyy")#</td>

                                        <td class="text-center">
                                            <a href="#buildURL('ordersA.edit')#&order_id=#order_id#" class="btn btn-sm btn-outline-light me-2">Edit</a>
                                            <a href="#buildURL('ordersA.view')#&order_id=#order_id#" class="btn btn-sm btn-outline-light">View</a>
                                        </td>
                                    </tr>
                                </cfloop>

                            </cfif>

                        </tbody>

                    </table>
                </div>

            </div>

        </div>

    </div>

</div>

</cfoutput>
