<%-- 
    Document   : orderInfo
    Created on : 2016-4-19, 13:39:06
    Author     : zjy
--%>

<%@page import="domain.Address"%>
<%@page import="domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Information</title>
        <script>
            function addNew(){     
            document.getElementById("newAddress").style.display = "block";   

            }

            function useSaved(){
                document.getElementById("newAddress").style.display = "none";
            }
        </script>
        
    </head>
    <body>
        <h1>Delivery Information</h1>  
        
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
        
        
        <!--Add shipping information-->
        <form action="/OnlineEasyBuy/ContinueOrderServlet" method="post">
            <!--show saved address and chose-->
            <table style="border-collapse: collapse" border="1"> 
            <tr><td colspan="7">Saved Address</td></tr>
            <tr>
                <td class="ctd1" >No</td><td class="ctd2">Name</td><td class="ctd3">Street</td>
                <td class="ctd4">City</td><td class="ctd4">State</td><td class="ctd4">Zip</td><td class="ctd4">Phone</td>
            </tr>
            <%
                    //get address infomation form request
            ArrayList addlist=(ArrayList)request.getAttribute("addressList");
            for(int i=0;i<addlist.size();i++){            
                Address add = (Address)addlist.get(i);
            %>
                <tr>
                    <td class="ctd1"><input type="radio" name="selectAdd" value="<%=add.getAid()%>" onclick="useSaved()"> </td>
                    <td class="ctd2"><%=add.getAname() %></td>
                    <td class="ctd3"><%=add.getStreet() %></td>
                    <td class="ctd4"><%=add.getCity() %></td>
                    <td class="ctd4"><%=add.getState() %></td>
                    <td class="ctd4"><%=add.getZip() %></td>
                    <td class="ctd4"><%=add.getPhone() %></td>
                </tr>                   
            <%   
            }            
            %>       
                <tr><td class="ctd1"><input type="radio" name="selectAdd" value="new" onclick="addNew()"> </td>
                    <td colspan="6">Add a new address</td></tr>
            </table> 
            
            <!--add a new address   -->
            <table id="newAddress" style="border-collapse: collapse; display: none" border="1">
                
                <tr><td colspan="2">Shipping Address</td></tr>
                <tr><td>Name</td><td><input type="text" name="aname"></td></tr>
                <tr><td>Address(Street)</td><td><input type="text" name="street"></td></tr>
                <tr><td>City</td><td><input type="text" name="city"></td></tr>
                <tr><td>State</td><td><input type="text" name="state"></td></tr>
                <tr><td>ZIP</td><td><input type="text" name="zip"></td></tr>
                <tr><td>Phone</td><td><input type="text" name="phone"></td></tr>                
                
            </table>
            
            <!--use this as billing address  
            <table>
            <tr><td><input type="checkbox" name="sameAdd" value="sameAdd"/></td>
                <td>Use the Shipping Address as Billing Address</td></tr>
            </table>
            -->
                <input type="submit"  value="Continue"/>  
            
        </form>
                    
                
    </body>
</html>
