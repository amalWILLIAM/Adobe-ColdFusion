<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container-fluid">

    <!-- Header -->
    <nav class="navbar navbar-light bg-light border-bottom mb-4">
        <div class="container-fluid">
            <span class="navbar-brand h5 mb-0">Admin Dashboard</span>
            <a href="#buildURL('users.logout')#" class="btn btn-outline-danger btn-sm">Logout</a>
        </div>
    </nav>

    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 border-end">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#buildURL('admin.dashboard')#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#buildURL('productsA.index')#">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#buildURL('orders.index')#">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#buildURL('users.index')#">Users</a>
                </li>
            </ul>
        </div>

        <!-- Content -->
        <div class="col-md-10">
            <h4 class="mb-4">Overview</h4>

            <div class="row g-3">

                <div class="col-md-3">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <h6>Total Users</h6>
                            <h4>#structKeyExists(rc,"totalUsers") ? rc.totalUsers : 0#</h4>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <h6>Total Products</h6>
                            <h4>#structKeyExists(rc,"totalProducts") ? rc.totalProducts : 0#</h4>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <h6>Total Orders</h6>
                            <h4>#structKeyExists(rc,"totalOrders") ? rc.totalOrders : 0#</h4>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <h6>Revenue</h6>
                            <h4>₹ #structKeyExists(rc,"totalRevenue") ? rc.totalRevenue : 0#</h4>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</cfoutput>
