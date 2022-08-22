<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
	<a href="/languages">Go back</a>

<form:form action="/languages/edit/{langId}" method="post" modelAttribute="Lang">
	 <input type="hidden" name="_method" value="put">

	<div>
        <form:label class= "form-label" path="name">Name:</form:label>
        <form:errors path="name"/>
        <form:input class= "form-control" path="name"/>
	</div>
    
    <div>
        <form:label class= "form-label" path="creator">Creator:</form:label>
        <form:errors path="creator"/>
        <form:input class= "form-control" path="creator"/>
    </div>
    
    <div>
        <form:label class= "form-label" path="version">Version</form:label>
        <form:errors path="version"/>     
        <form:input class= "form-control" type="number" path="version"/>
    </div>
        
        
       
    <input type="submit" class= "btn btn-primary" value="Submit"/>
</form:form>
</body>
</html>