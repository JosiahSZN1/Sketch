<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- <link rel="stylesheet" type="text/css" href="/css/style.css"> -->
<meta charset="UTF-8">
<title>Sketch - Edit <c:out value="${song.title}"/></title>
</head>
<body>
	<div class="container">
		<form:form action="/${song.id}/update" method="POST" modelAttribute="editSong">
			<div>
				<div class="form-group">
					<form:input class="form-control-lg" path="title" value="${song.title}" placeholder="This song is called..."/>
					<form:errors path="title" class="text-danger"/>
				</div>
				<div class="form-group">
					<form:input class= "form-control-sm" path="theme" value="${song.theme}" placeholder="... it is about..."/>
				</div>
					<a href="/${song.id}">Back to
						<c:if test="${fn:length(song.title) <= 0}">
							<c:out value="untitled project ${song.id}"/>
						</c:if>	
							<c:out value="${song.title}"/>
					</a>
			</div>
			<div>
				<h3>Verse 1</h3>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line1" value="${song.verse1Line1}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line2" value="${song.verse1Line2}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line3" value="${song.verse1Line3}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse1Line4" value="${song.verse1Line4}"/>
			</div>
			<div>
				<h3>Chorus</h3>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine1" value="${song.chorusLine1}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine2" value="${song.chorusLine2}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine3" value="${song.chorusLine3}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="chorusLine4" value="${song.chorusLine4}"/>
			</div>
			<div>
				<h3>Verse 2</h3>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line1" value="${song.verse2Line1}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line2" value="${song.verse2Line2}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line3" value="${song.verse2Line3}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="verse2Line4" value="${song.verse2Line4}"/>
			</div>
			<div>
				<h3>Bridge</h3>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine1" value="${song.bridgeLine1}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine2" value="${song.bridgeLine2}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine3" value="${song.bridgeLine3}"/>
				<form:input type="text" readonly="" class="form-control-plaintext" id="staticInput" path="bridgeLine4" value="${song.bridgeLine4}"/>
			</div>
			<form:hidden path="id" value="${song.id}"/>
			<input type="submit" value="Update" class="btn btn-primary"/>
		</form:form>
		<form action="/song/${song.id}/delete" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete <c:if test="${fn:length(song.title) <= 0}"><c:out value="untitled project ${song.id}"/></c:if><c:out value="${song.title}"/>">
		</form>
	</div>
</body>
</html>