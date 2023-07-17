<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form:form action="/${song.id}/update" method="POST" modelAttribute="editSong">
			<div>
				<div class="form-group">
					<form:label path="title">Title: </form:label>
					<form:errors path="title" class="text-danger"/>
					<form:input path="title" value="${song.title}" placeholder="untitled project ${song.id}"/>
				</div>
				<div class="form-group">
					<form:label path="theme">Theme: </form:label>
					<form:input path="theme" value="${song.theme}"/>
				</div>
					<a href="/${song.id}">Back to
						<c:if test="${fn:length(song.title) <= 0}">
							<c:out value="untitled project ${song.id}"/>
						</c:if>	
							<c:out value="${song.title}"/>
					</a>
			</div>
			<div>
				<p>Verse 1</p>
				<form:input path="verse1Line1" value="${song.verse1Line1}"/>
				<form:input path="verse1Line2" value="${song.verse1Line2}"/>
				<form:input path="verse1Line3" value="${song.verse1Line3}"/>
				<form:input path="verse1Line4" value="${song.verse1Line4}"/>
			</div>
			<div>
				<p>Chorus</p>
				<form:input path="chorusLine1" value="${song.chorusLine1}"/>
				<form:input path="chorusLine2" value="${song.chorusLine2}"/>
				<form:input path="chorusLine3" value="${song.chorusLine3}"/>
				<form:input path="chorusLine4" value="${song.chorusLine4}"/>
			</div>
			<div>
				<p>Verse 2</p>
				<form:input path="verse2Line1" value="${song.verse2Line1}"/>
				<form:input path="verse2Line2" value="${song.verse2Line2}"/>
				<form:input path="verse2Line3" value="${song.verse2Line3}"/>
				<form:input path="verse2Line4" value="${song.verse2Line4}"/>
			</div>
			<div>
				<p>Bridge</p>
				<form:input path="bridgeLine1" value="${song.bridgeLine1}"/>
				<form:input path="bridgeLine2" value="${song.bridgeLine2}"/>
				<form:input path="bridgeLine3" value="${song.bridgeLine3}"/>
				<form:input path="bridgeLine4" value="${song.bridgeLine4}"/>
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