<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
			<c:if test="${success != null}">
				<div class="alert alert-success">
					<c:out value="${success}" />
				</div>
			</c:if>
			<div>
				<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Creator</th>
		      <th scope="col">Version</th>
		      <th scope="col">Actions</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${language}" var="langElement">
		  	<tr>
		  		<td><a href = "languages/${ language.id }"><c:out value="${languageElement.getName()}"/></a></td>
		  		<td><c:out value="${languageElement.getCreator()}"/></td>
		  		<td><c:out value="${languageElement.getVersion()}"/></td>
		  		<td><a href="/languages/${ language.id }/edit">edit</a> 
		  		<form action="/languages/${ language.id}" method="post">
    				<input type="hidden" name="_method" value="delete">
    				<input type="submit" class= "btn btn-danger" value="Delete">
				</form>
		  		</td>
		  	</tr>
		  </c:forEach>
		  </tbody>
		</table>
			</div>
			<div>
			<form:form method="post" modelAttribute="lang">
				<div class="mb-3">
					<label for="Title" class="form-label">Name</label>
					<form:input path="name" type="text" cssClass="form-control" cssErrorClass="form-control is-invalid" class="form-control"  aria-describedby="bookHelp"/>
					<form:errors path="name" cssClass="invalid-feedback"/>
				</div>
				<div class="mb-3">
					<label for="Creator" class="form-label">creator</label>
					<form:input path="creator" type="text" cssClass="form-control" cssErrorClass="form-control is-invalid" class="form-control" id="Vendor"/>
					<form:errors path="creator" cssClass="invalid-feedback"/>
				</div>
				<div class="mb-3">
					<label for="Version" class="form-label">Version</label>
					<form:input path="version" type="text" cssClass="form-control" cssErrorClass="form-control is-invalid" class="form-control" id="Amount"/>
					<form:errors path="version" cssClass="invalid-feedback"/>
				</div>
				
				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
			</div>

		</div>
</body>
</html>