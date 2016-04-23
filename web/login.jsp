<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="/OnlineEasyBuy/LoginServlet" method="post">
            <table border="1">
                <tr><td>Email:</td><td><input type="text" name="cemail" /></td></tr>
                <tr><td>Password:</td><td><input type="password" name="cpsw" /></td></tr>
                <tr><td><input type="submit" name="login" value="Submit"/></td><td><input type="reset" name="reset" value="Reset" /></td></tr>
            </table>           
        </form>
    </body>
</html>
