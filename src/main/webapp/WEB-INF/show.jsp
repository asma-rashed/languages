<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
<a href="/languages">Go back</a>
	<div class="container">
		<h1> 
			<c:out value="${book.getName()}"/>
		</h1>
		
		<h1> 
			<c:out value="${book.getCreator()}"/>
		</h1>
		
		<h1> 
			<c:out value="${book.getVersion()}"/>
		</h1>
		<h1>
			<a href="/languages/${ langId.id }/edit">edit</a>
		</h1>
		<h1>
			<form action="/languages/${ ;anguage.id}" method="post">
    				<input type="hidden" name="_method" value="delete">
    				<input type="submit" class= "btn btn-danger" value="Delete">
				</form>
		</h1>
	</div>
</body>
</html>