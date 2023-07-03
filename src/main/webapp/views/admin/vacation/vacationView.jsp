<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="/assets/css/styles.css">
  <%--    <link rel="stylesheet" href="static/css/style.css">--%>
  <title>근로정보</title>
</head>
<body id="body-pd">
<%@include file="/views/include/header.jsp" %>

<div class="main">

  <div class="main_title">
    <h2>휴가 관리</h2>
    <button><a href="/views/admin/vacation/vacationModal.jsp">휴가 관리</a></button>
  </div>

  <table class="table table-hover">
    <thead>
    <tr>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
    </tr>
    <tr>
      <th>사원번호</th>
      <th>직원</th>
      <th>휴가시간</th>
      <th>휴가그룹</th>
      <th>휴가 유형</th>
      <th>유급 시간</th>
      <th>차감일수</th>
      <th>사유</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>001</td>
      <td>이재경</td>
      <td>7월 3일 (월) 09:00 - 18:00</td>
      <td>연차휴가</td>
      <td>연차</td>
      <td>8h</td>
      <td>1일</td>
      <td>사유 주저리주저리</td>
    </tr>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>