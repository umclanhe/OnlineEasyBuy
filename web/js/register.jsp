<!DOCTYPE html>
<html lang="en">
  <head>
    <title>NutriPal</title>

    <!-- Load the css styles -->
		<!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/loginstyle.css" rel="stylesheet"/>
        <link href="css/swipebox.css" rel="stylesheet" >
        <link href='http://fonts.useso.com/css?family=Exo+2:400,900italic,900,800italic,800,700italic,700,600italic,600,500italic,500,400italic,300italic,300,200italic,200' rel='stylesheet' type='text/css'>
        <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- The End of loading css styles -->

  </head>
  <body>	
	<header id="header">
            <img src="images/logo.png">
        </header><!--/header-->	
        
        <login-signup>
                <div id="login">
                    <div class="container">
                        <div class="text-center">
				<h2>Welcome to My Nutrition Pal</h2>
			</div>
				<div class="row">
                                        <div class="col-lg-3"></div>
                                        <div class="col-md-3 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.4s">
                                            <h1 class="register-title" >Dietitian Sign Up</h1>
                                            <form class="register" name="dietsignup" action="DietCreateNewAccount" onsubmit="return validateF1()">
                                              <script language="JavaScript">
                                                     <!--
                                                       function validateF1() {
                                                        var x = document.forms["dietsignup"]["username"].value;
                                                        var y = document.forms["dietsignup"]["password"].value;
                                                        if (x == null || x == "") {
                                                        alert("username must be filled out");
                                                         return false;
                                                            }
                                                            
                                                            if (y == null || y == "") {
                                                        alert("password must be filled out");
                                                         return false;
                                                            }   
                                                         }         
                                                     //-->                  
                                                   </script>  
                                              <input type="text" class="register-input" name="firstname" size="20" placeholder="First Name">
                                              <input type="text" class="register-input" name="lastname" size="20" placeholder="Last Name">
                                              <input type="text" class="register-input" name="username" size="20" placeholder="User Name">
                                              <input type="password" class="register-input" name="password" size="20" placeholder="Password">
                                              <input type="text" class="register-input" name="email"  size="20" placeholder="Email">
                                              <input type="submit" value="Create Account" class="register-button">
                                            </form>
                                        </div>
                                        <div class="col-md-3 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">
                                            <h1 class="register-title" >Company Sign Up</h1>
                                            <form class="register" name="compsignup" action="CompCreateNewAccount" onsubmit="return validateF2()">
                                                <script language="JavaScript">
                                                     <!--
                                                       function validateF2() {
                                                        var x = document.forms["compsignup"]["username"].value;
                                                        var y = document.forms["compsignup"]["password"].value;
                                                        if (x == null || x == "") {
                                                        alert("username must be filled out");
                                                         return false;
                                                            }
                                                            
                                                            if (y == null || y == "") {
                                                        alert("password must be filled out");
                                                         return false;
                                                            }   
                                                         }         
                                                     //-->                  
                                                   </script>
                                              <input type="text" class="register-input" name="compname" size="20" placeholder="Company Name">
                                              <input type="text" class="register-input" name="username" size="20" placeholder="User Name">
                                              <input type="password" class="register-input" name="password" size="20" placeholder="Password">
                                              <input type="text" class="register-input" name="email"  size="20" placeholder="Email">
                                              <br/>
                                              <br/>
                                              <input type="submit" value="Create Account" class="register-button">
                                            </form>
                                        </div>
                                        
                                </div>
                        <div class="container">
                            <div class="text-center">
                                <h3>Already have an account? Click <a href="index.jsp">HERE</a> to login! </h3>
                            </div>
                            
                        </div>
                    </div>
                </div>
        </login-signup><!--/#login-->

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
	