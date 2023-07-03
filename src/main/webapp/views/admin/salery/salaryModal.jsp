<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- CSS -->
  <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/assets/css/styles.css">
  
  <!-- Jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  <%--    <link rel="stylesheet" href="static/css/style.css">--%>
  <style type="text/css">
  	table tr td {
  		border: 1px solid black;
  	}
  </style>
  <title>근무일정모달창</title>
</head>
<body id="body-pd">

<script type="text/javascript">
	function getselect() {
		var select = document.getElementById('select');
		var option = select.options[select.selectedIndex];
		
		document.getElementById('name').text = option.text;
		document.getElementById('name').innerText = option.text;
	} 
</script>

<div>
	<h1>급여명세서</h1>
	직원 : <select name="select" id="select">
		<option value="lee">이재경</option>
		<option value="song">송기석</option>
		<option value="gun">권지연</option>
		<option value="seo">서지효</option>
	</select>
</div><hr>

<table>
	<tr>
		<td>성명</td>
		<td><div id="name" onChange="getselect()">이재경</div></td>
	</tr>
	<tr>
		<td>지급일</td>
		<td>2023.07.02</td>
	</tr>
</table><br>
<table>
	<tr>
		<td colspan="2">임금지급내역</td>
		<td colspan="2">공제내역</td>
	</tr>
	<tr>
		<td>임금항목</td>
		<td>지급금액(원)</td>
		<td>공제항목</td>
		<td>지급금액(원)</td>
	</tr>
	<tr>
		<td>기본금</td>
		<td>5,000,000</td>
		<td>소득세</td>
		<td>0</td>
	</tr>
	<tr>
		<td>상여금</td>
		<td>1,000,000</td>
		<td>국민연금</td>
		<td>0</td>
	</tr>
	<tr>
		<td>직책수당</td>
		<td>0</td>
		<td>건강보험</td>
		<td>0</td>
	</tr>
	<tr>
		<td>연차수당</td>
		<td>0</td>
		<td>고용보험</td>
		<td>0</td>
	</tr>
	<tr>
		<td>지급액 계</td>
		<td>6,000,000</td>
		<td>공제액 계</td>
		<td>0</td>
	</tr>
	<tr>
		<td>실지급액</td>
		<td colspan="3">6,000,000</td>
	</tr>
</table>
<hr><br>
<button type="button">닫기</button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>