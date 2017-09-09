<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
<style>
body{
	background: #90EE90;
}
.adminRegister {
  width: 360px;
  margin: auto;
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.button{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
h1{
	font-family: 'Titillium Web', sans-serif;
	background: rgba(19, 35, 47, 0.9);
	padding:10px;
	margin: 20 0px;
	color: #ffffff;
}
</style>
</head>
<body>
	<%if(getServletContext().getAttribute("adminLoginError")==null)
			getServletContext().setAttribute("adminLoginError","");
	%>
	<div class="adminRegister">
	<h1>Admin Login</h1>
	<form action="http://localhost:8080/OnlineProcteringSystem/loginadmin" method="post">
	    	<input type="email" name="email" placeholder="Email id" required="required" /><br>
	        <input type="password" name="password" placeholder="Password" required="required" /><br>
	        <input class="button" type="reset" value="RESET">
	 		<input class="button" type="submit" value="LOGIN">
	 </form>
	  <h2><%=getServletContext().getAttribute("adminLoginError") %></h2>
	</div>
	 <%getServletContext().removeAttribute("adminLoginError");%>
</body>
</html>