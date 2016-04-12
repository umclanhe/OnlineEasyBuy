<%-- 
    Document   : search
    Created on : Dec 12, 2015, 10:24:48 PM
    Author     : Lan He & Teng Yu
--%>

<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

    <html>
          <head>
           <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>Search Results</title>
           <!-- Load the css styles -->
		<!-- Bootstrap nav-bar frame-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Own css styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/component.css" rel="stylesheet"/>
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
                    <li><a href="search.jsp" class="active">indication </a></li>
                    <!--<li><a href="about.html">Profiles</a></li>
                    <li><a href="products.html">Products</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="contact.html">Contact</a></li>
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
                <img src="images/logo.png">
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
    <%
          Connection conn=null;
          String sproductname;
          Statement st;
          ResultSet rs = null;
          sproductname = request.getParameter("searchproduct"); 
          int count =0;
    %>       
        
          <div class="component">
<h2>Search Results for the search key" <%=  sproductname  %> "</h2><br/>
          <table>
   <tr>
   <th>Product Name</th>
   <th>Size</th>
   <th>Feature</th>
   <th>Price</th>
   <th>Company</th>
   </tr>
    <%
          try{
              Class.forName("org.apache.derby.jdbc.ClientDriver");
              String connectionURL = "jdbc:derby://localhost:1527/finalproject";
              conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");
              st = conn.createStatement();
              
  //            String q1 = new String("SELECT * FROM IS2560.PRODUCT WHERE PNAME LIKE '% "+ sproductname +" %'"); 
 //             String q1 = new String("SELECT * FROM IS2560.PRODUCT WHERE UPPER(PNAME) LIKE UPPER('Ensure%')");
                String q1 = new String("SELECT * FROM IS2560.PRODUCT WHERE UPPER(PNAME) LIKE UPPER('%"+sproductname+"%')");
               rs = st.executeQuery(q1);
                System.out.println("searching function works!");
                while (rs.next()) {
                    count++;
                    System.out.println("count:"+count);
    %>              
         <tr>
   <td><%= rs.getString("PNAME")%></td>
   <td><%= rs.getInt("SIZE")%></td>
   <td><%= rs.getString("FEATURE")%></td>
   <td><%= rs.getFloat("PRICE")%></td>
   <td><%= rs.getString("PCOMPANY")%></td>
</tr>
    <%                    
            }
            rs.close();
            st.close();
             }
          catch( ClassNotFoundException cnfe)
          {
            cnfe.printStackTrace();
            System.out.println("the connection of searching is NOT working");
          }
          catch (SQLException se)
          {
            se.printStackTrace();  
             System.out.println("the connection of searching is NOT working");
          }
        %>
          
       </body>       
    </html>  
       
          
          
        
        
      