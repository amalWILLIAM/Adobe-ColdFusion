<cfoutput query="rc.products">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container-fluid">

    <div class="row vh-100 d-flex justify-content-center align-items-center">
        <div class="col-md-6 col-lg-5">

            <h3 class="text-white mb-4 fw-semibold text-center">
                Edit Product
            </h3>

            <div class="section-card">

                <form action="#buildURL('productsA.updateProduct')#" 
                      method="post" 
                      enctype="multipart/form-data">

                    <input type="hidden" 
                           name="product_id" 
                           value="#product_id#">

                    <div class="mb-3">
                        <label class="form-label text-light">Product Name</label>
                        <input type="text"
                               name="name"
                               class="form-control bg-dark text-light border-secondary"
                               value="#encodeForHTML(name)#"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label text-light">Description</label>
                        <textarea name="description"
                                  class="form-control bg-dark text-light border-secondary"
                                  rows="3"
                                  required>#encodeForHTML(description)#</textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label text-light">Price</label>
                        <input type="number"
                               step="0.01"
                               name="price"
                               class="form-control bg-dark text-light border-secondary"
                               value="#price#"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label text-light">Stock Quantity</label>
                        <input type="number"
                               name="stock_quantity"
                               class="form-control bg-dark text-light border-secondary"
                               value="#stock_quantity#"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label text-light">Current Image</label><br>

                        <cfif len(trim(image))>
                            <img src="/shopping_website/assets/products/#encodeForHTMLAttribute(image)#"
                                 alt="#encodeForHTMLAttribute(name)#"
                                 class="img-thumbnail bg-dark border-secondary mb-2"
                                 width="120">
                        <cfelse>
                            <img src="/shopping_website/assets/no-image.jpg"
                                 alt="No image"
                                 class="img-thumbnail bg-dark border-secondary mb-2"
                                 width="120">
                        </cfif>
                    </div>

                    <div class="mb-3">
                        <label class="form-label text-light">Change Image</label>
                        <input type="file"
                               name="image"
                               class="form-control bg-dark text-light border-secondary">
                        <small class="text-secondary">
                            Leave empty if you don’t want to change the image.
                        </small>
                    </div>

                    <div class="d-grid mt-4">
                        <button type="submit" 
                                class="btn btn-outline-warning">
                            Update Product
                        </button>
                    </div>

                </form>

                <hr class="border-secondary">

                <div class="text-center">
                    <a href="#buildURL('productsA.index')#" 
                       class="text-decoration-none text-light">
                        ← Back to Product List
                    </a>
                </div>

            </div>

        </div>
    </div>

</div>
</cfoutput>
