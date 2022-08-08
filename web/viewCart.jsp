<%-- 
    Document   : ViewCart
    Created on : Mar 12, 2022, 11:04:45 AM
    Author     : Lenovo Legion
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vegetable Page</title>
    </head>
    <body>
        <h1>Your selected Vegetable</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category ID</th>
                    <th>Import Date</th>
                    <th>Using Date</th>
                    <th>Status</th>
                    <th>Total</th>
                    <th>Edit</th>
                    <th>Remove</th>
                </tr>   
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (ProductDTO product : cart.getCart().values()) {
                        total += product.getPrice()* product.getQuantity();
                %>
                <form action="MainController">

                <tr>
                    <td><%= count++%></td>

                    <td>
                        <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                        <%= product.getProductID()%>
                    </td>
                    <td>
                        <input type="hidden" name="productName" value="<%= product.getProductName()%>"/>
                        <%= product.getProductName()%></td>
                    <td>
                        <input type="hidden" name="image" value="<%= product.getImage()%>"/>
                        <img width="60px" height="50px" src="image/<%= product.getImage()%>" alt="Image can't show">
                    </td>
                    <td> 
                        <input type="hidden" name="price" value="<%= product.getPrice()%>"/>
                        <%= product.getPrice()%>$
                    </td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>" required="" min = "1"/>
                    </td>
                    <td>
                        <input type="hidden" name="categoryID" value="<%= product.getcategoryID()%>" />
                        <%= product.getcategoryID()%>
                    </td>
                    <td>
                        <input type="hidden" name="importDate" value="<%= product.getImportDate()%>"/>
                        <%= product.getImportDate()%>
                    </td>
                    <td>
                        <input type="hidden" name="usingDate" value="<%= product.getUsingDate()%>"/>
                        <%= product.getUsingDate()%>
                    </td>
                    <td>
                        <input type="hidden" name="status" value="<%= product.isStatus()%>"/>
                        <%= product.isStatus()%>
                    </td>
                    <td><%= product.getPrice() * product.getQuantity()%>$</td>
                    <!--edit-->
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                    <!--remove-->
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
        <h1>Total: <%= total %>$</h1>
    <%
            }
        }
    %>
    <a href="MainController?search=a&action=SearchS">Add more</a>
</body>
</html>
