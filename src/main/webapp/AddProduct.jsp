<%@page import="pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
body {
	height: 100vh;
}
</style>
</head>
<body
	class="container-fluid bg-dark d-flex justify-content-center align-items-center text-white">

	<div class="text-center">
		<%
		AdminBean abean = (AdminBean) session.getAttribute("abean");
		String msg = (String) request.getAttribute("msg");
		%>

		<h2 class="mb-4">
			Welcome Mr.<%=abean.getAfname()%>!!
		</h2>

		<div class="d-flex flex-column align-items-center mt-4 p-4">
			<a href="AddProduct.html" class="btn btn-info mb-3 w-100">Add
				Product</a> <a href="view" class="btn btn-secondary mb-3 w-100">View
				Products</a>
		</div>
		<div
			class="d-flex justify-content-center flex-cloumn align-items-center mt-3">
			<a href="logout" class="btn btn-outline-danger">Logout</a>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
