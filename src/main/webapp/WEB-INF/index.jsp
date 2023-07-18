<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h1>Sketch. </h1>
			<p class="small">A song writing application where you can store & workshop unfinished ideas for song lyrics or general song ideas. Everyone is a song writer.</p>
		</div>
		<div class="login-form">	
			<form:form  action="/" method="POST" modelAttribute="newLogin">
				<h4>Sign in</h4>
				<form:errors path="userName" class="text-danger"/>
				<div class="form-floating mb-3">
					<form:input type="text" class="form-control" id="floatingInput" placeholder="Username" path="userName" />
					<form:label for="floatingInput" path="userName">Username</form:label>
				</div>
				<form:errors path="password" class="text-danger"/>
				<div class="form-floating">
					<form:input type="password" class="form-control" id="floatingInput" placeholder="Password" path="password"/>
					<form:label for="floatingPassword" path="password">Password</form:label>
				</div>
				<div class="form-submit">
					<input class="btn btn-success" type="submit" value="Sign in">
					<p class="small text-end"> New to Sketch? <a href="/register">Register here</a></p>
				</div>
			</form:form>
			
		</div>
	</div>
</body>
</html>