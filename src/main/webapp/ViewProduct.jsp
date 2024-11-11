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
td,th {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body
	class='container-fluid bg-dark text-light d-flex justify-content-center align-items-center flex-column'>

	<%
	AdminBean abean = (AdminBean) session.getAttribute("abean");
	ArrayList<ProductBean> products = (ArrayList<ProductBean>) session.getAttribute("ProductList");
	%>

	<h3 class='text-info mt-4'>
		Product Details for Mr.
		<%=abean != null ? abean.getAfname() : "Guest"%></h3>

	<div class='w-75 mt-3 table-responsive'>
		<table class='table table-dark table-hover'>
			<thead>
				<tr>
					<th scope='col'>#</th>
					<th scope='col'>Product Code</th>
					<th scope='col'>Product Name</th>
					<th scope='col'>Company</th>
					<th scope='col'>Price</th>
					<th scope='col'>Quantity</th>
					<th scope='col'>Preview</th>
					<th scope='col'>Actions</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<%
				if (products == null || products.isEmpty()) {
				%>
				<tr>
					<td colspan='8' class='text-center'>No data found!</td>
				</tr>
				<%
				} else {
				int row = 1;
				for (ProductBean product : products) {
				%>
				<tr class="align-items-center">
					<td><%=row++%></td>
					<td><%=product.getPcode()%></td>
					<td><%=product.getPname()%></td>
					<td><%=product.getPcomp()%></td>
					<td><%=product.getPrice()%></td>
					<td><%=product.getPqnt()%></td>
					<td>
						<%
						byte[] imageBytes = product.getImage();
						if (imageBytes != null && imageBytes.length > 0) {
							String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
						%> <img src="data:image/jpeg;base64,<%=base64Image%>"
						alt="Product Image" width="50" height="50" /> <%
 } else {
 %> <img src="path/to/placeholder.jpg" alt="No Image" width="50"
						height="50" class="rounded border" /> <%
 }
 %>
					</td>
					<td><a href='edit?pcode=<%=product.getPcode()%>'
						class='btn btn-outline-warning btn-sm me-2'> <i
							class="bi bi-pencil"></i> Edit
					</a> <a href='delete?pcode=<%=product.getPcode()%>'
						class='btn btn-outline-danger btn-sm'> <i class="bi bi-trash"></i>
							Delete
					</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<div class="d-flex justify-content-center align-items-center mt-3">
		<a href="AddProduct.html" class="btn btn-outline-info">Add Product <span class="bi-plus-circle-dotted"></span> </a>
	</div>
	

</body>
</html>
