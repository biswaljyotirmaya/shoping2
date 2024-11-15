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
	document.addEventListener("DOMContentLoaded", function() {
		var myModal = new bootstrap.Modal(document
				.getElementById('productModal'));
		myModal.show();
	});
</script>
</head>
<body class="container-fluid bg-dark text-light">

	<%
	UserBean ubean = (UserBean) session.getAttribute("ubean");
	String msg = (String) request.getAttribute("msg");
	ProductBean product = (ProductBean) session.getAttribute("Product");
	Double total = (Double) request.getAttribute("total");
	%>


	<div class="modal fade" id="productModal" tabindex="-1"
		aria-labelledby="productModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content bg-dark text-light">
				<div class="modal-header d-flex flex-column">
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
					<h3>
						Hello Mr.
						<%=ubean != null ? ubean.getUfname() : "Admin"%>
					</h3>
					<p class="text-success">Order confirmed!</p>
				</div>
				<div class="modal-body">
					<div class="row g-4">
						<div class="col-md-4">
							<%
							if (product != null && product.getImage() != null) {
								byte[] imageBytes = product.getImage();
								String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
								String mimeType = "image/jpeg";
								if (imageBytes[0] == (byte) 137 && imageBytes[1] == (byte) 80 && imageBytes[2] == (byte) 78
								&& imageBytes[3] == (byte) 71) {
									mimeType = "image/png";
								}
							%>
							<img src="data:<%=mimeType%>;base64,<%=base64Image%>"
								alt="Product Image" class="img-fluid rounded"
								style="object-fit: cover; height: 200px; width: 100%;">
							<%
							} else {
							%>
							<div class="text-center text-muted">No Image Available</div>
							<%
							}
							%>
						</div>

						<div class="col-md-8">
							<h5 class="card-title my-4"><%=product.getPname()%></h5>
							<p class="card-text">
								<strong>Product Code:</strong>
								<%=product.getPcode()%>
							</p>
							<p class="card-text">
								<strong>Brand:</strong>
								<%=product.getPcomp()%>
							</p>
							<p class="card-text">
								<strong>Total:</strong>
								<%=total%>
							</p>
						</div>
					</div>
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
