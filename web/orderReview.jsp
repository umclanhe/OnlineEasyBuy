
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

        <title>Order Review</title>
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
        <h1>Order Information</h1>
        <br>
        <!-- order information-->
        <table style="border-collapse: collapse" border="1">
        <tr><td colspan="4">Products Information</td></tr>
        <tr>
            <td class="ctd1" >Product id</td><td class="ctd2">Product Name</td><td class="ctd3">Price</td><td class="ctd4">Quantity</td>
        </tr>
        <%
        //get product info form request
        ArrayList al=(ArrayList)request.getAttribute("orderInfo");
        for(int i=0;i<al.size();i++){
            Product item = (Product)al.get(i);
        %>
            <tr>
                <td class="ctd1"><%=item.getPid() %></td>
                <td class="ctd2"><%=item.getPname() %></td>
                <td class="ctd3"><%=item.getPrice() %></td>
                <td class="ctd4"><%=item.getQuantity()%></td>
            </tr>                   
        <%   
        }            
        %>
        <tr>
            <td id="totalprice" colspan="4">Total price: ${totalPrice} </td>
        </tr>        
        </table>
     
        <!-- shipping information-->
        <table style="border-collapse: collapse" border="1">
        <tr><td>Shipping Address</td></tr>
        <%
        //get shipping address form request
            Address saddress = (Address)request.getSession().getAttribute("shippingAddress");            
        %>
            <tr>
                <td class="ctd1"><%=saddress.getAname() %></td>
                <td class="ctd2"><%=saddress.getStreet() %></td>
                <td class="ctd3"><%=saddress.getCity() %></td>
                <td class="ctd4"><%=saddress.getState() %> <%=saddress.getZip() %></td>
                <td class="ctd3"><%=saddress.getPhone() %></td>
            </tr>                                                               
        </table>       
        
        <!-- billing information-->
        <table style="border-collapse: collapse" border="1">
        <tr><td>Billing Address</td></tr>
        <%
        //get shipping address form request
            Address baddress = (Address)request.getSession().getAttribute("billingAddress");            
        %>
            <tr>
                <td class="ctd1"><%=baddress.getAname() %></td>
                <td class="ctd2"><%=baddress.getStreet() %></td>
                <td class="ctd3"><%=baddress.getCity() %></td>
                <td class="ctd4"><%=baddress.getState() %> <%=baddress.getZip() %></td>
                <td class="ctd3"><%=baddress.getPhone() %></td>
            </tr>                                                               
        </table>
       
        <div id="cshop"><a href="/OnlineEasyBuy/SubmitServlet">Place Order</a></div>
    </div>    
        
        
    </body>
</html>
