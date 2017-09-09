<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="C" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="adduser.User" %>
<%@page import="utils.AllCollection" %>
<%@page import="database.DbConnect" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/chat.css">

<script type="text/javascript" src="../../js/chat.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<style>
body{
			margin:0px;
			background: #e6e6fa;
			font-family: 'Titillium Web', sans-serif;
}
h1{
		padding:10px;
		font-size:40px;
		text-align: center;
		color: #ffffff;
		font-weight: 300;
		margin: 0px;
		background: rgba(19, 35, 47, 0.9);
}
div.user_pic {
    margin:20px;
    margin-left:120px;
    border: 2px solid #13232F;
    float: left;
}
.frontal {
 float: left;
	/*border: 2px solid #0f0;*/
}
.top_c{
	 float: left;
	/*border: 2px solid #00f;*/
}
div.name {
    padding: 15px;
    text-align: center;
}
#procter{
	float: left;
	/*border: 2px solid #ff0;*/
	width:51%;
}
#left_side_div{
    /*border: 2px solid #ff0;*/
    float: left;
    width: 25%;
    color: #9a9a9a;
    font: 100%/1.5em "Droid Sans", sans-serif;
    
}
#candidates_list{
	height:auto;
	/*border: 2px solid #ff0;*/
    float: left;
    width: 24%;
}
#userl {
  list-style-type: none;
  padding: 0;
  margin: 0;
}
#userl li a {
  border: 1px solid #ddd;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  color: black;
  display: block;
}
#userl li {
  background-color: #CCCCCC;
  cursor: default;
}
.header{
	font-size: 18px;
	 padding: 12px;
	
}
#userl li a:hover:not(.header){
  background-color: #eee;
}

#userdetail {
    width: 85%;
    height: 600px;
    border: 2px solid #13232F;
    background-color: #e6e6fa;
    color: #fff;
    text-align: center;
    border-radius: 10px;
    position: absolute;
    z-index: 1;
  	visibility:hidden;
  	top:2%;
  	left:7%;
}
#user_img{
	float: left;
	border: 2px solid #13232F;
	margin:40px;
	width:40.6%;
	height:50%;
	margin-left:60px;
}
#user_img1{
	float: left;
	border: 2px solid #13232F;
	margin:40px;
	width:40.6%;
	height:50%;
}
#elogs{
	float: left;
	border: 2px solid #13232F;
	margin-left:60px;
	width:41%;
	height:30%;
	color:black;
	overflow-y:scroll;
}
#ubuttons{
	float: left;
	border: 2px solid #13232F;
	margin-left:74px;
	width:40%;
	height:30%;
	color:black;
}
.btn-front {
		    background-color: #4CAF50; /* Green */
		    border: none;
		    color: white;
		    padding: 5px 5px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    margin: 5px;
		    cursor: pointer;
		    font-size: 20px;
		    width:50%;
}
#cross{
	position: absolute;
    top:2%;
    left:95%;
	height:30px;
	border-radius: 10px;
    background-color: #555555; /* Green */
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.mybutton {
		    background-color: #13232F; /* Green */
		    border: none;
		    color: white;
		    width:100%;
		    padding: 15px 32px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    margin: 8px 0px;
		    cursor: pointer;
		    font-size: 20px;
		    
		}
.mybutton:hover{
			box-shadow: 0 0 10px 5px rgba(19, 35, 47, 0.3);
		}
</style>
<script type="text/javascript">
	var imgtimeout=6000;
	function setImage(con){
		var i=0;
		var img1s=document.getElementsByClassName("imgc1");
		var img2s=document.getElementsByClassName("imgc2");
		setInterval(function(){ 
		<C:forEach var="user" items="${uList}">
			img1s[${uList.indexOf(user)}].src="http://localhost:8080/OnlineProcteringSystem/images?${user.id}&camera1&"+new Date().getTime();
			img2s[${uList.indexOf(user)}].src="http://localhost:8080/OnlineProcteringSystem/image2?${user.id}&camera2&"+new Date().getTime();
			
		</C:forEach>
			
		}, imgtimeout);
	
	}
