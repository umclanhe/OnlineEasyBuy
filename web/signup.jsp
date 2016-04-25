<%-- 
    Document   : Signup
    Created on : 2016-4-24, 12:22:08
    Author     : zjy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/validation.js" ></script>
        <link rel="stylesheet" type="text/css" href="css/orderstyle.css" />
        <link rel="stylesheet" type="text/css" href="form.css" />
        <title>Sign Up</title>
    </head>
    <body>
        <div class="register">
                <h2>Sign Up</h2>     
                <form id="form1" name="form1" method="post" action="SignupServlet"  onsubmit="return checkAll(this)">                    
                    <div>
                        <div class="formLable">
                            Email:*
                        </div>
                        <div class="formInput">
                            <input id="email" name="cemail" type="text" onblur="checkEmail(this.id,'divright1')"/>                    
                        </div>
                        <div class="divright" id="divright1">Please enter a valid email address.</div>
                    </div>
                    <div>
                        <div class="formLable">
                            Username:*
                        </div>
                        <div class="formInput">
                            <input id="username" name="username" type="text" onblur="checkUsername(this.id,'divright2')"/>                 
                        </div>
                        <div class="divright" id="divright2">Username should contain at least 3 characters, at most 15 characters.</div>
                    </div>
                    
                    <div> 
                        <div class="formLable">
                            Password:*
                        </div>
                        <div class="formInput">
                            <input id="password" name="cpsw" type="password"  onblur="checkPassword(this.id,'divright3')"/> 
                        </div>
                        <div class="divright" id="divright3">Password should contain at least 6 characters, at most 15 characters.</div>
                    </div>
                                       
                    
                    <div class="button">
                        <button  type="reset" value="Reset">Reset</button>  
                        <button  type="submit" value="Register">Sign Up</button>         
                    </div>
                </form>
                
            </div>     
    </body>
</html>
