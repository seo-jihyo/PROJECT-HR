<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>

  <%--jquery--%>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
  <div class="main_title">
    <h2>휴가 발생규칙</h2>
    <button><a href="/views/admin/manage/vacationRulesModal.jsp">휴가 발생규칙 추가하기</a></button>
  </div>

  <table class="table table-hover">
    <thead>
    <tr>
      <th>휴가 그룹</th>
      <th>규칙명</th>
      <th>월 기준 발생</th>
      <th>연 기준 발생</th>
      <th>메모</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>연차휴가</td>
      <td>(회계연도 기준)연차 휴가 발생 규칙</td>
      <td>1개</td>
      <td>5개</td>
      <td></td>
    </tr>
    <tr>
      <td>연차휴가</td>
      <td>(회계연도 기준)연차 휴가 발생 규칙</td>
      <td>1개</td>
      <td>5개</td>
      <td></td>
    </tr>
    </tbody>
  </table>
</section>
<script src="/assets/js/main.js"></script>
</body>
</html>