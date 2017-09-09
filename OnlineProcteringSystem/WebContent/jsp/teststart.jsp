<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/chat.css">
<link rel="stylesheet" href="../css/test.css">
<script type="text/javascript" src="../js/chat.js"></script>
<title>Insert title here</title>
<style>
body {
	color: #9a9a9a;
	font: 100%/1.5em "Droid Sans", sans-serif;
	margin: 0;
}
#left_side_div{
    border: 2px solid #fff;
    float: right;
    width: 25%;  
}
#top{
	font-family: 'Titillium Web', sans-serif;
	background: rgba(19, 35, 47, 0.9);
	padding:20px;
	margin: 0px;
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
#accordion{
	border: 2px solid #D34646;
	position:absolute;
	height:560px;
	float:left;
	width:74.4%;
	overflow-y: scroll;
	color:#000;
}
.mybutton {
		    background-color: #D34646; /* Green */
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
<script type="text/javascript">
                       
            var webSocket;
            var messages = document.getElementById("messages");
           
            function createElements(username,message){
            	var par=document.getElementsByClassName('chat-history')[0];
            	var odiv=document.createElement('div');
            	odiv.setAttribute("class", "chat-message clearfix");
            	var idiv=document.createElement('div');
            	odiv.setAttribute("class", "chat-message-content clearfix");
            	var uname=document.createElement('h5');
            	var msg=document.createElement('p');    
            	uname.innerHTML=username;
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
                   writeResponse("WebSocket is already opened.");
                    return;
                }
                // Create a new instance of the websocket
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
           			mesg="${f_name}:"+mesg;
           			webSocket.send(mesg);
           		}
            }
            function writeResponse(text){
                messages.innerHTML += "<br/>" + text;
            }
            
