<%-- 
    Document   : login
    Created on : Mar 9, 2022, 8:21:38 PM
    Author     : Lenovo Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Input your information:</h1>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required="" placeholder="User ID"/></br>
            Password<input type="password" name="password" required="" placeholder="Password"/></br>
            <!-- reCAPTCHA -->
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            <div class="g-recaptcha"
                 data-sitekey="6LdXp9QeAAAAAESWmDC6D5rJ1xh4gUmsuTAWlS2h"></div>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>

        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
