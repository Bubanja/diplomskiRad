<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Home page</h1>
        <p id="msg">  
            <% String msg = (String)request.getAttribute("msg");
                if(msg != null) { %>
                <%= msg %>
             <% } %>
        </p>
    </body>
</html>
