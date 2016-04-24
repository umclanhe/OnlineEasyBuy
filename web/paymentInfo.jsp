<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Infomation</title>
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
        <h1>Payment Infomation</h1>
        <form action="/OnlineEasyBuy/ReviewServlet" method="post">
            
            <table style="border-collapse: collapse" border="1">
                <tr><td>Credit Card Number</td><td><input type="text"  maxlength="16"  name="cardNumber"></td></tr>
                <tr><td>Security Code</td><td><input type="number" min="0" max="999" name="securityCode"></td></tr>
                <tr><td>Expiration</td><td><input type="number" min="0" max="12" name="month" placeholder="Month">
                                            <input type="number" min="2016" max="2026" name="year" placeholder="Year"></td></tr>            
            </table>

            <table style="border-collapse: collapse" border="1">
                <tr><td colspan="2">Billing Address</td></tr>
                <tr><td><input type="radio" name="selectBillAdd" value="sameAdd"/></td>
                    <td>Use the Shipping Address as Billing Address</td></tr>
                <tr><td><input type="radio" name="selectBillAdd" value="new" onclick="addNew()"></td>
                    <td>Add a new address</td></tr>
            </table>

            <table id="newAddress" style="border-collapse: collapse; display: none" border="1">
                <tr><td colspan="2">Billing Address</td></tr>
                <tr><td>Name</td><td><input type="text" name="aname"></td></tr>
                <tr><td>Address(Street)</td><td><input type="text" name="street"></td></tr>
                <tr><td>City</td><td><input type="text" name="city"></td></tr>
                <tr><td>State</td><td><input type="text" name="state"></td></tr>
                <tr><td>ZIP</td><td><input type="text" name="zip"></td></tr>
                <tr><td>Phone</td><td><input type="text" name="phone"></td></tr> 
            </table>

            <input type="submit"  value="Continue"/>
        </form>
    </body>
</html>
