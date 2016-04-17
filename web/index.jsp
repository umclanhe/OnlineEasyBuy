<%@page language="java" import="java.util.*, java.sql.*, domain.Product, utils.DBUtil "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="shoppingcart.js"></script>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Products</h1>
        <div id="scart"><a href="/OnlineEasyBuy/CartServlet?type=show">Shopping Cart (<span id="num">${TotalNum}</span>)</a></div>

        <table id="plist" border="1">
            <tr>
                <td>Product id</td><td>Picture</td><td>Product Name</td><td>Price</td><td>Add to cart</td>
            </tr>
            <%
                Connection conn=DBUtil.getConnection();
                Statement st=conn.createStatement();
                ResultSet rs=st.executeQuery("select * from product");
                while(rs.next()){
            %>
                    <tr>
                    <td class="td1"><%=rs.getString("pid")%></td>
                    <td class="td2"><img src=images/ProductImages/<%=rs.getString("image")%> alt="ProductImage"></td>
                    <td class="td3"><%=rs.getString("pname")%></td>
                    <td class="td4"><%=rs.getString("price")%></td>
                    
                    <td class="td5"><button type ="button" onclick="processAction(<%=rs.getString("pid")%>)">Add</button></td>
                    
                    <!--
                    <th><a href="/Assignment3/CartServlet?type=add&pid=<%//=rs.getString("pid")%>">Add</a></th>-->
                    </tr>
                <%
                }              
                %>
            
        </table>

        
    </body>
</html>
