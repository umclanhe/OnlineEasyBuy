<%-- 
    Document   : home
    Created on : Apr 19, 2016, 1:42:44 PM
    Author     : Lan
--%>

<%@page language="java" import="java.util.*, domain.*,service.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
   
    <!-- Load the css styles -->
	<!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/swipebox.css" rel="stylesheet" />
        <link href='http://fonts.useso.com/css?family=Exo+2:400,900italic,900,800italic,800,700italic,700,600italic,600,500italic,500,400italic,300italic,300,200italic,200' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
    <!-- The End of loading css styles -->
    <script>
        
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
                        <span id="num"><%=totnum %></span>
                    </div>
                    <span class="header-icon-cart" ><img src="images/carticon.jpg"></span>
                </a>
            </div> 
                                
            <!--Username 
            <div class="username">
		<div>
                   
                </div>
            </div>
                -->
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- The end of loading navigation bar -->

<!-----------------below this line is the special page content----------------->
<div class="banner-section">
    <div class="container">        
        <div class="col-md-3 banner-gridimg">
            <div class="homecat">
                <div class="clink">
                <a href="CategoryServlet?file=cellphone">CellPhone</a>
                </div>
            </div>
        </div>   
        <div class="col-md-8 banner-gridimg">    <!--categoryBox  -->
             <a href="CategoryServlet?file=cellphone">               
                <img src="images/ProductImages/cellphones-m7.png"
                     alt="categoryname" class="categoryImage">
            </a>
        </div> 
        <div class="col-md-3 banner-gridimg">
            <div class="homecat">
                <div class="clink">
                <a href="CategoryServlet?file=tablet">Tablet</a>
                </div>
            </div>        
        </div>    
        <div class="col-md-8 banner-gridimg">
            <a href="CategoryServlet?file=tablet">
                <img src="images/ProductImages/tablets.png"
                     alt="categoryname" class="categoryImage">
            </a>
        </div>
        <div class="col-md-3 banner-gridimg">
            <div class="homecat">
                <div class="clink">
                <a href="CategoryServlet?file=laptop">Laptop</a>
                </div>
            </div>
        </div>    
        <div class="col-md-8 banner-gridimg">
            <a href="CategoryServlet?file=laptop">
                <img src="images/ProductImages/laptops.png"
                     alt="categoryname" class="categoryImage">
            </a>
        </div>
        <div class="col-md-3 banner-gridimg">
            <div class="homecat">
                <div class="clink">
                <a href="CategoryServlet?file=TV">TV</a>
                </div>
            </div>      
        </div>    
        <div class="col-md-8 banner-gridimg">
            <a href="CategoryServlet?file=TV">
                <img src="images/ProductImages/TVs.png"
                     alt="categoryname" class="categoryImage">
            </a>
        </div>
    </div>
        <div class="clearfix"></div>
</div>
<div class="clearfix"></div> 

<!--<div class="banner-section">
    <div class="container">        
        <div class="col-md-3 banner-gridimg">
            <a href="CategoryServlet?file=cellphone">
                <img src="images/ProductImages/samsunggalaxys6.gif"
                     alt="categoryname" class="categoryImage">
            </a>
        </div>   
        <div class="col-md-8 banner-gridimg">    <!--categoryBox  -->
        <!--     <a href="CategoryServlet?file=laptop">               
                <img src="images/ProductImages/asuszenbook.jpg"
                     alt="categoryname" class="categoryImage">
            </a>
        </div> 
        <div class="col-md-3 banner-gridimg">
            <a href="CategoryServlet?file=tablet">
                <img src="images/ProductImages/appleipadair.jpg"
                     alt="categoryname" class="categoryImage">
            </a>
        </div>    
        <div class="col-md-8 banner-gridimg">
            <a href="CategoryServlet?file=TV">
                <img src="images/ProductImages/samsungju6700.jpg"
                     alt="categoryname" class="categoryImage">
            </a>
        </div>
    </div>
        <div class="clearfix"></div>
</div>
<div class="clearfix"></div>  -->


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
