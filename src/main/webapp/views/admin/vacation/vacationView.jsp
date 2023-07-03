<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/assets/css/styles.css">
<%--    <link rel="stylesheet" href="static/css/style.css">--%>
<link href="/assets/css/modal.css">
<script type="text/javascript" src="/assets/js/modal.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
/* body 스타일 */
html, body {
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>
<title>휴가관리</title>
</head>
<body id="body-pd">
	<%@include file="/views/include/header.jsp"%>

	<div class="main">

		<div class="main_title">
			<h2>휴가 관리</h2>
			<input type="checkbox" id="popup"> <label for="popup">휴가관리하기</label>
			<div class="modal" style="display: hidden">
				<div>
					<label for="popup">X</label>
					<h3>휴가 관리하기</h3>
					<hr>

					<form method="get" action="/">
						<table>
							<tr>
								<td>직원</td>
								<td><select name="" id="">
										<option value="">이재경</option>
										<option value="">송기석</option>
										<option value="">권지연</option>
										<option value="">서지효</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- calendar 태그 -->
									<div id='calendar-container'>
										<div id='calendar'></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>휴가 유형</td>
								<td><select name="" id="">
										<option value="">선택안됨</option>
										<option value="">연차(8h, 1일)</option>
										<option value="">반차(4h, 0.5일)</option>
										<option value="">병가(8h, 1일)</option>
								</select></td>
							</tr>
							<tr>
								<td>사유</td>
								<td><textarea name="" id="" cols="30" rows="3">
      </textarea></td>
							</tr>
						</table>
					</form>
				</div>
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
				</tr>
				<tr>
					<th>사원번호</th>
					<th>직원</th>
					<th>휴가시간</th>
					<th>휴가그룹</th>
					<th>휴가 유형</th>
					<th>유급 시간</th>
					<th>차감일수</th>
					<th>사유</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>001</td>
					<td>이재경</td>
					<td>7월 3일 (월) 09:00 - 18:00</td>
					<td>연차휴가</td>
					<td>연차</td>
					<td>8h</td>
					<td>1일</td>
					<td>사유 주저리주저리</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>