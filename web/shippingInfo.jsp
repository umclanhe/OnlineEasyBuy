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
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="form.css" />
        <script src="validation.js" ></script>
        <title>Order Information</title>
        <script>
            function addNew(){     
            document.getElementById("newAddress").style.display = "inline-block";   

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
        <form action="/OnlineEasyBuy/ContinueOrderServlet" method="post" onsubmit="return checkShipping()">
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
                <tr><td class="ctd1"><input id="valid" type="radio" name="selectAdd" value="new" onclick="addNew()"> </td>
                    <td colspan="6">Add a new address</td></tr>
            </table> 
            
            <!--add a new address   -->
            <div id="newAddress" style="display: none" >
                <div>
                    <div class="formLable">Name:</div>
                    <div class="formInput">
                        <input id="aname" name="aname" type="text" onblur="checkName(this.id,'divright1')">
                    </div>
                    <div class="divright" id="divright1">Please enter a valid name.</div>
                </div>
                <div>     
                    <div class="formLable">Address:</div>
                    <div class="formInput">
                        <input id="street" name="street" type="text" onblur="checkAdd(this.id,'divright2')">
                    </div>
                    <div class="divright" id="divright2">Please enter a valid Address.</div>
                </div>
                <div>
                    <div class="formLable">City:</div>
                    <div class="formInput">
                        <input id="city" name="city" type="text" onblur="checkName(this.id,'divright3')">
                    </div>
                    <div class="divright" id="divright3">Please enter a valid email city.</div>
                </div>
                <div>
                    <div class="formLable">State:</div>
                    <div class="formInput">
                        <input id="state" name="state" type="text" onblur="checkState(this.id,'divright4')">
                    </div>
                    <div class="divright" id="divright4">Please enter a valid email state.</div>
                </div>
                <div>
                    <div class="formLable">ZIP:</div>
                    <div class="formInput">
                        <input id="zip" name="zip" type="text" onblur="checkZip(this.id,'divright5')">
                    </div>
                    <div class="divright" id="divright5">Please enter a valid email zip code.</div>
                </div>
                <div>
                    <div class="formLable">Phone:</div>
                    <div class="formInput">
                        <input id="phone" name="phone" type="text" onblur="checkPhone(this.id,'divright6')">
                    </div>
                    <div class="divright" id="divright6">Please enter a valid phone number.</div>
                </div>
            </div>
            
            <div class="button">
                <button type="submit"  value="Continue" >Continue</button>
            </div>
            
        </form>
                    
                
    </body>
</html>
