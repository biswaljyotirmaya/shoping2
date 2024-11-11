<%@page import="pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%
	AdminBean abean = (AdminBean) session.getAttribute("abean");
	if (abean != null) {
		out.println("Welcome Mr. " + abean.getAfname() + "!!!<br><br>");
	} else {
		response.sendRedirect("login.jsp");
	}
	%>

	<a href="AddProduct.html">Add Product</a>
	<br>
	<a href="view">View Product</a>
	<br>
	<a href="logout">Log out</a>
	<br>

	<%
	if (request.getAttribute("productAdded") != null) {
	%>
	<%
	boolean productAdded = (boolean) request.getAttribute("productAdded");
	%>

	<%
	if (productAdded) {
	%>
	<div class="modal show" id="successModal" tabindex="-1"
		style="display: block;">
		<div class="modal-dialog">
			<div class="modal-content bg-success text-white">
				<div class="modal-header">
					<h5 class="modal-title">Success</h5>
				</div>
				<div class="modal-body">
					<p>Product added successfully!</p>
				</div>
				<div class="modal-footer">
					<a href="AdminHome.jsp" class="btn btn-secondary">Close</a>
				</div>
			</div>
		</div>
	</div>

	<%
	} else {
	%>
	<div class="modal show" id="failureModal" tabindex="-1"
		style="display: block;">
		<div class="modal-dialog">
			<div class="modal-content bg-danger text-white">
				<div class="modal-header">
					<h4 class="modal-title text-center">Error</h4>
				</div>
				<div class="modal-body">
					<p>Failed to add product. Please try again.</p>
				</div>
				<div class="modal-footer">
					<a href="AdminHome.jsp" class="btn btn-secondary">Close</a>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<%
	}
	%>

</body>
</html>
