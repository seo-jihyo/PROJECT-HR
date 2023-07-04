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
    <link rel="stylesheet" href="/assets/css/modal.css">
</head>
<body>
<%@include file="/views/include/header.jsp" %>

<section id="body-pd" class="body-pd">
	
	<div class="main_title">
    <h1>직급 관리</h1>
    		<nav class="plusinfo">
			<select id="searchsel">
				<option value="none">선택없음</option>
				<option value="rank">직급명</option>
				<option value="memo">메모</option>
			</select> <input type="text" class="search">
    		<!-- 모달 창 -->
			<input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
				직급 추가하기</label>
			<div class="modal">
				<div>
					<div class="modal-header">
					<label for="popup">X</label>
					<h3>급여명세서</h3>
					<hr>
					</div>
					<div>
						직원 : <select name="select" id="select">
							<option value="lee">이재경</option>
							<option value="song">송기석</option>
							<option value="gun">권지연</option>
							<option value="seo">서지효</option>
						</select>
					</div>
					<hr>

					<table>
						<tr>
							<td>성명</td>
							<td><div id="name" onChange="getselect()">이재경</div></td>
						</tr>
						<tr>
							<td>지급일</td>
							<td>2023.07.02</td>
						</tr>
					</table>
					<br>
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
					<hr>
					<button type="button" class="btn_close" onclick="btnClose();">닫기</button>
				</div>
			<label for="popup"></label>
			</div>
		</div>
		</nav>
		<div class= "tab-scroll">
		<table class="sec-table table-hover">
			<thead class="thead">

				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>직급명</th>
					<th>메모</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td></td>
						<td></td>

					</tr>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td></td>
						<td></td>

					</tr>
				</tbody>
			</table>
			</div>





	
</section>
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>