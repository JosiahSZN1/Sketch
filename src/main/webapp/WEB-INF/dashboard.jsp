<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Sketch - <c:out value="${user.userName}"/>'s ideas and projects</title>
</head>
<body>
	<div class="container">
		<div class="navbar d-flex justify-content between" style="display:flex; justify-content:space-between">
			<div class="row">
				<h1 style="color:rgb(0,0,0)">Sketch</h1>
				<h4>Welcome, <c:out value="${user.userName}"/>! Here's what you're working on!</h4>
				<a href="/logout">logout</a>
			</div>
			<div style="display:flex; flex-direction:column; align-items:end">
				<a href="/song/new">+ Write a new song</a>
			</div>
		</div>
		<div class="">
			<table class="table table-striped border border-3 border-dark">
				<thead style="background-color:rgb(204,204,204)">
					<tr>
						<th class="border border-3 border-dark border-bottom-0">ID</th>
						<th class="border border-3 border-dark border-bottom-0">Title</th>
						<th class="border border-3 border-dark border-bottom-0">Writer(s)</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="song" items="${allSongs}">
						<tr>
							<td class="border border-3 border-dark border-top-0 border-bottom-0"><c:out value="${song.id}"/></td>
							<td class="border border-3 border-dark border-top-0 border-bottom-0"><a href="/song/${song.id}"><c:out value="${song.title}"/></a></td>
							<td class="border border-3 border-dark border-top-0 border-bottom-0"><c:forEach var="writer" items="${song.writers}"><c:out value="${writer.userName}"/> </c:forEach></td>
						<%-- 	<td class="border border-3 border-dark border-top-0 border-bottom-0"><c:out value="${song.user.name}"/></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<h3>Your ideas... </h3>
			<div>
				<c:forEach var="idea" items="${allIdeas}">
					<div>
						<a href="/new/${idea.id}">Generate template</a>
						<c:out value="${idea.text}"/>
						<form action="/${idea.id}/delete" method="post">
    						<input type="hidden" name="_method" value="delete">
    						<input type="submit" value="Delete">
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
		<form:form action="/home" method="POST" modelAttribute="newIdea" class="form">
					<div class="form-group mb-3">
						<form:label path="text" class="form-label">New Idea: </form:label>
						<form:errors path="text" class="text-danger"/>
						<form:input path="text" type="text" class="form-control"/>
					</div>
<!-- 					THE VALUE FOR USER HAS TO BE USER ID BECAUSE THAT IS THE VALUE BEING STORED IN THE FOREIGN KEY FOR IDEA -->
						<form:hidden path="user" value="${user.id}"/>
					<input type="submit" value="+" class="btn btn-success float-end"/>
		</form:form>
		
	</div>
</body>
</html>