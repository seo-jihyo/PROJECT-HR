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
  <title>근무일정모달창</title>
</head>
<body id="body-pd">
<h1>근무일정 추가하기(토, 7월 1일)</h1><hr>

<form method="get" action="/">
<table >
  <tr>
    <td>날짜</td>
    <td>캘린더api</td>
  </tr>
  <tr>
    <td>근무일정 유형</td>
    <td>
      <select name="workType" id="workType">
        <option value="">(없음)</option>
        <option value="">외근(간주근로 9h)</option>
        <option value="">재택근무(간주근로)</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>조직</td>
    <td>
      <select name="group" id="group">
        <option value="">조직없음</option>
        <option value="">전략부서</option>
        <option value="">개발부서</option>
        <option value="">인사부서</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>직무</td>
    <td>
      <select name="" id="">
        <option value="">직무없음</option>
        <option value="">인사업무</option>
        <option value="">개발업무</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>직원</td>
    <td>
      <select name="" id="">
        <option value="">직원없음</option>
        <option value="">이재경</option>
        <option value="">송기석</option>
        <option value="">권지연</option>
        <option value="">서지효</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>시간</td>
    <td>
      <input type="text" name="hour" id="hour">:
      <input type="text" name="minute" id="minute">~
      <input type="text" name="hour" id="hour">:
      <input type="text" name="minute" id="minute">
    </td>
  </tr>
  <tr>
    <td>일정노트</td>
    <td>
    	<textarea name="" id="" cols="30" rows="4">
    	</textarea>
    </td>
  </tr>
</table>
</form><hr><br>
<button type="button">닫기</button>
<button type="button">추가하기</button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>