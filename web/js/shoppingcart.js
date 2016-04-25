function processAction(pid)
{
   
    var xhr = createXHR();
    xhr.onreadystatechange = processResponse;    
    // prepare the data for the server �simplistic GET  
    //var url = "AddProduct.java?pid="+pid;     
    xhr.open("GET", "AddProduct?pid="+pid+"&"+ new Date().getTime(), true); 
    //send the request
    xhr.send();
//    alert("AJAX is working!");
    
    function processResponse() {
        if (xhr.readyState == 4) {            
            if (xhr.status == 200) {
                var message = xhr.responseText;
//               var number = parseInt(message,10);
//                if(number == 0) {
//                    alert("The product is out of stock!");
//                }
//                else if (number == -1) {
//                    alert("Inventory shortage:");
//                }
                alert("Product successfully added to shopping cart!");
                var node = document.getElementById("num");
                node.innerHTML=message;
              
            }else{
                alert(xhr.status);
        }
    }
  }
}


function createXHR() {
    // This function creates the correct form of the XMLHttpRequestObject based on the browser
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        XHR = new XMLHttpRequest();
        if (XHR.overrideMimeType) {
            XHR.overrideMimeType('text/html');
            }
        browserType="Mozilla"
        return XHR;
    } //end mozilla attempt
    if (window.ActiveXObject) { // IE
	try {
            XHR = new ActiveXObject("Msxml2.XMLHTTP");
            browserType="IE";
            return XHR;
	} 
        catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                browserType="IE";
            }
            catch (e) {
                alert("Your browser does not support AJAX!");
                browserType="Unknown"
                return null;
                }
            }
    }//end IE attempt 
return null;
}

