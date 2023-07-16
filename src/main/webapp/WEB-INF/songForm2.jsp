<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form:form action="/new" method="POST" modelAttribute="newSong">
			<div>
				<div class="form-group">
					<form:label path="title">Title: </form:label>
					<form:input path="title" value="${titleIdea}"/>
				</div>
				<div class="form-group">
					<form:label path="theme">Theme: </form:label>
					<%-- <form:input path="theme"/> --%>
					<form:input path="theme" value="${themeIdea}"/>
				</div>
			</div>
			<div>
				<p>Verse 1</p>
				<form:input path="verse1Line1" value="${verse1Line1idea}"/>
				<form:input path="verse1Line2" value="${verse1Line2idea}"/>
				<form:input path="verse1Line3" value="${verse1Line3idea}"/>
				<form:input path="verse1Line4" value="${verse1Line4idea}"/>
			</div>
			<div>
				<p>Chorus</p>
				<form:input path="chorusLine1" value="${chorusLine1idea}"/>
				<form:input path="chorusLine2" value="${chorusLine2idea}"/>
				<form:input path="chorusLine3" value="${chorusLine3idea}"/>
				<form:input path="chorusLine4" value="${chorusLine4idea}"/>
			</div>
			<div>
				<p>Verse 2</p>
				<form:input path="verse2Line1" value="${verse2Line1idea}"/>
				<form:input path="verse2Line2" value="${verse2Line2idea}"/>
				<form:input path="verse2Line3" value="${verse2Line3idea}"/>
				<form:input path="verse2Line4" value="${verse2Line4idea}"/>
			</div>
			<div>
				<p>Bridge</p>
				<form:input path="bridgeLine1" value="${bridgeLine1idea}"/>
				<form:input path="bridgeLine2" value="${bridgeLine2idea}"/>
				<form:input path="bridgeLine3" value="${bridgeLine3idea}"/>
				<form:input path="bridgeLine4" value="${bridgeLine4idea}"/>
			</div>
			<%-- <form:hidden path="song" value="${song}"/> --%>
			<input type="submit" value="Save" class="btn btn-primary"/>
		</form:form>
	</div>
</body>
</html>