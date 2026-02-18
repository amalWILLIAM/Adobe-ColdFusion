<cfoutput>
<h2>Product List</h2>

<a href="#buildURL('productsA.index')#">
    Add Product
</a>

<br><br>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Stock</th>
    </tr>

    <cfoutput query="rc.products">
        <tr>
            <td>#product_id#</td>
            <td>#name#</td>
            <td>#price#</td>
            <td>#stock_quantity#</td>
        </tr>
    </cfoutput>

</table>
</cfoutput>
