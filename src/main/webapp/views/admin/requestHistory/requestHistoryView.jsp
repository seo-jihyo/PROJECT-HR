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
    <h2>요청 내역</h2>
  </div>
  <div>캘린더 API</div>
  <div>요청 필터</div>
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
    </tr>
    <tr>
      <th>사원번호</th>
      <th>요청 종류</th>
      <th>요청 보낸 사람</th>
      <th>본조직</th>
      <th>요청사항</th>
      <th>요청 사유</th>
      <th>상태</th>
      <th>승인권자 노트</th>
      <th>신청일자</th>
      <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>001</td>
      <td>휴가요청</td>
      <td>이재경</td>
      <td>개발부서</td>
      <td>휴가승인부탁드려요</td>
      <td>기본전환</td>
      <td>승인대기</td>
      <td></td>
      <td>7/1</td>
      <td>
      	<button type="button">승인</button>&nbsp;
      	<button type="button">거절</button>
      </td>
    </tr>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>