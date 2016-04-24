
<%@page import="domain.Address"%>
<%@page import="domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Review</title>
    </head>
    <body>
        <h1>Order Information</h1>
        <!-- order information-->
        <table style="border-collapse: collapse" border="1">
        <tr><td colspan="4">Products Information</td></tr>
        <tr>
            <td class="ctd1" >Product id</td><td class="ctd2">Product Name</td><td class="ctd3">Price</td><td class="ctd4">Quantity</td>
        </tr>
        <%
        //get product info form request
        ArrayList al=(ArrayList)request.getAttribute("orderInfo");
        for(int i=0;i<al.size();i++){
            Product item = (Product)al.get(i);
        %>
            <tr>
                <td class="ctd1"><%=item.getPid() %></td>
                <td class="ctd2"><%=item.getPname() %></td>
                <td class="ctd3"><%=item.getPrice() %></td>
                <td class="ctd4"><%=item.getQuantity()%></td>
            </tr>                   
        <%   
        }            
        %>
        <tr>
            <td id="totalprice" colspan="4">Total price: ${totalPrice} </td>
        </tr>        
        </table>
        
        <!-- shipping information-->
        <table style="border-collapse: collapse" border="1">
        <tr><td>Shipping Address</td></tr>
        <%
        //get shipping address form request
            Address saddress = (Address)request.getSession().getAttribute("shippingAddress");            
        %>
            <tr>
                <td class="ctd1"><%=saddress.getAname() %></td>
                <td class="ctd2"><%=saddress.getStreet() %></td>
                <td class="ctd3"><%=saddress.getCity() %></td>
                <td class="ctd4"><%=saddress.getState() %> <%=saddress.getZip() %></td>
                <td class="ctd3"><%=saddress.getPhone() %></td>
            </tr>                   
        <%   
        }            
        %>        
        </table>
        
       
        
        <a href="/OnlineEasyBuy/SubmitServlet">Place Order</a>
        
    </body>
</html>
