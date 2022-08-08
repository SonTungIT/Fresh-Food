<%-- 
    Document   : admin
    Created on : Mar 9, 2022, 9:54:55 PM
    Author     : Lenovo Legion
--%>

<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome: <h1><%= loginUser.getFullName()%></h1>

        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" value="<%= search %>" placeholder="name of product"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <%
            List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>
        <a href="create.jsp">Create Product</a>
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
                    <th>Delete</th>
                    <th>Update</th>
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
                        <input type="hidden" name="productID" value="<%= product.getProductID()%>" required=""/>
                        <%= product.getProductID()%>
                    </td>
                    <td>
                        <input type="text" name="productName" value="<%= product.getProductName()%>" required=""/>
                    </td>
                    <td>
                        <input type="hidden" name="image" value="<%= product.getImage()%>" required=""/>
                        <img width="60px" height="50px" src="image/<%= product.getImage()%>" alt="Image can't show">
                    </td>
                    <td>
                        <input type="number" name="price" value="<%= product.getPrice()%>" required=""/>$
                    </td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="categoryID" value="<%= product.getcategoryID()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="importDate" value="<%= product.getImportDate()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="usingDate" value="<%= product.getUsingDate()%>" required=""/>
                    </td>
                    <td>
                        <%= product.isStatus()%></br>
                        <input checked="checked" type="radio" name="status" value="True" required=""/>True</br>
                        <input type="radio" name="status" value="False" required=""/>False</br>                       
                    </td>
                    <!--delete-->
                    <td>
                        <a href="MainController?action=Delete&productID=<%= product.getProductID()%>&search=<%= search%>">Delete</a>
                    </td>
                    <!--update-->
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                    
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>

    <%
            }
        }
    %>
    </body>
</html>
