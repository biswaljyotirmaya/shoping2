<%@page import="user.UserBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack1.ProductBean"%>
<%@page import="pack1.AdminBean"%>
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
</head>
<body
	class='container-fluid bg-dark text-light d-flex justify-content-center align-items-center flex-column'>

	<%
	UserBean ubean = (UserBean) session.getAttribute("ubean");
	ArrayList<ProductBean> products = (ArrayList<ProductBean>) session.getAttribute("ProductList");
	%>

	<h3 class='text-info mt-4'>
		Product Details for Mr.
		<%=ubean != null ? ubean.getUfname() : "Guest"%></h3>

	<div class='w-75 mt-3'>
		<table class='table table-dark table-hover'>
			<thead>
				<tr>
					<th scope='col'>#</th>
					<th scope='col'>Product Code</th>
					<th scope='col'>Product Name</th>
					<th scope='col'>Company</th>
					<th scope='col'>Price</th>
					<th scope='col'>Quantity</th>
					<th scope='col'>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (products == null || products.isEmpty()) {
				%>
				<tr>
					<td colspan='7' class='text-center'>No data found!</td>
				</tr>
				<%
				} else {
				int row = 1;
				for (ProductBean product : products) {
				%>
				<tr>
					<td><%=row++%></td>
					<td><%=product.getPcode()%></td>
					<td><%=product.getPname()%></td>
					<td><%=product.getPcomp()%></td>
					<td><%=product.getPrice()%></td>
					<td><%=product.getPqnt()%></td>
					<td><a href='buy?pcode=<%=product.getPcode()%>'
						class='btn btn-outline-info '> Buy</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>
	<div class="mt-4">
		<a href="Logout.jsp" class="btn btn-danger ml-2">Log Out</a>
	</div>

</body>
</html>
