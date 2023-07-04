<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet"> -->
<!-- CSS -->

<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<!-- fullcalendar 언어 CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<link rel="stylesheet" href="/assets/css/styles.css">
<link rel="stylesheet" href="/assets/css/modal.css">

<!-- <style>
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
</style> -->
<title>휴가관리</title>
<style type="text/css">
	
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">
			<h2>근무일정</h2>
			<input type="checkbox" id="popup"><label class="labelBtn" for="popup">+
				근무일정 추가하기</label>
			<div class="modal" style="display: hidden;">
				<div>
					<label for="popup">X</label>
					<h1>휴가관리하기</h1>
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

					<hr>

					<button type="button" class="btn_close" onclick="btnClose();">닫기</button>
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
	</section>
<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>