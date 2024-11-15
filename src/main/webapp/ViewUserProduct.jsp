<%@page import="user.UserBean"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="pack1.ProductBean"%>
<%@ page import="pack1.AdminBean"%>
<%@ page import="java.util.Base64"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
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
</style>
</head>
<body class='container-fluid bg-dark text-light'>

	<%
	UserBean abean = (UserBean) session.getAttribute("ubean");
	ArrayList<ProductBean> products = (ArrayList<ProductBean>) session.getAttribute("ProductList");
	%>

	<h3 class='text-info my-4 text-center'>
		Product Details for Mr.
		<%=abean != null ? abean.getUfname() : "Guest"%></h3>

	<div class="container">
		<%
		if (products != null && !products.isEmpty()) {
		%>
		<div class="row">
			<%
			for (ProductBean product : products) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card h-100">
					<%
					byte[] imageBytes = product.getImage();
					if (imageBytes != null && imageBytes.length > 0) {
						String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
						String mimeType = "image/jpeg";
						if (imageBytes[0] == (byte) 137 && imageBytes[1] == (byte) 80 && imageBytes[2] == (byte) 78
						&& imageBytes[3] == (byte) 71) {
							mimeType = "image/png";
						}
					%>
					<img src="data:<%=mimeType%>;base64,<%=base64Image%>"
						alt="Product Image" class="card-img-top"
						style="height: 200px; object-fit: cover;" />
					<%
					}
					%>
					<div class="card-body d-flex flex-column justify-content-between">
						<h5 class="card-title text-center"><%=product.getPname()%></h5>
						<p class="card-text">
							<strong>Product Code:</strong>
							<%=product.getPcode()%>
						</p>
						<p class="card-text">
							<strong>Brand:</strong>
							<%=product.getPcomp()%>
						</p>
						<p class="card-text">
							<strong>Quantity:</strong>
							<%=product.getPqnt()%>
						</p>
						<div class="d-flex justify-content-between mt-auto text-center">
							<a href="buy?pcode=<%=product.getPcode()%>"
								class="btn btn-outline-info w-100">Buy</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<%
		} else {
		%>
		<p>No products available.</p>
		<%
		}
		%>

		<div class="d-flex justify-content-center flex-cloumn align-items-center mt-3">
			<a href="AddProduct.html" class="btn btn-outline-info">Add
				Product <span class="bi-plus-circle-dotted"></span>
			</a>
		</div>
		<div class="d-flex justify-content-center flex-cloumn align-items-center mt-3">
			 <a href="logout" class="btn btn-outline-danger">Logout</a>
		</div>
	</div>

</body>
</html>
