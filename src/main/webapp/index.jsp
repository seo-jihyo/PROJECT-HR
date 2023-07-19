<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="assets/css/styles.css">
    <%--    <link rel="stylesheet" href="static/css/style.css">--%>
    <title>Document</title>
</head>
<body>

<c:choose>
    <c:when test="${login.permission_type == 1}">
        <c:redirect url="/dashboard.do?cate=nav-home"></c:redirect>

    </c:when>
    <c:when test="${login.permission_type == 0}">
        <c:redirect url="/userSchedule.do"></c:redirect>
    </c:when>
    <c:otherwise>
        <c:redirect url="/login.do"></c:redirect>
    </c:otherwise>
</c:choose>

</body>
</html>