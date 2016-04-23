<%@page language="java" import="java.util.*, domain.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    
    </head>
    <body>
        <h1>My Shopping Cart</h1>
        <form action="" method="post">
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
                        <td class="ctd4"><a href="/OnlineEasyBuy/CartServlet?type=delone&pid=<%=item.getPid()%>">-</a>
                            <%=item.getQuantity()%>
                            <a href="/OnlineEasyBuy/CartServlet?type=addone&pid=<%=item.getPid()%>">+</a> </td>                        
                        <td class="ctd5"><a href="/OnlineEasyBuy/CartServlet?type=delete&pid=<%=item.getPid()%>">Remove</a></td>
                    </tr>                   
                <%   
                }            
            %>
            
            <tr>
                <td id="dall"colspan="5"><a href="/OnlineEasyBuy/CartServlet?type=deleteall">Remove All</a></td>
            </tr>
            <tr>
                <td id="totalprice" colspan="5">Total price: ${TotalPrice} </td>
            </tr>
        </table>
        </form>
            <div id="cshop"><a href="/OnlineEasyBuy/CartServlet?type=continue">Continue Shopping</a></div>
            <div id="cshop"><a href="/OnlineEasyBuy/OrderServlet">Place Order</a></div>
            <!--<a href="/OnlineEasyBuy/index.jsp">Back to the HomePage</a>-->
    </body>
</html>
