<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
#center {
    margin: auto;
    margin-top:100px;
    width: 50%;
    border: 3px solid #13232F;
    padding: 20px;
    text-align:center;
}
.mybutton {
		    background-color: #13232F; /* Green */
		    border: none;
		    color: white;
		    align:center;
		    padding: 15px 32px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    margin: 20px;
		    cursor: pointer;
		    font-size: 20px;
		}
.mybutton:hover{
			box-shadow: 0 0 10px 5px rgba(19, 35, 47, 0.3);
		}		
</style>
<body>
<h1>ADMIN PANEL</h1>
	<div id="center">
		<a href="./admincontrols.jsp">
			<button class="mybutton" onclick="">Monitor Students</button>
		</a><br>
		<a href="./studentlist.jsp">
			<button class="mybutton" onclick="">See Reports</button>
		</a>
	</div>
</body>
</html>