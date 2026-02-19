<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: ##0f172a; /* deep slate */
    }

    .topbar {
        background: ##111827;
        border-bottom: 1px solid ##1f2937;
    }

    .sidebar {
        background: ##111827;
        min-height: 100vh;
        border-right: 1px solid ##1f2937;
    }

    .sidebar .nav-link {
        color: ##9ca3af;
        padding: 12px 18px;
        border-radius: 8px;
        margin-bottom: 8px;
        transition: all 0.2s ease;
    }

    .sidebar .nav-link:hover {
        background: ##1f2937;
        color: ##ffffff;
    }

    .sidebar .nav-link.active {
        background: linear-gradient(135deg, ##2563eb, ##3b82f6);
        color: ##ffffff;
    }

    .dashboard-card {
        border-radius: 14px;
        padding: 25px;
        color: ##ffffff;
        box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        transition: transform 0.2s ease;
    }

    .dashboard-card:hover {
        transform: translateY(-6px);
    }

    .card-users {
        background: linear-gradient(135deg, ##3b82f6, ##2563eb);
    }

    .card-products {
        background: linear-gradient(135deg, ##10b981, ##059669);
    }

    .card-orders {
        background: linear-gradient(135deg, ##f59e0b, ##d97706);
    }

    .card-revenue {
        background: linear-gradient(135deg, ##8b5cf6, ##7c3aed);
    }

    .section-card {
        background: ##111827;
        border-radius: 14px;
        padding: 25px;
        color: ##d1d5db;
        box-shadow: 0 8px 20px rgba(0,0,0,0.25);
    }

</style>

<div class="container-fluid">

    <!-- Top Navbar -->
    <nav class="navbar topbar px-4 py-3 mb-4">
        <span class="navbar-brand text-white fw-semibold fs-5">
            Admin Dashboard
        </span>
        <a href="#buildURL('auth.logout')#" 
           class="btn btn-outline-light btn-sm">
            Logout
        </a>
    </nav>

    <div class="row">

        <!-- Sidebar -->
        <div class="col-md-2 sidebar p-4">

            <h6 class="text-uppercase text-secondary mb-4">Navigation</h6>

            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#buildURL('admin.dashboard')#">
                        Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#buildURL('productsA.index')#">
                        Products
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#buildURL('ordersA.index')#">
                        Orders
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#buildURL('usersA.index')#">
                        Users
                    </a>
                </li>
            </ul>

        </div>

        <!-- Main Content -->
        <div class="col-md-10 px-5">

            <h3 class="text-white mb-4 fw-semibold">Overview</h3>

            <div class="row g-4">

                <div class="col-md-3">
                    <div class="dashboard-card card-users text-center">
                        <h6>Total Users</h6>
                        <h2 class="fw-bold mt-2">
                            #( structKeyExists(rc,"totalUsers") ? rc.totalUsers : 0 )#
                        </h2>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="dashboard-card card-products text-center">
                        <h6>Total Products</h6>
                        <h2 class="fw-bold mt-2">
                            #rc.count.count#
                        </h2>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="dashboard-card card-orders text-center">
                        <h6>Total Orders</h6>
                        <h2 class="fw-bold mt-2">
                            #( structKeyExists(rc,"totalOrders") ? rc.totalOrders : 0 )#
                        </h2>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="dashboard-card card-revenue text-center">
                        <h6>Total Revenue</h6>
                        <h2 class="fw-bold mt-2">
                            ₹ #( structKeyExists(rc,"totalRevenue") ? rc.totalRevenue : 0 )#
                        </h2>
                    </div>
                </div>

            </div>

            <!-- Lower Section -->
            <div class="row mt-5 g-4">

                <div class="col-md-6">
                    <div class="section-card">
                        <h6 class="mb-3 text-white">Recent Orders</h6>
                        <p class="small">
                            Display the latest 5 placed orders here.
                        </p>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="section-card">
                        <h6 class="mb-3 text-white">System Activity</h6>
                        <p class="small">
                            Show recent user registrations and product updates.
                        </p>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>
</cfoutput>
