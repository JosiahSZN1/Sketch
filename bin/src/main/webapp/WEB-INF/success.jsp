<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Dashboard</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1 style="color:rgb(0,0,0)">Sketch</h1>
			<h3>Welcome, <c:out value="${user.userName}"/>! Here's what you're working on!</h3>
			<a href="/logout">logout</a>
		</div>
		
	</div>
	
</body>
</html>