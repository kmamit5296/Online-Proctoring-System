<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Live input record and playback</title>
	<style>
	table, td {
	    border: 1px solid black;
	}

	table {
	    border-collapse: collapse;
	    width: 100%;
	}
	</style>
</head>
<body>
<h1>Give Some Audio Sample</h1>
<table style="border: 1px solid black">
  <tr>
    <td>abcdedfghjk</td>
    <td><button type="button" onclick="startRecording(this)" >Record</button></td> 
    <td>status</td>
    <td>audio will appear here</td>
    <td><button type="button" onclick="saveRecording(this)" >Save</button></td>
  </tr>
</table>
<script type="text/javascript">
	var audio_context;
  	var recorder;
  	var Blob;
  	function startUserMedia(stream) {
	    var input = audio_context.createMediaStreamSource(stream);
	    recorder = new Recorder(input);
  	}
  	function startRecording(button) {
	    recorder && recorder.record();
	    button.disabled = true;
	    var tr=button.parentElement.parentElement;
	    alert(tr.childNodes[7].nodeName);
	    tr.childNodes[5].innerHTML="Recording...";
	    setTimeout(function(){
	    	recorder && recorder.stop();
	    	tr.childNodes[5].innerHTML.innerHTML="Recorded";
	    	createAudioElement(tr);
	     }, 2000);
  	}
  	function createAudioElement(tr){
  		recorder && recorder.exportWAV(function(blob) {
  		  Blob=blob;
	      var url = URL.createObjectURL(blob);
	      var au = document.createElement('audio');	     
	      au.controls = true;
	      au.src = url;
	      tr.childNodes[7].removeChild(tr.childNodes[7].childNodes[0]);
	      tr.childNodes[7].appendChild(au);
	    });
  	}
  	function saveRecording(){
  		alert(<%= getServletContext().getAttribute("userId")%>);
  		var http = new XMLHttpRequest();
		var url = "http://localhost:8080/OnlineProcteringSystem/addpa?"+
		<%= getServletContext().getAttribute("userId")%>;
		var fd=new FormData();
		fd.append('file',Blob);
		http.open("POST", url, true);
		http.onreadystatechange = function() {
		    if(http.readyState == 4) {
		        alert("done");
		    }
		}
		http.send(fd);
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
  };
</script>

<script src="../js/recorder.js"></script>
<% getServletContext().removeAttribute("userId");%>
</body>
</html>