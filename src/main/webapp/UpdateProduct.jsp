<%@page import="pack1.ProductBean"%>
<%@page import="user.UserBean"%>
<%@page import="pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded",
			function() {
				var myModal = new bootstrap.Modal(document
						.getElementById('adminModal'));
				myModal.show();
			});
</script>
</head>
<body class="container-fluid bg-dark text-light">

	<%
	AdminBean abean = (AdminBean) session.getAttribute("abean");
	String msg = (String) request.getAttribute("msg");
	%>

	<!-- Admin Information Modal -->
	<div class="modal fade" id="adminModal" tabindex="-1"
		aria-labelledby="adminModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content bg-dark text-light">
				<div class="modal-header d-flex flex-column">
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
					<h3>
						Hello Mr.
						<%=abean != null ? abean.getAfname() : "Admin"%></h3>
					<p class="text-success">Welcome to your dashboard!</p>
				</div>
				<div class="modal-body">
					<p>
						<strong>Message:</strong>
						<%=msg != null ? msg : "No new notifications."%></p>
					<p>
						<strong>Actions:</strong>
					</p>
					<ul>
						<li><a href="AddProduct.html" class="text-info">Add
								Product</a></li>
						<li><a href="userview" class="text-info">View Products</a></li>
						<li><a href="logout" class="text-danger">Logout</a></li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/OnlineElectronicStore/userview';">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
