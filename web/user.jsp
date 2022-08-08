<%-- 
    Document   : user
    Created on : Mar 9, 2022, 5:11:09 PM
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
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
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
    <a href="MainController?action=SearchS&search=">Happy shopping</a></br> 
</body>
</html>
