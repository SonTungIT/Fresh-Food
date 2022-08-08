<%-- 
    Document   : create
    Created on : Mar 11, 2022, 6:22:46 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <%
            ProductError productError= (ProductError) request.getAttribute("PRODUCT_ERROR");
            if(productError == null){
                productError = new ProductError();
            }
        %>
        <form action="MainController" method="POST">
            Product ID<input type="text" name="productID" required=""placeholder="Product ID"/>
            <%=productError.getProductIDError() %></br>
            
            Product Name<input type="text" name="productName" required=""placeholder="Product Name"/>
            <%=productError.getProductNameError() %></br>
            
            Image<input type="text" name="image" required=""placeholder="Image"/></br>
            
            Price<input type="text" name="price" required=""placeholder="Price"/></br>
            
            Quantity<input type="text" name="quantity" required=""placeholder="Quantity"/></br>
            
            Category ID<input type="text" name="categoryID" required=""placeholder="Category ID"/></br>
            
            Import Date<input type="date" name="importDate" required=""placeholder="Import Date"/></br>
            
            Using Date<input type="date" name="usingDate" required=""placeholder="Using Date"/></br>
            
            Status<input type="text" name="status" required=""placeholder="Status"/></br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>

        </form>
    </body>
</html>
