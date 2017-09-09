<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="C" uri="http://java.sun.com/jstl/core_rt" %>
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
#candidates_list{
    margin: auto;
    margin-top:100px;
    width: 50%;
    border: 3px solid #13232F;
    padding: 20px;
    text-align:center;
}
.header{
	font-size: 18px;
	 padding: 12px;
	
}
#userl li a:hover:not(.header){
  background-color: #eee;
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
</style>
<body>

<h1>SELECT STUDENT </h1>
	<div id="candidates_list">
			
			<ul id="userl">
			<li class="header">All Students</li>
		<!--<li><a href="#">Amit Kumar </a></li>
			<li><a href="#">Manish Panwar </a></li>
			<li><a href="#">Rohit Singh </a></li>-->
			<C:forEach var="user" items="${uList}">
				<li><a href="./studentrecord.jsp?${user.id}">${user.fname}  ${user.lname} </a></li>
			</C:forEach>
			</ul>
	</div>

</body>
</html>