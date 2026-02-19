<cfoutput>
<h2>Add Product</h2>

<form action="#buildURL('productsA.insert')#" method="post">

    <input type="text" name="name" placeholder="Name" required><br><br>

    <textarea name="description" placeholder="Description" required></textarea><br><br>

    <input type="number" step="0.01" name="price" placeholder="Price" required><br><br>

    <input type="number" name="stock_quantity" placeholder="Stock" required><br><br>

    <button type="submit">Save</button>

</form>
</cfoutput>
