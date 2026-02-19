<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container vh-100 d-flex justify-content-center align-items-center">

    <div class="card shadow-sm" style="width: 500px;">
        <div class="card-body">

            <h4 class="card-title text-center mb-4">Add Product</h4>

            <form action="#buildURL('productsA.insert')#" 
                  method="post" 
                  enctype="multipart/form-data">

                <div class="mb-3">
                    <label class="form-label">Product Name</label>
                    <input type="text"
                           name="name"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description"
                              class="form-control"
                              rows="3"
                              required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input type="number"
                           step="0.01"
                           name="price"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Stock Quantity</label>
                    <input type="number"
                           name="stock_quantity"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Product Image</label>
                    <input type="file"
                           name="image"
                           class="form-control"
                           required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-success">
                        Save Product
                    </button>
                </div>

            </form>

            <hr>

            <div class="text-center">
                <a href="#buildURL('productsA.index')#" 
                   class="text-decoration-none">
                    ← Back to Product List
                </a>
            </div>

        </div>
    </div>

</div>
</cfoutput>
