<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register/Login</title>
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
      <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%if(getServletContext().getAttribute("registrationError")==null)
			getServletContext().setAttribute("registrationError","");	
	if(getServletContext().getAttribute("LoginError")==null)
		getServletContext().setAttribute("LoginError","");
	if(getServletContext().getAttribute("signup_tab")==null)
		getServletContext().setAttribute("signup_tab","tab active");
	if(getServletContext().getAttribute("login_tab")==null)
		getServletContext().setAttribute("login_tab","tab");
	if(getServletContext().getAttribute("login_style")==null)
		getServletContext().setAttribute("login_style","display:none");	
	if(getServletContext().getAttribute("signup_style")==null)
		getServletContext().setAttribute("signup_style","display:inline");	
	%>
  <div class="form">
      
      <ul class="tab-group">
        <li class="<%=getServletContext().getAttribute("signup_tab")%>"><a href="#signup">Sign Up</a></li>
        <li class="<%=getServletContext().getAttribute("login_tab")%>"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup" style="<%=getServletContext().getAttribute("signup_style")%>">   
          <h1>Sign Up for Free</h1>
          
          <form action="http://localhost:8080/OnlineProcteringSystem/Registration" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" required name="fname" autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="lname"  autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password" name="password" autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block">Get Started</button>
          <h2><%=getServletContext().getAttribute("registrationError")%></h2>
          </form>

        </div>
        
        <div id="login" style="<%=getServletContext().getAttribute("login_style")%>">   
          <h1>Welcome Back!</h1>
          
          <form action="http://localhost:8080/OnlineProcteringSystem/login" method="post">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="emaill" autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="passwordd" autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block">Log In</button>
          <h2><%=getServletContext().getAttribute("LoginError")%></h2>
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
<%getServletContext().removeAttribute("registrationError");
	getServletContext().removeAttribute("LoginError");
	getServletContext().removeAttribute("signup_tab");
	getServletContext().removeAttribute("login_tab");
	getServletContext().removeAttribute("signup_style");
	getServletContext().removeAttribute("login_style");
%>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>
</body>
</html>