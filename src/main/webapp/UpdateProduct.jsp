<%@page import="pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	AdminBean abean = (AdminBean) session.getAttribute("abean");
	String msg = (String) request.getAttribute("msg");
	out.println("Hello mr. " + abean.getAfname() + " <br>");
	out.println(msg);
	%>

	<a href="AddProduct.html">Add product</a>
	<br>
	<a href="userview">View product</a>
	<br>
	<a href="logout">Logout</a>
</body>
</html>