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
  <title>출퇴근기록</title>
</head>
<body id="body-pd">
<%@include file="/views/include/header.jsp" %>

<div class="main">

  <div class="main_title">
    <h2>출퇴근기록</h2>
    <button><a href="/views/admin/attendance/attendanceModal.jsp">+ 출퇴근기록 추가하기</a></button>
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
      <th><input type="text" placeholder="검색.."></th>
      <th><input type="text" placeholder="검색.."></th>
    </tr>
    <tr>
      <th>사원번호</th>
      <th>직원</th>
      <th>날짜</th>
      <th>근무시간</th>
      <th>근무일정</th>
      <th>조직</th>
      <th>직무</th>
      <th>출근 장소</th>
      <th>퇴근 장소</th>
      <th>근무노트</th>
      <th>휴게시간</th>
      <th>총 시간</th>
      <th>근무일정 오차범위</th>
      <th>출근시간 오차범위</th>
      <th>퇴근시간 오차범위</th>
      <th>급여</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>001</td>
      <td>이재경</td>
      <td>7/1</td>
      <td>09:00 - 18:00</td>
      <td>무일정근무</td>
      <td>조직없음</td>
      <td>직무없음</td>
      <td>서울지점</td>
      <td>서울지점</td>
      <td></td>
      <td>60분</td>
      <td>8시간</td>
      <td></td>
      <td></td>
      <td></td>
      <td>￦ 100,000</td>
    </tr>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>