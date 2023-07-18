<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Sketch. - <c:out value="${user.userName}"/>'s Dashboard</title>
</head>
<body>
	<div class="container login-page">
		<div class="container header">
			<h1>Sketch. </h1>
			<p class="lead">Welcome, <c:out value="${user.userName}"/>! Here's what we're working on! Add new ideas, get inspired by other writers, or work on your projects. Just keep writing. You are a song writer.</p>
			<a href="/logout">Sign out</a>
		</div>
		<div class="container table">
			<table class="table table-striped border border-2 border-dark">
				<thead style="background-color:rgb(204,204,204)">
					<tr>
						<th class="border border-2 border-dark border-bottom-0">Title</th>
						<th class="border border-2 border-dark border-bottom-0">Writer(s)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="song" items="${allSongs}">
						<tr>
							<td class="border border-2 border-dark border-top-0 border-bottom-0">
								<a href="/${song.id}">
									<c:if test="${fn:length(song.title) <= 0}">
										<c:out value="untitled project ${song.id}"/>
									</c:if>	
									<c:out value="${song.title}"/>
								</a>
							</td>
							<td class="border border-2 border-dark border-top-0 border-bottom-0">
								<c:forEach var="writer" items="${song.writers}">
									<c:out value="${writer.userName}"/>
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container">
			<h4 class="text-white"><c:out value="${user.userName}"/>'s ideas...</h4>
			<div class="container idea-bank border border-2 border-dark">
				<c:forEach var="idea" items="${allIdeas}">
					<div class="bg-primary rounded-pill text-white text-center">
						<a class="btn btn-primary rounded-pill" href="/new/${idea.id}">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  								<path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
							</svg>
						</a>
						<c:out value="${idea.text}"/>
						<form action="/idea/${idea.id}/delete" method="post">
    						<input type="hidden" name="_method" value="delete">
    						<button class="btn btn-primary rounded-pill" type="submit">
    							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
  									<path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
								</svg>
    						</button>
    					</form>	
					</div>
				</c:forEach>
			</div>
		</div>
		<form:form action="/home" method="POST" modelAttribute="newIdea" class="form">
		<form:errors path="text" class="text-danger"/>
			<div class="form-floating mb-3">
				<form:input type="text" class="form-control rounded-pill" id="floatingInput" placeholder="new idea" path="text" maxlength="140"/>
				<form:label for="floatingInput" path="text">Add new ideas here.</form:label>
			</div>
			<form:hidden path="user" value="${user.id}"/>
			<input type="submit" value="+" class="btn btn-primary rounded-pill text-white float-end"/>
			
		</form:form>

	</div>
</body>
</html>