</script>
</head>
<body onload="openSocket()">
	<div id="top">
		<span id="topname">${f_name} ${l_name}</span>
		<font id="topid" size="6">Reg. Id:${uid}</font>
	</div>
	<div id="left_side_div">
		<div class="chat">
			
			<div class="chat-history">
				<div class="chat-message clearfix">
					<div class="chat-message-content clearfix">
						<h5>ADMIN</h5>
						<p>write your queries here</p>
					</div> <!-- end chat-message-content -->
				</div> <!-- end chat-message -->
				<hr>
			</div> <!-- end chat-history -->
						
				<fieldset>
					
					<input type="text" id="textfield" placeholder="Type your message…">
					<input type="button" onclick="sendMessage()" style="width:100px" value="send">

				</fieldset>

		</div> <!-- end chat -->
	</div>
	
                  
                        <div style="background-color:#D34646;color:#fff;" class="panel-heading">
                            HTML RANDOM TEST
                        </div>
                     
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                
                                
                                <div class="panel panel-default" id="ques1">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 1 :</b> Which tag is used to insert images into your web page ? </a>
                                        </h4>
                                    
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio1" value="pic">(A) pic
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio1" value="img">(B) img
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio1" value="scr">(C) scr
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques2">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 2 :</b>Which of the following programs support XML or XML applications?: </a>
                                        </h4>
                                    
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio2" value="Internet Explorer 5.5">(A) Internet Explorer 5.5
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio2" value="Netscape 4.7">(B) Netscape 4.7
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio2" value="RealPlayer">(C) RealPlayer
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio2" value="both 1 and 2">(D) both 1 and 2
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                              
                                
                                <div class="panel panel-default" id="ques3">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 3 :</b>If the background image is smaller than the screen, what will happen ? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio3" value="It will be stretched">(A) It will be stretched
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio3" value="It will be repeated">(B) It will be repeated
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio3" value="It will leave a blank space at the bottom of your page">(C) It will leave a blank space at the bottom of your page
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                               
                                
                                <div class="panel panel-default" id="ques4">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 4 :</b> Is it easier to process XML than HTML?</a>
                                        </h4>
                                  
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio4" value="Yes">(A) Yes
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio4" value="No">(B) No
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio4" value="Somtimes">(C) Somtimes
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio4" value="Cant say">(D) Cant say
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                               
                                
                                <div class="panel panel-default" id="ques5">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 5 :</b>For Frames in HTML, how do you specify the rest of the screen? </a>
                                        </h4>
                                 
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio5" value="Using $">(A) Using $
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio5" value="Using *">(B) Using *
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio5" value="Using #">(C) Using #
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio5" value="Using &">(D) Using &
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            
                                
                                <div class="panel panel-default" id="ques6">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 6 :</b> What is the &lt;br&gt; tag for? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio6" value="Paragraph break">(A) Paragraph break
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio6" value="Space">(B) Space
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio6" value="Line break">(C) Line break
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio6" value="Word break">(D) Word break
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques7">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 7 :</b> What are meta tags used for? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio7" value="To store information usually relevant to browsers and search engines.">(A) To store information usually relevant to browsers and search engines.
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio7" value="To only store information about search engines">(B) To only store information about search engines
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio7" value="To store information about external links">(C) To store information about external links
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio7" value="To only store information usually relevant to browsers">(D) To only store information usually relevant to browsers
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="panel panel-default" id="ques8">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 8 :</b> bgcolor is an attribute of body tag </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio8" value="True">(A) True
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio8" value="False">(B) False
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                            
                                
                                <div class="panel panel-default" id="ques9">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 9 :</b> When images are used as links they get a blue border?. </a>
                                        </h4>
                                  
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio9" value="Never">(A) Never
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio9" value="Always">(B) Always
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio9" value="Unless border is set to zero">(C) Unless border is set to zero
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques10">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 10 :</b> How do you change the text color of an element? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio10" value="fgcolor:">(A) fgcolor:
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio10" value="color:">(B) color:
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio10" value="text-color:">(C) text-color:
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio10" value="text-color=">(D) text-color=
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques11">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 11 :</b> Is attribute minimization allowed in XHTML? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio11" value="Yes">(A) Yes
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio11" value="No">(B) No
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques12">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 12 :</b>How do you display hyperlinks without an underline? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio12" value="a {underline:none}">(A) a {underline:none}
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio12" value="a {text-decoration:no underline}">(B) a {text-decoration:no underline}
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio12" value="a {text-decoration:none}">(C) a {text-decoration:none}
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio12" value="a {decoration:no underline}">(D) a {decoration:no underline}
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques13">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 13 :</b> Which attribute replaces the name attribute for the following elements: a, applet, frame, iframe, img, and map? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio13" value="The src attribute">(A) The src attribute
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio13" value="The id attribute">(B) The id attribute
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio13" value="The class attribute">(C) The class attribute
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                               
                                
                                <div class="panel panel-default" id="ques14">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 14 :</b> What does HTML stand for? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio14" value="Hyperlinks and Text Markup Language">(A) Hyperlinks and Text Markup Language
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio14" value="Hyper Text Markup Language">(B) Hyper Text Markup Language
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio14" value="Home Tool Markup Language">(C) Home Tool Markup Language
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio14" value="Hyper Test Markup Language">(D) Hyper Test Markup Language
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques15">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 15 :</b> Screen colors are defined by which colors ? </a>
                                        </h4>
                                    
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio15" value="Green, Blue, and Yellow">(A) Green, Blue, and Yellow
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio15" value="Crayola Colors">(B) Crayola Colors
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio15" value="Red, Green and Blue">(C) Red, Green and Blue
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                            
                                
                                <div class="panel panel-default" id="ques16">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 16 :</b>A 6 digit Hex color (#FF9966) defines values of Red, Blue and Green in which order ? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio16" value="#BBRRGG">(A) #BBRRGG
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio16" value="#BBGGRR">(B) #BBGGRR
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio16" value="#RRGGBB">(C) #RRGGBB
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default" id="ques17">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 17 :</b>What is the REFRESH meta tag used for ? </a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio17" value="Refresh your keywords">(A) Refresh your keywords
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio17" value="Redirect to a new domain">(B) Redirect to a new domain
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio17" value="Allow search engines to relist your page">(C) Allow search engines to relist your page
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques18">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 18 :</b>Which tags are most commonly used by search engines?</a>
                                        </h4>
                                   
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio18" value="Paragrah">(A) Paragrah
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio18" value="Heading">(B) Heading
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio18" value="Title">(C) Title
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio18" value="All of above">(D) All of above
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="panel panel-default" id="ques19">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 19 :</b> Why do designers often use slight variations of black and white as background colors ? </a>
                                        </h4>
                              
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio19" value="To make the page more readable">(A) To make the page more readable
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio19" value="Black and white are ugly colors">(B) Black and white are ugly colors
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio19" value="Personal choice">(C) Personal choice
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                               
                                
                                <div class="panel panel-default" id="ques20">
                                     
                                        <h4 class="panel-title">
                                            <a><b>Ques 20 :</b>Can a data cell contain images?</a>
                                        </h4>
                                    
                                    <div class="panel-collapse online-test-options">
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio20" value="Yes">(A) Yes
                                                </div><!-- /input-group -->
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="input-group">
                                                    <input type="radio" name="radio20" value="No">(B) No
                                                </div><!-- /input-group -->
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <button type="submit" class="mybutton">Submit  Answer</button>
                            </div>	
</body>
</html>