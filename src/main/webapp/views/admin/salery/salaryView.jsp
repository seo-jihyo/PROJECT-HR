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
    <h2>급여</h2>
    <button><a href="/views/admin/salery/saleryModal.jsp">급여</a></button>
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
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
    </tr>
    <tr>
      <th>사원번호</th>
      <th>귀속연월</th>
      <th>이름</th>
      <th>기본금</th>
      <th>상여금</th>
      <th>직책수당(팀장이상)</th>
      <th>연차수당</th>
      <th>국민연금(4.5%)</th>
      <th>건강보험(3.99%)</th>
      <th>장기요양보험</th>
      <th>고용보험</th>
      <th>소득세</th>
      <th>지방소득세</th>
      <th>실수령액</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>001</td>
      <td>7/1</td>
      <td>이재경</td>
      <td>하루 종일</td>
      <td>연차</td>
      <td>개발부서</td>
      <td>직무</td>
      <td></td>
      <td>일정노트</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>