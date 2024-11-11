<%@ page import="user.UserBean"%>
<%@ page import="pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
#successModal {
	transition: opacity 0.5s ease-out;
}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		setTimeout(function() {
			document.getElementById("successModal").style.opacity = "0";
			setTimeout(function() {
				document.getElementById("successModal").style.display = "none";
			}, 5000);
		}, 2000);
	});
</script>

</head>
<body class="bg-dark text-white">
	<div class="container mt-5">
		<%
		UserBean ubean = (UserBean) session.getAttribute("ubean");
		if (ubean != null) {
		%>
		<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
            <symbol id="check-circle-fill" viewBox="0 0 16 16">
                <path
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
            </symbol>
        </svg>
		<div
			class="alert alert-success d-flex align-items-center w-25 mx-auto text-center"
			role="alert" id="successModal">
			<svg class="bi flex-shrink-0 me-2" style="height: 25px; width: 50px"
				role="img" aria-label="Success:">
                <use xlink:href="#check-circle-fill" />
            </svg>
			<div>
				User Login Successful, Welcome
				<%=ubean.getUfname()%>!
			</div>
		</div>
		<%
		}
		%>


		<div class="mt-4 text-center">
			<a href="userview" class="btn btn-primary">View Products</a> <a
				href="logout" class="btn btn-danger ml-2">Log Out</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
