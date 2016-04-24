<%-- 
    Document   : categoryview
    Created on : Apr 22, 2016, 4:13:32 PM
    Author     : Lan
--%>

<%@page language="java" import="java.util.*, domain.*,service.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE HTML>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>category view</title>
   
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

<!-----------------below this line is the special page content----------------->
<%
    Category newcategory = (Category) session.getAttribute("category");
    String selectedcname = newcategory.getCategoryname();
    List<Product> productList = newcategory.getCproducts();                      
%>  
<div class="banner-section">
    <div class="container">        
        <div class="service-grids">
            <div class="service1">
                <div class="col-md-3">
                    <a href="CategoryServlet?file=cellphone" class="button5">CellPhone</a>   
	        </div>
                <div class="col-md-3">                
                    <a href="CategoryServlet?file=laptop" class="button5">Laptop</a>                 
	        </div>
                <div class="col-md-3">                    
                    <a href="CategoryServlet?file=tablet" class="button5">Tablet</a>             
	        </div>
                <div class="col-md-3">                    
                    <a href="CategoryServlet?file=TV" class="button5">TV</a>               
                </div>
            </div>
        </div>
        <div class="component">
                <table>
                    <tr>
                        <th>Product Image</th>
                        <th>Feature</th>
                        <th>Price</th>
                        <th>Add to cart</th>
                    </tr>
                    <%
                     for(int i=0; i < productList.size();i++) {
                         Product item = productList.get(i);
                     %>    
                    <tr>
                        <td width="30%"><img src="images/ProductImages/<%=item.getPicture() %>" alt="imageofproduct" height="170"></td>
                        <td width="40%"><%=item.getFeature() %></td>
                        <td width="10%"><%=item.getPrice() %></td>
                        <td width="20%">
                        <!--    <input type="button" name="submit" value="add to cart" id="submit" onclick = "processAction(<%=item.getPid() %>)"/>     -->    
                            <button type ="button" onclick="processAction(<%=item.getPid() %>)">Add</button>
                        </td>
                    </tr>    
                    <%
                     } 
                   %>
                </table>       
        </div>
    </div>
        <div class="clearfix"></div>
</div> 
    <div class="clearfix"></div>
    
    <!------------------ Above is the END of special page content ----------------->

<!-- footer section -->
<div class="col-md-10 join-grid1">
        <p>  </p>
</div>
<div class="Resources-section">

    <div class="container">
        
	<div class="col-md-3 Resources">
            <h3>about</h3>
            <p>This is a class project for IS2730, E-Business. Project is on going, and it is for learning purposes ONLY. Please feel free to give us any kind of help and suggestions! Thank you!</p>
	</div>
        
	<div class="col-md-3 Resources1">
            <h3>resources</h3>
            <ul>
                <li><a href="http://www.eatright.org/">ADA Association Website</a></li>
                <li><a href="https://www.nutritioncare.org/Dietetics/">ASPEN Association Websit</a>e</li>
                <li><a href="http://www.pitt.edu/">University of Pittsburgh</a></li>
                <li><a href="http://www.sis.pitt.edu/spring/">Professor Spring Website</a></li>
            </ul>
	</div>
        
	<div class="col-md-3 Resources1">
            <h3>members</h3>
            <ul>
                <li><a href="http://www.pitt.edu/~jiz121">Jingyun Zhang</a></li>
                <li><a href="http://www.pitt.edu/~lah135">Lan He</a></li>
            </ul>
	</div>
        
	<div class="col-md-3 Resources1">
            <h3>social</h3>
            <ul>
                <li><a href="http://www.facebook.com/">Facebook</a></li>
                <li><a href="http://www.twitter.com/">Twitter</a></li>
            </ul>
	</div>
        
	<div class="clearfix"></div>
    </div>
</div>
                
</body>
</html>
