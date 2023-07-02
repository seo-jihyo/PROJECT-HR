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
    <h2>근무일정</h2>
    <button><a href="/views/admin/workScheduleModal.jsp">+ 근무일정 추가하기</a></button>
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
    </tr>
    <tr>
      <th>사원번호</th>
      <th>직원</th>
      <th>날짜</th>
      <th>일정시간</th>
      <th>근무일정 유형</th>
      <th>조직</th>
      <th>직무</th>
      <th>근무일정 템플릿</th>
      <th>일정노트</th>
      <th>휴게시간</th>
      <th>총 시간</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>001</td>
      <td>이재경</td>
      <td>7/1</td>
      <td>하루 종일</td>
      <td>연차</td>
      <td>개발부서</td>
      <td>직무</td>
      <td></td>
      <td>일정노트</td>
      <td>1시간</td>
      <td>8시간</td>
    </tr>
    <tr>
      <td>001</td>
      <td>이재경</td>
      <td>7/1</td>
      <td>하루 종일</td>
      <td>연차</td>
      <td>개발부서</td>
      <td>직무</td>
      <td></td>
      <td>일정노트</td>
      <td>1시간</td>
      <td>8시간</td>
    </tr>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>