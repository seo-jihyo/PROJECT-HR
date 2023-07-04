<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<%--    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
    <div class="main_title">
        <h2>근로정보</h2>
        <button><a href="/views/admin/manage/workModal.jsp">근로정보 추가하기</a></button>
    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
        </tr>
        <tr>
            <th><input type="checkbox"></th>
            <th>근로정보명</th>
            <th>시급</th>
            <th>소정근로요일</th>
            <th>주휴요일</th>
            <th>메모</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>일반근무</td>
            <td><fmt:formatNumber type="currency" value="${12000}"/></td>
            <td>월,화,수,목,금</td>
            <td>일</td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>최저시급</td>
            <td><fmt:formatNumber type="currency" value="${10000}"/></td>
            <td>월,화,수,목,금</td>
            <td>일</td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>일반근무2</td>
            <td><fmt:formatNumber type="currency" value="${15000}"/></td>
            <td>월,화,수,목,금</td>
            <td>일</td>
            <td></td>
        </tr>
        </tbody>
    </table>
    </div>
</section>
<script src="/assets/js/main.js"></script>
</body>
</html>