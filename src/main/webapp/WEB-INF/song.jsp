<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div>
			<h2><c:out value="${song.title}"/></h2>
			<p>By: <c:forEach var="writer" items="${song.writers}"><c:out value="${writer.userName}"/></c:forEach>
			
			</p>
			<div style="display:flex; flex-direction:row; justify-content:end">
				<c:if test="${song.writers.contains(user)}">
					<a href="/${song.id}/edit">Edit</a> |
				</c:if>
				<a href="/home">Home</a>
			</div>
			
			<%-- <c:if test="${!song.writers.contains(user)}">
				<a href="">Request collaboration</a>
			</c:if> --%>
			
		</div>
		<div>
			
				<h4>Verse 1:</h4>
				<p><c:out value="${song.verse1Line1}"/></p>
				<p><c:out value="${song.verse1Line2}"/></p>
				<p><c:out value="${song.verse1Line3}"/></p>
				<p><c:out value="${song.verse1Line4}"/></p> 
				<%-- <c:if test="${song.writers.contains(user)}">
					<a href="/${song.id}/verse/new">Edit Verse</a>
				</c:if> --%>
			
			<hr>
			<%-- <c:if test="${song.writers.contains(user)}">
				<a href="/${song.id}/verse/new">Add a Verse</a>
			</c:if> --%>
			
		</div>
		<div>
			<h3>Chorus: </h3>
			<p><c:out value="${song.chorusLine1}"/></p>
			<p><c:out value="${song.chorusLine2}"/></p>
			<p><c:out value="${song.chorusLine3}"/></p>
			<p><c:out value="${song.chorusLine4}"/></p>
			<%-- <c:if test="${song.writers.contains(user)}">
				
					<c:when test="${song.chorus == null}">
						<a href="/${song.id}/chorus/new">Add a Chorus</a>
					</c:when>
				
						<a href="">Edit Chorus</a>
					
				
			</c:if> --%>
			
		</div>
		<div>
			
				<h4>Verse 2:</h4>
				<p><c:out value="${song.verse2Line1}"/></p>
				<p><c:out value="${song.verse2Line2}"/></p>
				<p><c:out value="${song.verse2Line3}"/></p>
				<p><c:out value="${song.verse2Line4}"/></p> 
				<%-- <c:if test="${song.writers.contains(user)}">
					<a href="/${song.id}/verse/new">Edit Verse</a>
				</c:if>
			
			<hr>
			<c:if test="${song.writers.contains(user)}">
				<a href="/${song.id}/verse/new">Add a Verse</a>
			</c:if> --%>
			
		</div>
		<h3>Chorus</h3>
		<div>
			
				<h4>Bridge:</h4>
				<p><c:out value="${song.bridgeLine1}"/></p>
				<p><c:out value="${song.bridgeLine2}"/></p>
				<p><c:out value="${song.bridgeLine3}"/></p>
				<p><c:out value="${song.bridgeLine4}"/></p> 
				<%-- <c:if test="${song.writers.contains(user)}">
					<a href="/${song.id}/verse/new">Edit Verse</a>
				</c:if> --%>
			
			<hr>
			<%-- <c:if test="${song.writers.contains(user)}">
				<a href="/${song.id}/verse/new">Add a Verse</a>
			</c:if> --%>
			
		</div>
	</div>
</body>
</html>