<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="validation.js" ></script>
        <link rel="stylesheet" type="text/css" href="css/orderstyle.css" />
        <link rel="stylesheet" type="text/css" href="form.css" />
    </head>
    <body>
        <div class="login">  
            <form id="form2" name="form2" method="post" action="LoginServlet"  onsubmit="return checkAll2(this)">
                <h2 >Login</h2>
                <div>
                    <div class="formLable">Email:</div>
                    <div class="formInput">
                        <input id="email" name="cemail" type="text" onblur="checkEmail(this.id,'divright1')">
                    </div>
                    <div class="divright" id="divright1">Please enter a valid email address.</div>
                </div>
                <div>     
                    <div class="formLable">Password:</div>
                    <div class="formInput">
                        <input id="password" name="cpsw" type="password" onblur="checkPassword(this.id,'divright2')">
                    </div>
                    <div class="divright" id="divright2">The length of password should between 6 to 15.</div>
                </div>
                <div class="button">
                    <button  type="submit" value="Login">Login</button>
                </div>
                <div>Do not have an account?</div>
                <div class="button">
                    <button type="button" onclick="window.location='signup.jsp'">Sign Up</button>
                </div>
                
            </form>                
        </div>
    </body>
</html>
