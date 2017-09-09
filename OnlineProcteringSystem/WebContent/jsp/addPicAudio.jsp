<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="../js/webcam.min.js"></script>
	
	<title>Insert title here</title>
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
		margin: 0 0 30px;
		background: rgba(19, 35, 47, 0.9);
		}
		#camera{
		float:left;
		margin: 10px;
		width:45%;
		overflow:hidden;
		border-radius: 4px;
		box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
		}
		#side{
		float:left;
		width:45%;
		overflow:hidden;
		} 
		.floating{
		    display: inline-block;
		    width: 270px;
			height: 200px;
		   margin: 5px;  
		    box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
		}
		.mybutton {
		    background-color: #4CAF50; /* Green */
		    border: none;
		    color: white;
		    padding: 15px 32px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    margin: 4px 2px;
		    cursor: pointer;
		    font-size: 20px;
		    
		}
		.mybutton:hover{
			box-shadow: 0 0 10px 5px rgba(19, 35, 47, 0.3);
		}
	</style>
	<script language="JavaScript">
		var num_img=0;
		function createImageTag(data_uri){
			var div=document.createElement("div");
			div.setAttribute("class","floating");
			var img=document.createElement("img");
			img.setAttribute("style","width:270px;height:200px");				
			img.setAttribute("src",data_uri);
			div.appendChild(img);
			return div;
		}
		function take_snapshot() {
			if(num_img<4){
				Webcam.snap( function(data_uri) {
					var ele=createImageTag(data_uri);
					document.getElementById('results').appendChild(ele);  
					var store_url= 'http://localhost:8080/OnlineProcteringSystem/addpa?'+
					<%= getServletContext().getAttribute("userId")%>;
					Webcam.upload( data_uri,store_url, function(code, text) {
							document.getElementById("response").innerHTML="Image "+(num_img)+" added";
							if(num_img==4){
								alert("Registration Done");
								document.getElementById('regdone').innerHTML="REGISTRATION SUCESSFULLY DONE <br> Registration Id:"+
								<%= getServletContext().getAttribute("userId")%>;		 	
							}
					});
				});	
				num_img=num_img+1;
				
			}
			else{
				alert("4 photos taken");
			}			
		}
	</script>
</head>
<body>
	
		<h1>Add Picture And Audio</h1>
	
			<div id="camera"></div>
		
			<div id="side">
				<b>Please Be in front of camera and click 4 pictures</b><br>
				<button class="mybutton" onclick="take_snapshot()">Click Photo</button>
				<b id="response"></b>
				<div id="results">
				</div>
			</div>
		<p id="regdone"></p>	
	<!-- <a href="./addAudio.jsp"><button id="audiobutton">Record Audio</button></a>-->
	<script language="JavaScript">
			Webcam.set({
				width: 630,
				height: 400,
				dest_width: 640,
				dest_height: 480,
				image_format: 'jpeg',
				jpeg_quality: 60
			});
			Webcam.attach( '#camera' );
	</script>
	<%getServletContext().removeAttribute("userId"); %>
</body>
</html>