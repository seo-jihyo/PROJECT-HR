<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet"> -->
<!-- CSS -->
<link rel="stylesheet" href="/assets/css/modal.css">
<link rel="stylesheet" href="/assets/css/styles.css">
<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>급여</title>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">
			<h2>급여</h2>
			<input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
				급여명세서</label>
			<div class="modal">
				<div>
					<label for="popup">X</label>
					<h1>급여명세서</h1>
					<hr>

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
					<div class="right-btn">
						<button type="button" class="btn_close" onclick="btnClose();">닫기</button>
					</div>
				</div>
			<label for="popup"></label>
			</div>
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
	</section>
	<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>