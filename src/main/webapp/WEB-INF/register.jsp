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
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Sketch. - Everyone is a song writer.</title>
</head>
<body>
	<div class="container login-page">
		<div class="login-header">
			<h1>Sketch.</h1>
			<p class="small">A song writing application where you can store unfinished ideas for song lyrics or general song ideas.</p>
		</div>
		<div class="login-form">
			<form:form action="/register" method="POST" modelAttribute="newUser" class="form">
				<h4>Register</h4>
				<form:errors path="userName" class="text-danger"/>
				<div class="form-floating mb-3">
					<form:input type="text" class="form-control" id="floatingInput" placeholder="Username" path="userName" />
					<form:label for="floatingInput" path="userName">Username</form:label>
				</div>
				<form:errors path="email" class="text-danger"/>
				<div class="form-floating mb-3">
					<form:input type="text" class="form-control" id="floatingInput" placeholder="email@email.com" path="email" />
					<form:label for="floatingInput" path="email">Email</form:label>
				</div>
				<form:errors path="password" class="text-danger"/>	
				<div class="form-floating mb-3">
					<form:input type="password" class="form-control" id="floatingInput" placeholder="Password" path="password" />
					<form:label for="floatingInput" path="password">Password</form:label>
				</div>
				<form:errors path="confirm" class="text-danger"/>
				<div class="form-floating mb-3">
					<form:input type="password" class="form-control" id="floatingInput" placeholder="Confirm Password" path="confirm" />
					<form:label for="floatingInput" path="confirm">Confirm Password</form:label>
				</div>
				<div class="form-submit">
					<input type="submit" value="Register" class="btn btn-success">
					<a class="small text-end" href="/">Go back</a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>