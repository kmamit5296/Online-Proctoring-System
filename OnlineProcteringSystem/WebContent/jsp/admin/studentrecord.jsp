<%@page import="java.util.ArrayList"%>
<%@page import="utils.AllCollection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="C" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="adduser.User" %>
<%@page import="utils.AllCollection" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
			margin:0px;
			background: #e6e6fa;
			font-family: 'Titillium Web', sans-serif;
}
#top{
	padding:10px;
	color: #ffffff;
	background: rgba(19, 35, 47, 0.9);
}
#topname{
	font-size:40px;
	padding:10px;
}
#panel{
	float:right;
	font-size:30px;
	padding:8px;
	margin:-2px 5px;
	border:2px solid #fff; 
}
#topid{
	font-size:30px;
	float:right;
	padding:7px;
}
.camera{
	height:auto;
	border: 2px solid #13232F;
    float: left;
    width: 32%;
    background-color: #f6f6f6;
    margin:6px;
}
.showimg{
	margin:4px;
	background-color: #f0f0f0;
}
#elogs{	
	color:black;
	text-align:center;
	font-size: 20px;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

</style>
<body><%
		int userid=new Integer(request.getQueryString());
		AllCollection.bindUser(session,userid, (ArrayList<User>)getServletContext().getAttribute("uList"));		
	%>
	<script>		
		var xhr1=new XMLHttpRequest();
		xhr1.open("GET","http://localhost:8080/OnlineProcteringSystem/GetIdList?${userdetail.id}&camera1");
		xhr1.onreadystatechange = function() {
			if (this.readyState == 4){
	    		var data=(xhr1.responseText).split('#');	
	    		data.splice(-1,1);
	    		setCamera1(data);
			}
	    }
		xhr1.send();
		var xhr2=new XMLHttpRequest();
		xhr2.open("GET","http://localhost:8080/OnlineProcteringSystem/GetIdList?${userdetail.id}&camera2");
		xhr2.onreadystatechange = function() {
			if (this.readyState == 4){
	    		var data=(xhr2.responseText).split('#');	
	    		data.splice(-1,1);
	    		setCamera2(data);
			}
	    }
		xhr2.send();
		function setCamera1(data){
			data.forEach(function(d){
				var idt=d.split('@');				
				idt[1]=idt[1].split(" ")[1];				
				var out=document.getElementById("camera_1");
				var div=document.createElement("div");
				div.setAttribute("class","showimg");
				var font=document.createElement("font");
				var img=document.createElement("img");
				font.size="5";
				font.setAttribute("style","line-height: 150px;");
				font.setAttribute("class","time");
				font.innerHTML=idt[1];
				img.setAttribute("style","width:250px;height:150px;float:right;");
				img.src="http://localhost:8080/OnlineProcteringSystem/GetAllCamImage?"+idt[0]+"&camera1";
				div.appendChild(font);
				div.appendChild(img)
				out.appendChild(div);
			});
		}
		function setCamera2(data){
			data.forEach(function(d){
				var idt=d.split('@');				
				idt[1]=idt[1].split(" ")[1];				
				var out=document.getElementById("camera_2");
				var div=document.createElement("div");
				div.setAttribute("class","showimg");
				var font=document.createElement("font");
				var img=document.createElement("img");
				font.size="5";
				font.setAttribute("style","line-height: 150px;");
				font.setAttribute("class","time");
				font.innerHTML=idt[1];
				img.setAttribute("style","width:250px;height:150px;float:right;");
				img.src="http://localhost:8080/OnlineProcteringSystem/GetAllCamImage?"+idt[0]+"&camera2";
				div.appendChild(font);
				div.appendChild(img)
				out.appendChild(div);
			});
		}
		var xhttp=new XMLHttpRequest();
		xhttp.open("GET","http://localhost:8080/OnlineProcteringSystem/GetAllLogs?${userdetail.id}",true);
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4){
				var data=(xhttp.responseText).split('#');	
	    		data.splice(-1,1);
	    		setLog(data);
			}
	    }
		xhttp.send();
		function setLog(data){		
			var plog=document.getElementsByTagName("table")[0];
			data.forEach(function(d){
				var idm=d.split('@');
				idm[1]=idm[1].split(" ")[1];
				var tr=document.createElement("tr");
				var td1=document.createElement("td");
				var td2=document.createElement("td");
				td1.innerHTML=idm[1];
				var code=idm[0];
    	    	var write="Working Fine";
    	    	if(code!='1'){
    	    		code=code.split(':')[1];
    	    		if(code=="S")
    	    			write="Speaking";
    	    		else if (code =="A")
    	    			write="Looking Aside";
    	    		else write="Opening phone or Book";
    	    	}	
    	    	td2.innerHTML=write;
				tr.appendChild(td1);
				tr.appendChild(td2);
				plog.appendChild(tr);				
			});
	
		}
	</script>
	<div id="top">
		<span id="topname">${userdetail.fname} ${userdetail.lname}</span>
		<font id="topid" size="6">Reg. Id:${userdetail.id}</font>
		<a style="color:white;" href="./adminpanel.jsp"><span id="panel">Panel</span></a>
	</div>
	<div id="camera_1" class="camera">
		<h2>Camera 1 :</h2>
		
	<!--  	<div  class="showimg">
			<font size="5" style="line-height: 150px;" class="time">11:12:12</font>
			<img alt="c1 image" style="width:250px;height:150px;float:right;" src="">
		</div>
		<div class="showimg">
			<font size="5" style="line-height: 150px;" class="time">11:12:12</font>
			<img alt="c1 image" style="width:250px;height:150px;float:right;" src="">
		</div> -->
	</div>
	<div id="camera_2" class="camera">
		<h2>Camera 2 :</h2>
		<!--  <div class="showimg">
			<font size="6" style="line-height: 150px;" class="time">11:12:12</font>
			<img alt="c1 image" style="width:250px;height:150px;float:right;" src="">
		</div>
		<div class="showimg">
			<font size="6" style="line-height: 150px;" class="time">11:12:12</font>
			<img alt="c1 image" style="width:250px;height:150px;float:right;" src="">
		</div>-->
		
	</div>
	<div class="camera">
		<h2>Logs :</h2>
		<div id="elogs">
		<table>
		<!--  <tr><td>11:11:12 </td><td> Speaking</td></tr>
		<tr><td>11:11:12 </td><td> Looking Aside</td></tr>-->
		</table>
		</div>
		
	</div>
</body>
</html>