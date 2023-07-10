<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="item" items="${list}">
	<h2>${item.testval1 }</h2>
	<h2>${item.testval2 }</h2>
	<br>
</c:forEach>

</body>
</html>