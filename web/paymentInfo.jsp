<%@page import="domain.Address"%>
<%@page import="domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.MyCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--    <link rel="stylesheet" type="text/css" href="css/orderstyle.css" /> -->
    <!--    <link rel="stylesheet" type="text/css" href="form.css" />   -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/swipebox.css" rel="stylesheet" />
        <link href='http://fonts.useso.com/css?family=Exo+2:400,900italic,900,800italic,800,700italic,700,600italic,600,500italic,500,400italic,300italic,300,200italic,200' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
       
        <title>Payment Infomation</title>
        <script src="js/validation.js" ></script>
        <script>
            function addNew(){     
            document.getElementById("newAddress").style.display = "inline-block";

            }

            function useSaved(){
                document.getElementById("newAddress").style.display = "none";
            }
        </script>
        
    </head>
    <body>
               <!-- The navigation bar -->
<%
    MyCart newcart = (MyCart)session.getAttribute("myCart");
    if(newcart == null) {
        newcart = new MyCart();
        session.setAttribute("myCart",newcart);
    }
    int totnum = newcart.getTotalNum();
    
 %>   
<div class="header">
    <div class="container">
        <div class="header-top">
            <div class="top-menu">
                <span class="menu"><img src="images/nav.png" alt=""/> </span>
                <ul>
                    <li><a href="home.jsp" class="active">Home</a></li>
                    <!--<li><a href="Profiles.html">Profiles</a></li>-->
                    <li><a href="AllProductServlet">Products</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                </ul>
            </div>
            <!-- nav-bar buttons-->
            <div class="buttons">
                <a href="login.jsp" class="button1">Sign in</a>
            </div>
            <div class="buttons">
                <a href="signup.jsp" class="button1">Create Account</a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="header-bottom">
            <!-- logo image -->
            <div class="logo">
                <a href="home.jsp"> <img src="images/logo.jpg"></a>
            </div>
            <!-- search box -->
            <div class="search">
		<form action="SearchServlet" method="post">
		    <input type="text" name="searchproduct" value="" placeholder="search...">
                    <input type="submit" value="">
		</form>
            </div>
            <!--shopping cart-->
            <div class="cart-wrap">
                <a href="/OnlineEasyBuy/CartServlet?type=show" label="cart">
                    <div class="count-container" aria-hiddern="true">                        
                        <span id="num"><%=totnum %></span>
                    </div>
                    <span class="header-icon-cart" ><img src="images/carticon.jpg"></span>
                </a>
            </div>               
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- The end of loading navigation bar -->

    <div class="shoppingcartshow">
        <h1>Payment Infomation</h1>
        <br>
        <form action="/OnlineEasyBuy/ReviewServlet" method="post" onsubmit="return checkShipping()">
         <div class="shoppingcartshow">
            <table style="border-collapse: collapse" border="1">
                <tr><td>Credit Card Number</td><td><input type="text" id="cardNumber" name="cardNumber" onblur="checkCard(this.id,'divright11')"></td>
                    <td><div class="divright" id="divright11">Please enter a valid card number.</div></td>
                </tr>
                <tr><td>Security Code</td><td><input type="text" id="securityCode" name="securityCode" onblur="checkSecurity(this.id,'divright12')"></td>
                    <td><div class="divright" id="divright12">Please enter a valid Security Code.</div></td>
                </tr>
                <tr><td>Expiration</td><td><input type="number" min="1" max="12" id="month" name="month" placeholder="Month" onblur="checkMonth(this.id,'divright13')"></td>
                    <td><div class="divright" id="divright13">Please enter a valid month.</div></td>
                </tr> 
                <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><td><input type="number" min="2016" max="2026" name="year" id="year" placeholder="Year" onblur="checkYear(this.id,'divright14')"></td>                
                    <td><div class="divright" id="divright14">Please enter a valid year.</div></td>
                </tr>  
            </table>
        </div>        
      
        <div class="shoppingcartshow">
            <table style="border-collapse: collapse" border="1">
                <tr><td colspan="2">Billing Address</td></tr>
                <tr><td><input type="radio" name="selectBillAdd" value="sameAdd" onclick="useSaved()"/></td>
                    <td>Use the Shipping Address as Billing Address</td></tr>
                <tr><td><input id="valid" type="radio" name="selectBillAdd" value="new" onclick="addNew()"></td>
                    <td>Add a new address</td></tr>
            </table>
        </div>    

                    <!--add a new address   -->
            <div id="newAddress" style="display: none" >
                <div>
                    <div class="formLable">Name:</div>
                    <div class="formInput">
                        <input id="aname" name="aname" type="text" onblur="checkName(this.id,'divright1')">
                    </div>
                    <div class="divright" id="divright1">Please enter a valid name.</div>
                </div>
                <div>     
                    <div class="formLable">Address:</div>
                    <div class="formInput">
                        <input id="street" name="street" type="text" onblur="checkAdd(this.id,'divright2')">
                    </div>
                    <div class="divright" id="divright2">Please enter a valid Address.</div>
                </div>
                <div>
                    <div class="formLable">City:</div>
                    <div class="formInput">
                        <input id="city" name="city" type="text" onblur="checkName(this.id,'divright3')">
                    </div>
                    <div class="divright" id="divright3">Please enter a valid email city.</div>
                </div>
                <div>
                    <div class="formLable">State:</div>
                    <div class="formInput">
                        <input id="state" name="state" type="text" onblur="checkState(this.id,'divright4')">
                    </div>
                    <div class="divright" id="divright4">Please enter a valid email state.</div>
                </div>
                <div>
                    <div class="formLable">ZIP:</div>
                    <div class="formInput">
                        <input id="zip" name="zip" type="text" onblur="checkZip(this.id,'divright5')">
                    </div>
                    <div class="divright" id="divright5">Please enter a valid email zip code.</div>
                </div>
                <div>
                    <div class="formLable">Phone:</div>
                    <div class="formInput">
                        <input id="phone" name="phone" type="text" onblur="checkPhone(this.id,'divright6')">
                    </div>
                    <div class="divright" id="divright6">Please enter a valid phone number.</div>
                </div>
            </div>
            
            <div class="button">
                <button type="submit"  value="Continue" >Continue</button>
            </div>       
           
        </form>
    </div>
    
    </body>
</html>
