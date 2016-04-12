<!DOCTYPE HTML>
<html>
<head>
    <title>About</title>
<!-- Load the css styles -->
        <!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/aboutstyle.css" rel="stylesheet"/>
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
                    <li><a href="comploginok.jsp">Home</a></li>
                    <!--<li><a href="about.html">Profiles</a></li>-->
                    <li><a href="products.jsp">Products</a></li>
                    <li><a href="about.jsp" class="active">About Us</a></li>
                    
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
    <div id="our-team">
        
	<div class="container">
            
            <!-- title -->
            <div class="text-center">
		<h1>Our Team</h1>
            </div>
            
            <!-- team members display -->
            <div class="row">
		<div class="col-md-3">
                    <div class="text-center">
			<img src="images/1_1.png" alt="">
			<h2>Teng Yu</h2>
			<h3>Team Member</h3>
			<p>Designs CSS stylesheet, HTML webpage. jQuery and Javascript builder. </p>
                    </div>
		</div>
                
		<div class="col-md-3">
                    <div class="text-center">
			<img src="images/2_1.png" alt="">
			<h2>Wei Cai</h2>
			<h3>Team Member</h3>
			<p>Designs CSS stylesheet, HTML webpage. Javascript and image processor.</p>
                    </div>
		</div>
                
                <div class="col-md-3">
                    <div class="text-center">
                        <img src="images/3_1.png" alt="">
			<h2>Jing Wen</h2>
			<h3>Team Member</h3>
			<p>Designs Servlet, Database and JSP webpages. Function creator. </p>
                    </div>
		</div>
                
                <div class="col-md-3">
                    <div class="text-center">
			<img src="images/4_1.png" alt="">
			<h2>Lan He</h2>
			<h3>Team Member</h3>
			<p>Creates Servlets and JSP webpages. Database designer.</p>
                    </div>
		</div>
            </div>
	</div>
            
        <!-- technologies display -->
        <div class="team">
            <div class="container">
            
                <!-- tech instruction -->
                <div class="text-left">
                    <h3>Web Technologies We Use:</h3>
                </div>
            
                <!-- tech instruction -->
                <div class="row">
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
                        <div class="text-center">
                            <img src="images/html5.png" class="img-responsive" alt="">
                            <h6>HTML5</h6>
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.2s">
                        <div class="text-center">
                            <img src="images/css3.png" class="img-responsive" alt="">
                            <h6>CSS3</h6>
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.3s">
                        <div class="text-center">
                            <img src="images/javascript.png" class="img-responsive" alt="">
                                <h6>JavaScript</h6>
                        </div>
                    </div>
            
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.4s">
                        <div class="text-center">
                            <img src="images/jquery.png" class="img-responsive" alt="">
                            <h6>jQuery</h6>						
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.5s">
                        <div class="text-center">
                            <img src="images/java.png" class="img-responsive" alt="">
                            <h6>JAVA</h6>						
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">
                        <div class="text-center">
                            <img src="images/javaderby.png" class="img-responsive" alt="">
                            <h6>JAVA Derby</h6>						
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.7s">
                        <div class="text-center">
                            <img src="images/tomcat.png" class="img-responsive" alt="">
                            <h6>Tomcat</h6>						
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.8s">
                        <div class="text-center">
                            <img src="images/ajax.png" class="img-responsive" alt="">
                            <h6>AJAX</h6>						
                        </div>
                    </div>
            
                    <!-- this tech temporarily not used
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.9s">
                            <div class="text-center">
                                <img src="images/json.png" class="img-responsive" alt="">
                                <h6>JSON</h6>
                            </div>
                    </div>-->
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="1.0s">
                        <div class="text-center">
                            <img src="images/photoshop.png" class="img-responsive" alt="">
                            <h6>PhotoShop</h6>						
                        </div>
                    </div>
                
                    <div class="col-md-1 wow fadeInUp" data-wow-offset="0" data-wow-delay="1.1s">
                        <div class="text-center">
                            <img src="images/netbean.png" class="img-responsive" alt="">
                            <h6>NetBean</h6>						
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/#our-team-->
    
<!------------------ Above is the END of special page content -----------------> 
    
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