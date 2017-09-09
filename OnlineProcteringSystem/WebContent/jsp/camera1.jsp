<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/webcam.min.js"></script>
<title>Insert title here</title>
</head>
<body>
Do Not close this window otherwise the test will not be graded. This is used for proctoring.
<img alt="" id="image1" src="">
<div style="display:none" id="my_camera"></div>
<script language="JavaScript">
		Webcam.set({
			width: 640,
			height: 480,
			dest_width: 640,
			dest_height: 480,
			image_format: 'jpeg',
			jpeg_quality: 60
		});
		Webcam.attach( '#my_camera' );
</script>
<script>
//var resp;
function check_resp(resp){
	var nose_left_dist = (resp[0].faceLandmarks.noseTip.x-resp[0].faceRectangle.left);

	var nose_right_dist = ((resp[0].faceRectangle.left+resp[0].faceRectangle.width)-resp[0].faceLandmarks.noseTip.x);

	var pupil_left_out = resp[0].faceLandmarks.pupilLeft.x-resp[0].faceLandmarks.eyeLeftOuter.x;

	var pupil_left_in = resp[0].faceLandmarks.eyeLeftInner.x-resp[0].faceLandmarks.pupilLeft.x;

	var pupil_right_out = resp[0].faceLandmarks.eyeRightOuter.x-resp[0].faceLandmarks.pupilRight.x;

	var pupil_right_in = resp[0].faceLandmarks.pupilRight.x-resp[0].faceLandmarks.eyeRightInner.x;
	if((nose_left_dist<57)||(resp[0].faceAttributes.headPose.yaw<-18)){
	 return "CAMERA1FAIL";
	}
	else if((nose_right_dist<58)||(resp[0].faceAttributes.headPose.yaw>20)){
		return "CAMERA1FAIL";
	}
	else if(((pupil_left_out>13)&&(pupil_right_in>13))||((pupil_left_in>13)&&(pupil_right_out>13))){
		return "CAMERA1FAIL";
	}
	else{
		return "CAMERA1PASS";
	}

}		
makeblob = function (dataURL) {
	    var BASE64_MARKER = ';base64,';
	    if (dataURL.indexOf(BASE64_MARKER) == -1) {
		var parts = dataURL.split(',');
		var contentType = parts[0].split(':')[1];
		var raw = decodeURIComponent(parts[1]);
		return new Blob([raw], { type: contentType });
	    }
	    var parts = dataURL.split(BASE64_MARKER);
	    var contentType = parts[0].split(':')[1];
	    var raw = window.atob(parts[1]);
	    var rawLength = raw.length;

	    var uInt8Array = new Uint8Array(rawLength);

	    for (var i = 0; i < rawLength; ++i) {
		uInt8Array[i] = raw.charCodeAt(i);
	    }

	    return new Blob([uInt8Array], { type: contentType });
}
function take_snapshot() {			
	Webcam.snap( function(data_uri) {
		document.getElementById("image1").src=data_uri;
		var xhr = new XMLHttpRequest(); 
		var params = "returnFaceLandmarks=true&returnFaceAttributes=headPose";
		xhr.open("POST", "https://southeastasia.api.cognitive.microsoft.com/face/v1.0/detect?"+params);
		xhr.setRequestHeader("Content-Type", "application/octet-stream");
		xhr.setRequestHeader("Ocp-Apim-Subscription-Key", "f25f4c9ff39249589c56ac415fc8ce0a");
		xhr.onreadystatechange = function() {
	    	if (this.readyState == 4 && this.status == 200) {
				resp=JSON.parse(xhr.responseText);			
				//document.getElementById('result').innerHTML=check_resp(resp);
				var xhttp = new XMLHttpRequest();
            	xhttp.open("POST", "http://10.42.0.247:8000");         		
            	//xhttp.setRequestHeader("User-Agent", check_resp(resp));
            	xhttp.send(check_resp(resp));
	       			//document.getElementById('data').innerHTML=resp[0].faceRectangle.left;
	    	}
		};
		xhr.send(makeblob(data_uri));
		//var store_url= 'http://localhost:8080/OnlineProcteringSystem/getc1?157&camera1';
		var store_url= 'http://localhost:8080/OnlineProcteringSystem/getc1?'+<%=request.getSession().getAttribute("uid")%>+'&camera1';
		Webcam.upload( data_uri,store_url, function(code, text) {
		});
		
	} );
}
Webcam.on( 'live', function() {
	setInterval(function() {
		take_snapshot();
	}, 6000)	
}); 

</script>
</body>
</html>