<cfoutput>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container-fluid">

    <div class="row">
        <div class="col-md-12 px-5">

            <h3 class="text-white mb-4 fw-semibold">Products</h3>

            <div class="section-card">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h6 class="text-white mb-0">Product List</h6>

                    <a href="#buildURL('productsA.add')#" 
                       class="btn btn-sm btn-outline-light">
                        + Add Product
                    </a>
                </div>

                <div class="table-responsive">
                    <table class="table table-dark table-hover align-middle mb-0">

                        <thead>
                            <tr class="text-secondary">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Stock</th>
                                <th>Image</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <cfif rc.products.recordCount EQ 0>
                                <tr>
                                    <td colspan="7" class="text-center text-secondary py-4">
                                        No products found.
                                    </td>
                                </tr>
                            <cfelse>

                                <cfloop query="rc.products">
                                    <tr>
                                        <td class="fw-semibold">#product_id#</td>
                                        <td>#encodeForHTML(name)#</td>
                                        <td>#encodeForHTML(description)#</td>
                                        <td>₹ #numberFormat(price, "9,999.00")#</td>
                                        <td>#stock_quantity#</td>

                                        <td>
                                            <cfif len(trim(image))>
                                                <img src="/shopping_website/assets/products/#encodeForHTMLAttribute(image)#"
                                                     alt="#encodeForHTMLAttribute(name)#"
                                                     class="img-thumbnail bg-dark border-secondary"
                                                     width="80">
                                            <cfelse>
                                                <img src="/shopping_website/assets/no-image.jpg"
                                                     alt="No image"
                                                     class="img-thumbnail bg-dark border-secondary"
                                                     width="80">
                                            </cfif>
                                        </td>

                                        <td class="text-center">
                                            <a href="#buildURL('productsA.edit')#&product_id=#product_id#"
                                               class="btn btn-sm btn-outline-warning me-1">
                                                Edit
                                            </a>

                                            <a href="#buildURL('productsA.deleteProduct')#&product_id=#product_id#"
                                               class="btn btn-sm btn-outline-danger"
                                               onclick="return confirm('Are you sure you want to delete this product?');">
                                                Delete
                                            </a>
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
