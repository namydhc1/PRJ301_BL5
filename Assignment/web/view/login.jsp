<%-- 
    Document   : login
    Created on : Aug 12, 2022, 1:44:21 AM
    Author     : Namqd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
            <form action="login" method="POST">
                <h3 class="name_form">Login form</h3>
                <h5 style="color: red">${requestScope.error}</h5>
                <input type="text" class ="username" name="username" placeholder="Username"/><br/>
                <input type="password" class ="password" name="password" placeholder="Password"/><br/>
                <button type="submit" class="btn_submit">Login</button><br/>
            </form>
    </body>
</html>
