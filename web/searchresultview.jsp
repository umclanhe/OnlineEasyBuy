<%-- 
    Document   : searchresultview
    Created on : Apr 24, 2016, 1:14:40 AM
    Author     : Lan
--%>

<%@page language="java" import="java.util.*, domain.*,service.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE HTML>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>search result view</title>
   
    <!-- Load the css styles -->
	<!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/swipebox.css" rel="stylesheet" />
        <link href="css/component.css" rel="stylesheet"/>
        <link href='http://fonts.useso.com/css?family=Exo+2:400,900italic,900,800italic,800,700italic,700,600italic,600,500italic,500,400italic,300italic,300,200italic,200' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <script type="text/javascript" src="js/json2.js"></script>
        <script type="text/javascript" src="js/shoppingcart.js"></script>
    <!-- The End of loading css styles -->
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
                        </ul>
                    </div>
            <!-- nav-bar buttons-->
             <%                
                if((String)session.getAttribute("loginUsername") ==null){
            %>    
                <div class="buttons">
                    <a href="login.jsp" class="button1">Login</a>
                </div>
                <div class="buttons">
                    <a href="signup.jsp" class="button1">Create Account</a>
                </div>
            <% }else{
                    %>               
                <div class="buttons">                    
                    <a class="button1" href="/OnlineEasyBuy/logoutServlet">Logout</a>                   
                </div>
                <div class="buttons">
                    <%=(String)session.getAttribute("loginUsername") %>
                </div>
            <%}%>
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

<!-----------------below this line is the special page content----------------->
<%
    List<Product> productList = (ArrayList) request.getAttribute("productlist"); 
    String keyword =(String) request.getAttribute("searchkey");
%>  
<div class="component">
    <h2>Search Results for the search key" <%=keyword  %> "</h2><br/>
    <%
        int length = productList.size();
        if(length == 0) {
     %>
    <h2>There is 0 result, Please change keywords to search again!</h2><br/>
    <%
        }else {
    %>
        <table>  
            <tr>
                <th>Product Image</th>
                <th>Feature</th>
                <th>Price</th>
                <th>Add to cart</th>
            </tr>
                    <%
                     for(int i=0; i < productList.size();i++) {
                         Product item =(Product)productList.get(i);
                     %>    
                    <tr>
                        <td width="30%"><img src="images/ProductImages/<%=item.getPicture() %>" alt="imageofproduct" height="170"></td>
                        <td width="40%"><%=item.getFeature() %></td>
                        <td width="10%"><%=item.getPrice() %></td>
                        <td width="20%">
                        <%
                            if(item.getInventory() == 0) {
                        %>
                           <span class="outofstock"> Out Of Stock</span>
                        </td>
                        <%
                            } else {    
                        %>        
                            <button type ="button" onclick="processAction(<%=item.getPid() %>)">Add</button>
                        </td>
                        <%
                            }
                        %>                          
                    </tr>    
                    <%
                     } 
                   %>
                </table>                    
    <%                
        }
    %>
</div>
<div class="clearfix"></div>
 </body>
</html>
