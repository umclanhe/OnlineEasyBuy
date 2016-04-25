<%@page language="java" import="java.util.*, domain.*,service.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>        
        <!-- Load the css styles -->
	<!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Own css styles -->
<!--        <link rel="stylesheet" type="text/css" href="css/orderstyle.css" />  -->  
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/swipebox.css" rel="stylesheet" />
<!--        <link href="css/component.css" rel="stylesheet"/> -->
        <link href='http://fonts.useso.com/css?family=Exo+2:400,900italic,900,800italic,800,700italic,700,600italic,600,500italic,500,400italic,300italic,300,200italic,200' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>   
        <!-- The End of loading css styles -->    
    </head>
    <body>
<%
    MyCart newcart = (MyCart)session.getAttribute("myCart");
    if(newcart == null) {
        newcart = new MyCart();
        session.setAttribute("myCart",newcart);
    }
    int totnum = newcart.getTotalNum();    
%>    
        <!-- The navigation bar -->
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
                        <a href="SignIn.jsp" class="button1">Sign in</a>
                    </div>
                    <div class="buttons">
                        <a href="CreateAccount.jsp" class="button1">Create Account</a>
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
                                <span class="header-icon-solid-circle"></span>   
                                <span class="count" id="num"><%=totnum %></span>
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
    <h1>My Shopping Cart</h1>   
    <br>
        <table border="1" style="border-collapse: collapse; width:600px;">
            <tr>
                <td class="ctd1" >Product id</td><td class="ctd2">Product Name</td><td class="ctd3">Price</td><td class="ctd4">Quantity</td><td class="ctd5">Remove</td>
            </tr>
            <%
            //get product info form request
                ArrayList al=(ArrayList)request.getAttribute("ProductList");
                for(int i=0;i<al.size();i++){
                    Product item = (Product)al.get(i);
                %>
                    <tr>
                        <td class="ctd1"><%=item.getPid() %></td>
                        <td class="ctd2"><%=item.getPname() %></td>
                        <td class="ctd3"><%=item.getPrice() %></td>
                        <td class="ctd4"><a href="CartServlet?type=delone&pid=<%=item.getPid()%>">-</a>
                            <%=item.getQuantity()%>
                            <%
                                if(item.getInventory() == item.getQuantity()) {
                            %>   
                            <a class="disableadd" href="CartServlet?type=addone&pid=<%=item.getPid()%>">+</a> </td>
                            <%   
                                }else {
                            %>
                            <a href="CartServlet?type=addone&pid=<%=item.getPid()%>">+</a> </td> 
                            <%
                                }
                            %>
                        <td class="ctd5"><a href="CartServlet?type=delete&pid=<%=item.getPid()%>">Remove</a></td>
                    </tr>                   
                <%   
                }            
            %>            
            <tr>
                <td id="dall" colspan="5"><a href="/OnlineEasyBuy/CartServlet?type=deleteall">Remove All</a></td>
            </tr>
            <tr>
                <td id="totalprice" colspan="5">Total price: ${TotalPrice} </td>
            </tr>
        </table>            
            
            <div id="cshop"><a href="/OnlineEasyBuy/OrderServlet">Place Order</a></div>    
     </div>       
    </body>
</html>
