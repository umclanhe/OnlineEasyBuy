<%-- 
    Document   : postproduct
    Created on : Dec 9, 2015, 11:37:24 AM
    Author     : Lan He & Teng Yu
--%>

<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post New Products</title>
        <!-- Load the css styles -->
		<!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/poststyle.css" rel="stylesheet"/>
        <link href="css/swipebox.css" rel="stylesheet" >
        <link href='http://fonts.useso.com/css?family=Exo+2:400,900italic,900,800italic,800,700italic,700,600italic,600,500italic,500,400italic,300italic,300,200italic,200' rel='stylesheet' type='text/css'>
        <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- The End of loading css styles -->
    </head>
    <body>
        <!-- The navigation bar -->
<div class="header">
    <div class="container">
        <div class="header-top">
            <div class="top-menu">
                <span class="menu"><img src="images/nav.png" alt=""/> </span>
                <ul>
                    <li><a href="comploginok.jsp" >Home</a></li>
                    <!--<li><a href="about.html">Profiles</a></li>-->
                    <li><a href="products_1.jsp"class="active">Products</a></li>
                    <li><a href="about_1.jsp">About Us</a></li>
                 
                    <!--<li><a href="blog.html">blog</a></li>--> <!-- This is an unused section -->
                </ul>
            </div>
            <!-- nav-bar buttons-->
            <div class="buttons">
                <a href="index.jsp" class="button1">log out</a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="header-bottom">
            <!-- logo image -->
            <div class="logo">
                <a href="comploginok.jsp"> <img src="images/logo.png"></a>
            </div>
            <!-- search box -->
            <div class="search">
		<form action="search.jsp" method="post">
		    <input type="text" name="searchproduct" value="" placeholder="search...">
                    <input type="submit" value="">
		</form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- The end of loading navigation bar -->
<!-----------------below this line is the special page content----------------->
<div id="postpro">
    <div class="container">
        <div class="text-center">
		<h2>Welcome to Post Your New Products</h2>
	</div>
	<div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <h1 class="postpro-title" >New Products Info</h1>
                <form class="postpro" name="pubproduct" id="pubpro" action="CompAddProduct" method="post" onsubmit="return validateForm()">
            
                    <script language="JavaScript">
            
              function validateForm() {
             var x = document.forms["pubproduct"]["productname"].value;
             var sx = document.forms["pubproduct"]["size"].value;
             var px = document.forms["pubproduct"]["price"].value;
             if (x == null || x == "") {
             alert("Product Name must be filled out");
             return false;
              }
              if (isNaN(sx)) 
             {
              alert(" Must input numbers in the SIZE field");
              return false;
             }
             else if(sx < 0)
             {
              alert(" Must input positive numbers in the SIZE field");
              return false;
             }
              if (isNaN(px)) 
             {
              alert("Must input numbers in the PRICE field");
              return false;
             }
             else if (px < 0) 
             {
              alert("Must input positive numbers in the PRICE field");
              return false;
             }
            }                          
            </script>
            
            <input type="username" name="productname" class="register-input" placeholder="Product Name">
            <input type="username" name="size" class="register-input" placeholder="Size">
            <input type="username" name="feature" class="register-input" placeholder="Feature">
            <input type="username" name="price" class="register-input" placeholder="Price">
            <input type="username" name="imgname" class="register-input" placeholder="Image Name">
            <input type="username" name="compname" class="register-input" placeholder="Compname">
            <input type="submit" value="Add New Product" class="register-button"/>
                       
        </form>
            </div>
        </div>
    </div>
</div>

<!------------------ Above is the END of special page content ----------------->



<!--footer 效果-->

<!-- footer section -->
<div class="Resources-section">
    <div class="col-md-10 join-grid1">
        <p>  </p>
    </div>
    <div class="container">
        
	<div class="col-md-3 Resources">
            <h3>about</h3>
            <p>This is a class project for IS2560, Web Technologies and Application. Project is on going, and it is for learning purposes ONLY. Please feel free to give us any kind of help and suggestions! Thank you!</p>
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
                <li><a href="http://www.pitt.edu/~tey7">Teng Yu</a></li>
                <li><a href="http://www.pitt.edu/~wec60">Wei Cai</a></li>
                <li><a href="http://www.pitt.edu/~jiw111">Jing Wen</a></li>
                <li><a href="http://www.pitt.edu/~lah135">Lan He</a></li>
            </ul>
	</div>
        
	<div class="col-md-3 Resources1">
            <h3>social</h3>
            <ul>
                <li><a href="http://www.facebook.com/">Facebook</a></li>
                <li><a href="http://www.twitter.com/">Twitter</a></li>
                <li><a href="http://www.google.com/">Google</a></li>
                <li><a href="http://www.weibo.com/">Weibo</a></li>
            </ul>
	</div>
        
	<div class="clearfix"></div>
    </div>
</div>


    </body>
</html>