</script>
<script type="text/javascript">
                       
           var webSocket;
           function writeResponse(text){
               messages.innerHTML += "<br/>" + text;
           }
           function createElements(username,message){
           	var par=document.getElementsByClassName('chat-history')[0];
           	var odiv=document.createElement('div');
           	odiv.setAttribute("class", "chat-message clearfix");
           	var idiv=document.createElement('div');
           	odiv.setAttribute("class", "chat-message-content clearfix");
           	var uname=document.createElement('h5');
           	uname.innerHTML=username;
           	var msg=document.createElement('p');
           	msg.innerHTML=message;
           	idiv.appendChild(uname);
           	idiv.appendChild(msg);
           	odiv.appendChild(idiv);
           	par.appendChild(odiv);
           	par.appendChild(document.createElement("hr"));
           }
           function writeMessage(data){
           	createElements(data.split(':')[0],data.split(':')[1]);
           }
            function openSocket(){
                // Ensures only one connection is open at a time
                if(webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED){
                   alert("WebSocket is already opened.");
                    return;
                }
                // Create a new instance of the websocket
                if(webSocket==null)
                	webSocket = new WebSocket("ws://localhost:8080/OnlineProcteringSystem/echo?123");                
      
                webSocket.onopen = function(event){
                    // For reasons I can't determine, onopen gets called twice
                    // and the first time event.data is undefined.
                    // Leave a comment if you know the answer.
                    if(event.data === undefined)
                        return;
 
                    alert(event.data);
                };
 
                webSocket.onmessage = function(event){
                	writeMessage(event.data);
                };
 
                webSocket.onclose = function(event){
                    alert("Connection closed");
                };
            }
           
            /**
             * Sends the value of the text input to the server
             */           
            function closeSocket(){
                webSocket.close();
            }
            function sendMessage(){
           		var inp=document.getElementById('textfield');           		
           		var mesg=inp.value;
           		inp.value="";
           		if(mesg!=""){
           			mesg="ADMIN:"+mesg;
           			webSocket.send(mesg);
           		}
            }
            function regMessage(){
            	
            	alert("Please send a messsage with content 'REGISTER ME' without quotes to register to chatserver");
            	openSocket();
            	setImage();
            }
            
</script>

