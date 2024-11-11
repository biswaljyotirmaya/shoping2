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
        session.invalidate();
        out.println("Logged out successfully!<br>");
    %>
    <jsp:include page="index.html" />
</body>
</html>
