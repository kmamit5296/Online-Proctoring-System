<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Pic Voice</title>
</head>
<style>
body{
	font-family: 'Titillium Web', sans-serif;
	margin:0px;
	background: #e6e6fa;
}
.cameras {
    float: left;
    width:100%;
}
#top{
	background: rgba(19, 35, 47, 0.9);
	padding:10px;
	margin: 0 0 20px;
	color: #ffffff;
	
}
#topname{
	font-size:40px;
	padding:10px;
}
#topid{
	font-size:30px;
	float:right;
	padding:7px;
}
.frontal{
 	float: left;
 	margin:20px;
 	margin-left:80px;
 	margin-right:40px;
	box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
}
.top_c{
	 float: right;
	 margin:20px;
	 margin-left:40px;
 	margin-right:80px;
	box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
}
div.name {
    padding: 15px;
    text-align: center;
}
table{
	 width: 100%;
	 border-collapse: collapse;
}
table, td, th {
    border: 1px solid black;
    padding:5px;
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
.sbutton {
    background-color: #4CAF50;
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    padding:3px 15px;
}	
.sbutton:hover{
	box-shadow: 0 0 5px 5px rgba(19, 35, 47, 0.3);
}			
</style>
<body>
	<div id="top">
		<span id="topname">${f_name} ${l_name}</span>
		<font id="topid" size="6">Reg. Id:${uid}</font>
	</div>
	<h1>Camera Check:</h1>
	<div class="cameras">
		<div class="frontal">
			<img src="../img/face2.jpg" id="img_cam1" style="width:450px;height:300px" >
			<div class="name"><a href="./camera1.jsp" target="_blank"><button class="sbutton" onclick="setImage()">start camera </button></a>
				<%=request.getSession().getAttribute("f_name")%> <%=request.getSession().getAttribute("l_name")%>
			</div>
		</div>
		<div class="top_c">
			<img  style="width:450px;height:300px" id="img_cam2"  src="../img/face2.jpg">
			<div class="name">
				<%=request.getSession().getAttribute("f_name")%> <%=request.getSession().getAttribute("l_name")%>			
			</div>
		</div>
	</div>
	<h1 style="width:100%;">Give Some Audio Sample:</h1>
	
<table>

  <tr>
    <td style="width: 40%;">Add the sum to the product of these three.</td>
    <td style="width: 10%;"><button type="button" class="sbutton" onclick="startRecording(this)" >Record</button></td> 
    <td style="width: 15%;">status</td>
    <td style="width: 25%;">audio will appear here</td>
    <td style="width: 10%;">link come here</td>
  </tr>
   <tr>
    <td style="width: 40%;">Thieves who rob friends deserve jail.</td>
    <td style="width: 10%;"><button type="button" class="sbutton" onclick="startRecording(this)" >Record</button></td> 
    <td style="width: 15%;">status</td>
    <td style="width: 25%;">audio will appear here</td>
    <td style="width: 10%;">link come here</td>
  </tr>
    <tr>
    <td style="width: 40%;">Oak is strong and also gives shade.</td>
    <td style="width: 10%;"><button type="button" class="sbutton" onclick="startRecording(this)" >Record</button></td> 
    <td style="width: 15%;">status</td>
    <td style="width: 25%;">audio will appear here</td>
    <td style="width: 10%;">link come here</td>
  </tr>
  <tr>
    <td style="width: 40%;">The pipe began to rust while new.</td>
    <td style="width: 10%;"><button type="button" class="sbutton" onclick="startRecording(this)" >Record</button></td> 
    <td style="width: 15%;">status</td>
    <td style="width: 25%;">audio will appear here</td>
    <td style="width: 10%;">link come here</td>
  </tr>
</table>
<a href="./teststart.jsp"><button class="mybutton" onclick="">Start Test</button></a>
<script type="text/javascript">
	var audio_context;
  	var recorder;
  	var Blob,url;
  	var webSocket;
	function setImage(){
		var img1=document.getElementById('img_cam1');
		var img2=document.getElementById('img_cam2');
		setInterval(function(){
			img1.src="";
			img2.src="";
			img1.src="http://localhost:8080/OnlineProcteringSystem/images?"+
			<%=request.getSession().getAttribute("uid")%>+"&camera1&"+new Date().getTime();
			img2.src="http://localhost:8080/OnlineProcteringSystem/image2?"+
			<%=request.getSession().getAttribute("uid")%>+"&camera2&"+new Date().getTime();
		
		}, 6000);
	}
  	function openSocket(){
        if(webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED){
           alert("WebSocket is already opened.");
            return;
        }
        var link="ws://localhost:8080/OnlineProcteringSystem/echo?"+<%=request.getSession().getAttribute("uid")%>
        webSocket = new WebSocket(link);
         
        webSocket.onopen = function(event){
            // For reasons I can't determine, onopen gets called twice
            // and the first time event.data is undefined.
            // Leave a comment if you know the answer.
            if(event.data === undefined)
                return;

            
        };

        webSocket.onmessage = function(event){
            alert(event.data);
        };

        webSocket.onclose = function(event){
            writeResponse("Connection closed");
        };
    }
  	function startUserMedia(stream) {
	    var input = audio_context.createMediaStreamSource(stream);
	    recorder = new Recorder(input);
  	}
  	function startRecording(button) {
	    recorder && recorder.record();
	    button.disabled = true;
	    var tr=button.parentElement.parentElement;
	    tr.childNodes[5].innerHTML="Recording...";
	    setTimeout(function(){
	    	recorder && recorder.stop();
	    	createAudioElement(tr);
	    	tr.childNodes[5].innerHTML="Recorded";
	    	button.disabled = false;
	     }, 3000);
  	}
  	function createAudioElement(tr){
  		recorder && recorder.exportWAV(function(blob) {
  		  Blob=blob;
	      url = URL.createObjectURL(blob);
	      var au = document.createElement('audio');	     
	      au.controls = true;
	      au.src = url;
	  	  var hf = document.createElement("a");
	        hf.href = url;
	        hf.download = 'user_voice'+tr.rowIndex+'.wav';
	        hf.innerHTML = hf.download;  
	      tr.childNodes[7].removeChild(tr.childNodes[7].childNodes[0]);
	      tr.childNodes[7].appendChild(au);
	      tr.childNodes[9].removeChild(tr.childNodes[9].childNodes[0]);
	      tr.childNodes[9].appendChild(hf);
	      recorder.clear();
	    });
  	}
  	function saveRecording(button){

		
  		/*
  		var http = new XMLHttpRequest();
		var url = "http://localhost:8080/OnlineProcteringSystem/addpa?"+
		
		var fd=new FormData();
		fd.append('file',Blob);
		http.open("POST", url, true);
		http.onreadystatechange = function() {
		    if(http.readyState == 4) {
		        alert("done");
		    }
		}
		http.send(fd);*/
  	}
	window.onload = function init() {
	    try {
	      // webkit shim
	      window.AudioContext = window.AudioContext || window.webkitAudioContext;
	      navigator.getUserMedia = (navigator.getUserMedia || 
                          navigator.webkitGetUserMedia || 
                          navigator.mozGetUserMedia || 
                          navigator.msGetUserMedia);
	      window.URL = window.URL || window.webkitURL;
	      
	      audio_context = new AudioContext;
	    } catch (e) {
	      alert('No web audio support in this browser!');
	    }
	    
	    navigator.getUserMedia({audio: true}, startUserMedia, function(e) {
	      	alert('No live audio input: ' + e);
	    });
	    //openSocket();
  };
</script>
<script src="../js/recorder.js"></script>	
</body>
</html>