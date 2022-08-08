<%-- 
    Document   : shopping
    Created on : Mar 12, 2022, 2:15:51 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vegetable Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        
        <h1>Welcome: <%= loginUser.getFullName()%></h1>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" placeholder="name of product"/>
            <input type="submit" name="action" value="SearchS"/>
        </form>

        <%
            List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
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
                    <th>Add To Cart</th>
                </tr>   
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (ProductDTO product : listProduct) {
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
                        <%= product.getProductName()%>
                    </td>
                    <td>
                        <input type="hidden" name="image" value="<%= product.getImage()%>"/>
                        <img width="60px" height="50px" src="image/<%= product.getImage()%>" alt="Image can't show">
                    </td>
                    <td> 
                        <input type="hidden" name="price" value="<%= product.getPrice()%>"/>
                        <%= product.getPrice()%>$
                    </td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>"/>
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
                    <td>
                        <input type="submit" name="action" value="Add"/>
                    </td>

                </tr>
            </form>
            <%
                }
            %>
            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <%= message%>
            <form action="MainController">
                <input type="submit" name="action" value="View"/>
            </form>
        </tbody>
    </table>
    <%
            }
        }
    %>
</body>
</html>