</head>
<body onload="regMessage()">
	<h1>PROCTORING</h1>
	<div id="candidates_list">
			<ul id="userl">
			<li class="header">All User</li>
			<C:forEach var="user" items="${uList}">
				<li><a href="./studentrecord.jsp?${user.id}">${user.fname}  ${user.lname} </a></li>
			</C:forEach>
			</ul>
			<a href="./adminpanel.jsp"><button class="mybutton">Go To Panel</button></a>
	</div>
	<div id="procter">
	
		<C:forEach var="user" items="${uList}">
			<div class="user_pic" onclick="popShow('${user.fname}','${user.lname}','${ user.id}','${user.email}' )">		
				<div class="frontal">
					<img src="../../img/face.png" class="imgc1"   style="width:200px;height:200px" >
				</div>
				<div class="top_c">
					<img  style="width:200px;height:200px" class="imgc2" src="../../img/face.png">
				</div>
				<div class="name">${user.fname} ${user.lname} </div>
			</div>
		</C:forEach>
		
		  
	  <!--  	<div class="user_pic" onclick="popShow('abc','qwerty','128','asdf@df')">
			<div class="frontal">
				<img src="" onerror="setImage()" class="imgc1" style="width:200px;height:200px"  >
			</div>
			<div class="top_c">
				<img  style="width:200px;height:200px" class="imgc2" src="../../img/face.png">
			</div>
			<div class="name">Name come here</div>
		</div>
	 	<div class="user_pic">
			<div class="frontal">
				<img src="" style="width:200px;height:200px" >
			</div>
			<div class="top_c">
				<img  style="width:200px;height:200px"  src="">
			</div>
			<div class="name">Name come here</div>
		</div>-->
	</div>
	<div id="left_side_div">
		
		
		<div class="chat">
			
			<div class="chat-history">
				<div class="chat-message clearfix">
					<div class="chat-message-content clearfix">
						<h5>ADMIN</h5>
						<p>write message here</p>
					</div> <!-- end chat-message-content -->
				</div> <!-- end chat-message -->
				<hr>
				<!--  <div class="chat-message clearfix">						
					<div class="chat-message-content clearfix">									
						<h5>Marco Biedermann</h5>
						<p>message 2</p>
					</div> <!-- end chat-message-content 
				</div> <!-- end chat-message 
				<hr>-->
			</div> <!-- end chat-history -->
						
				<fieldset>
					
					<input type="text" id="textfield" placeholder="Type your message…">
					<input type="button" onclick="sendMessage()" style="width:100px" value="send">

				</fieldset>

		</div> <!-- end chat -->
		
		</div>
		<div class="popup" id="userdetail">
			<button id="cross" onclick="popupClose()">x</button>
			<div id="user_img">
					<img src="../../img/face.png" id="pop_img"  style="width:450px;height:300px" >
			</div>
			<div id="user_img1">
					<img src="../../img/face.png" id="pop_img1"  style="width:450px;height:300px" >
			</div>
			<div id="elogs">
			</div>
			<div id="ubuttons">
				<div class="btn">
					<!--  <div class="btn-back">
					    <p>Are you sure you want to do that?</p>
					    <button class="yes">Yes</button>
					    <button class="no">No</button>
					  </div>-->
					  <button onclick="delTest()" class="btn-front">CANCEL TEST</button>
					  <!--  <button class="btn-front">SEND MESSAGE</button>-->
				</div>
			</div>
		</div>
		<script>
		var userid;
		function getLogs(id){
        	var plog=document.getElementById("elogs");
        	imgtimeout=60000000;
        	var img_pop=document.getElementById('pop_img');
        	var img_pop1=document.getElementById('pop_img1');
        	//plog=plog.childNodes[0];
        	//plog.value="";
        	var res,res1="";
        	var xhttp=new XMLHttpRequest();
        	var url="http://localhost:8080/OnlineProcteringSystem/GetLatestLogs?"+id;
        	setInterval(function(){
        		img_pop.src="http://localhost:8080/OnlineProcteringSystem/images?"+id+"&camera1&"+new Date().getTime();
    	    	img_pop1.src="http://localhost:8080/OnlineProcteringSystem/image2?"+id+"&camera2&"+new Date().getTime();
	        	xhttp.onreadystatechange = function() {
	        	    if (this.readyState == 4 && this.status == 200) {
	        	    	res=xhttp.responseText;
	        	    	if(res!=res1){
		        	    	var code=res.split('#')[0];
		        	    	var write="Working Fine";
		        	    	if(code!='1'){
		        	    		code=code.split(':')[1];
		        	    		if(code=="S")
		        	    			write="Speaking";
		        	    		else if (code =="A")
		        	    			write="Looking Aside";
		        	    		else write="Opening phone or Book";
		        	    	}	
		        	    		var p4=document.createElement('p');
		                    	p4.innerHTML=res.split('#')[1]+":"+write;
		            	    	plog.appendChild(p4);
		            	    	plog.scrollTop = plog.scrollHeight;		
		            	    	//plog.value+=res.split('#')[1]+":"+write;
		            	    	//plog.value+="\n";
	        	    	}	
	        	    	res1=res;
	        	    	img_pop.src="http://localhost:8080/OnlineProcteringSystem/images?"+id+"&camera1&"+new Date().getTime();
	        	    	img_pop1.src="http://localhost:8080/OnlineProcteringSystem/image2?"+id+"&camera2&"+new Date().getTime();		        	    		        	    
	        	    }
	        	};
	        	xhttp.open("GET",url,true);
	        	xhttp.send();
        	}, 6000);
        }
        function popShow(fn,ln,id,mail){
        	userid=id;
        	var x=document.getElementById("userdetail");
        	x.style.visibility="visible";
        	var info=document.getElementById("ubuttons");
        	//alert(info.childNodes.length);
        	while (info.childNodes.length > 3) {
        	    info.removeChild(info.lastChild);
        	}
        	var p3=document.createElement('p');
        	p3.innerHTML='User Id : '+id;
        	info.appendChild(p3);
        	var p1=document.createElement('p');
        	p1.innerHTML='FIRST NAME : '+fn;
        	info.appendChild(p1);
        	var p2=document.createElement('p');
        	p2.innerHTML='LAST NAME : '+ln;
        	info.appendChild(p2);            
        	var p4=document.createElement('p');
        	p4.innerHTML='EMAIL : '+mail;
        	info.appendChild(p4);
        	getLogs(id);        	        	
        }
        function delTest(){
        	var xhhr=new XMLHttpRequest();
        	xhhr.open("GET","http://localhost:8080/OnlineProcteringSystem/DeleteStudentTest?"+userid,true);
        	xhhr.onreadystatechange = function() {
        	    if (this.readyState == 4 && this.status == 200) {
        	    	alert("Student Test Deleted");
        	    }
        	}    
        	xhhr.send();
        }
        function popupClose(){
        	var x=document.getElementById("userdetail");
        	x.style.visibility="hidden";
        	imgtimeout=6000;
        }
		</script>
</body>
</html>