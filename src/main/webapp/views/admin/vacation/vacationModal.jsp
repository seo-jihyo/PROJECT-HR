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
  <title>휴가관리모달창</title>
</head>
<body id="body-pd">
<h1>휴가관리하기</h1><hr>

<form method="get" action="/">
<table>
  <tr>
    <td>직원</td>
    <td>
      <select name="" id="" disabled="disabled">
        <option value="">이재경</option>
        <option value="">송기석</option>
        <option value="">권지연</option>
        <option value="">서지효</option>
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="2">캘린더 API</td>
  </tr>
  <tr>
    <td>휴가 유형</td>
    <td>
      <select name="" id="">
      	<option value="">선택안됨</option>
        <option value="">연차(8h, 1일)</option>
        <option value="">반차(4h, 0.5일)</option>
        <option value="">병가(8h, 1일)</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>사유</td>
    <td>
      <textarea name="" id="" cols="30" rows="3">
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