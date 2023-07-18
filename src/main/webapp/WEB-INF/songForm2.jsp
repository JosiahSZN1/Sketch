<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form:form class="container" action="/new/${ideaID}" method="POST" modelAttribute="newSong">
			<div>
				<div class="form-group">
					<form:input class= "form-control-lg" path="title" value="${titleIdea}" placeholder="This song is called..."/>
					<form:errors path="title" class="text-danger"/>
				</div>
				<div class="form-group">
					<form:input class= "form-control-sm" path="theme" value="${themeIdea}" placeholder="... it is about..."/>
				</div>
				<a href="/home">Home</a>
			</div>
			<div>
				<h4>Verse 1</h4>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line1" value="${verse1Line1idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line2" value="${verse1Line2idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line3" value="${verse1Line3idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line4" value="${verse1Line4idea}"/>
			</div>
			<div>
				<h4>Chorus</h4>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine1" value="${chorusLine1idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine2" value="${chorusLine2idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine3" value="${chorusLine3idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine4" value="${chorusLine4idea}"/>
			</div>
			<div>
				<h4>Verse 2</h4>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line1" value="${verse2Line1idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line2" value="${verse2Line2idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line3" value="${verse2Line3idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line4" value="${verse2Line4idea}"/>
			</div>
			<div>
				<h4>Bridge</h4>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine1" value="${bridgeLine1idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine2" value="${bridgeLine2idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine3" value="${bridgeLine3idea}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine4" value="${bridgeLine4idea}"/>
			</div>
			<input type="submit" value="Save" class="btn btn-primary"/>
		</form:form>
		<a href="/new/${ideaID}">Regenerate</a>
	</div>
</body>
</html>