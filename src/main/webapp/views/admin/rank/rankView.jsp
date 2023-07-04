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

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<body>
<%@include file="/views/include/header.jsp" %>

<section id="body-pd" class="body-pd body-section">
    <h1>부서 관리</h1>
		<nav class="plusinfo">
			<select id="searchsel">
				<option value="none">선택없음</option>
				<option value="duty">부서명</option>
				<option value="memo">메모</option>
			</select> <input type="text" class="search">
			<button>부서 추가하기</button>
		</nav>
		<div class= "tab-scroll">
		<table class="sec-table table-hover">
			<thead class="thead">

				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>부서명</th>
					<th>메모</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td>인사</td>
						<td></td>

					</tr>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td>개발</td>
						<td></td>

					</tr>
				</tbody>
			</table>
	</div>
</section>
<script src="/assets/js/main.js"></script>
</body>
</html>