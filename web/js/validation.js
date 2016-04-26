//check email
function checkEmail(str1,str2){
	var value = document.getElementById(str1).value;
	if(!isEmail(value)){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function isEmail(s){
	var patrn=/^\w+([-+.]\w+)*@\w+([-.]\\w+)*\.\w+([-.]\w+)*$/;
	if (!patrn.exec(s)) 
		return false;
	return true;
}
//check username        
function checkUsername(str1,str2){
	var value = document.getElementById(str1).value;
	if(value.length<3||value.length>15){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}



//check password
function checkPassword(str1,str2){
	var value = document.getElementById(str1).value;
	if(value.length < 6||value.length > 15){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function checkAll(){
	if(checkEmail('email','divright1')&&checkUsername('username','divright2')&&checkPassword('password','divright3')){
	    return true;	
        //location = "reg_success.html";	
	}
	return false;	
}
function checkAll2(){   
	if(checkEmail('email','divright1')&&checkPassword('password','divright2')){
	    return true;	
        //location = "reg_success.html";	
	}
	return false;	
}
//--------------------------------------------------------------------
//address table

function checkName(str1,str2){
    var value = document.getElementById(str1).value;
	if(value.length<3||value.length>15){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function checkAdd(str1,str2){
    var value = document.getElementById(str1).value;
	if(value.length<6||value.length>30){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function checkState(str1,str2){
    var value = document.getElementById(str1).value;
	if(value.length<2||value.length>15){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function checkZip(str1,str2){
    var value = document.getElementById(str1).value;
	if(value.length!==5 || !isNumber(value)){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function checkPhone(str1,str2){
    var value = document.getElementById(str1).value;
	if(value.length!==10 || !isNumber(value)){
		document.getElementById(str2).style.display = "block";
		return false;
	}
	else
		document.getElementById(str2).style.display = "none";
	return true;
}

function isNumber(s){
	var patrn=/[0-9]*/;
	if (!patrn.exec(s)) 
		return false;
	return true;
}


function checkAll3(){
    if(checkName('aname','divright1')&&checkAdd('street','divright2')
        &&checkName('city','divright3')&&checkState('state','divright4')
        &&checkZip('zip','divright5')&&checkPhone('phone','divright6')){
        return true;	        	
    }else{
	return false;
    }
}

function checkShipping(){
    var value =document.getElementById("valid").checked;
    if(checkCard('cardNumber','divright11')&&checkSecurity('securityCode','divright1')
            &&checkMonth('month','divright13')&&checkYear('year','divright14')){    
        if(!value){
            return true;
        }else if(checkName('aname','divright1')&&checkAdd('street','divright2')
            &&checkName('city','divright3')&&checkState('state','divright4')
            &&checkZip('zip','divright5')&&checkPhone('phone','divright6')){
            return true;
        }else{   
            return false;
        }
    }else return false;
}

//------------
//check card
function checkCard(str1,str2){ 
    var value = document.getElementById(str1).value;        
    if(value.length<10 || value.length>16 ||!isNumber(value)){
       document.getElementById(str2).style.display = "block";
       return false;
    }else{
        document.getElementById(str2).style.display = "none";
        return true;
    }

}

function checkSecurity(str1,str2){ 
    var value = document.getElementById(str1).value;        
    if(value.length!==3 ||value.length!==4 ||!isNumber(value)){
       document.getElementById(str2).style.display = "block";
       return false;
    }else{
        document.getElementById(str2).style.display = "none";
        return true;
    }
}

function checkMonth(str1,str2){ 
    var value = document.getElementById(str1).value;        
    if(value.length<1 || value.length>2 ||!isNumber(value)){
       document.getElementById(str2).style.display = "block";
       return false;
    }else{
        document.getElementById(str2).style.display = "none";
        return true;
    }
}

function checkYear(str1,str2){ 
    var value = document.getElementById(str1).value;        
    if(value.length!==4 ||!isNumber(value)){
       document.getElementById(str2).style.display = "block";
       return false;
    }else{
        document.getElementById(str2).style.display = "none";
        return true;
    }
}

function checkCardInfo(){
    if(checkCard('cardNumber','divright11')&&checkSecurity('securityCode','divright1')&&checkMonth('month','divright13')&&checkYear('year','divright14'))
       return true;    
    else return false;
}
