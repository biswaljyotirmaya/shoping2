<!DOCTYPE html>
<%@page import="user.UserBean"%>
<%@page import="pack1.ProductBean"%>
<%@page import="pack1.AdminBean"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Buy Product</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="bg-dark text-white">
	<%
	UserBean abean = (UserBean) session.getAttribute("ubean");
	ProductBean product = (ProductBean) request.getAttribute("product");
	%>
	<div
		class="container d-flex justify-content-center align-items-center flex-column vh-100">
		<h3 class="mb-4">
			Hello Mr.<%=abean.getUfname()%></h3>
		<form action="buyproduct" method="post"
			class="w-50 p-4 border border-2 border-secondary rounded-4">
			<h3 class="text-center mb-4">Buy Product</h3>

			<div class="mb-3 row align-items-center">
				<label for="pcode" class="col-sm-4 col-form-label">Product
					Code</label>
				<div class="col-sm-8">
					<input type="text" readonly class="form-control" id="pcode"
						name="pcode" value="<%=product.getPcode()%>">
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<label for="pname" class="col-sm-4 col-form-label">Product
					Name</label>
				<div class="col-sm-8">
					<input type="text" readonly class="form-control" id="pname"
						name="pname" value="<%=product.getPname()%>">
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<label for="pcomp" class="col-sm-4 col-form-label">Product
					Company</label>
				<div class="col-sm-8">
					<input type="text" readonly class="form-control" id="pcomp"
						name="pcomp" value="<%=product.getPcomp()%>">
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<label for="price" class="col-sm-4 col-form-label">Product
					Price</label>
				<div class="col-sm-8">
					<input type="text" readonly class="form-control" id="price"
						name="price" value="<%=product.getPrice()%>">
				</div>
			</div>

			<div class="mb-3 row align-items-center">
				<label for="pqnt" class="col-sm-4 col-form-label">Available
					Product Quantity</label>
				<div class="col-sm-8">
					<input type="number" readonly class="form-control" id="pqnt"
						name="pqnt" value="<%=product.getPqnt()%>">
				</div>
			</div>
			<div class="mb-3 row align-items-center">
				<label for="rqnt" class="col-sm-4 col-form-label">Required
					quantity</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" id="rqnt" name="rqnt"
						min="0" max="<%=product.getPqnt()%>">
				</div>

			</div>

			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-info">Update product</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
