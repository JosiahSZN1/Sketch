<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Sketch - Write your songs when you can</title>
</head>
<body>
	<div class="container">
		<div class="row">
				<h1 style="color:rgb(0,0,0)">Sketch</h1>
				<p>A song writing application where you can store unfinished ideas for song lyrics or general song ideas.</p>
		</div>
		<div class="row">
			
			<div class="col-6">
				<h2>Sign in</h2>
				<form:form action="/login" method="POST" modelAttribute="newLogin" class="form">
					<div class="form-group mb-3">
						<form:label path="userName" class="form-label">Username: </form:label>
						<form:errors path="userName" class="text-danger"/>
						<form:input path="userName" type="text" class="form-control"/>
					</div>
					<div class="form-group mb-3">
						<form:label path="password" class="form-label">Password: </form:label>
						<form:errors path="password" class="text-danger"/>
						<form:input path="password" type="password" class="form-control"/>
					</div>
					<input type="submit" value="Sign in" class="btn btn-success float-end">
				</form:form>
				<p>New to Sketch? <a href="/register">Register</a></p>
			</div>
		</div>
			
	</div>
</body>
</html>