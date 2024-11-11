<%@page import="user.UserBean"%>
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
	UserBean ubean = (UserBean) session.getAttribute("ubean");
	Double total = (Double) request.getAttribute("total");
	out.println("Hello mr. " + ubean.getUfname() + " <br>");
	out.println("You have charged ₹" + total);
	out.println("Your order placed successfully!");
	%>

	<a href="userview">View product</a>
	<br>
	<a href="logout">Logout</a>
</body>
</html>