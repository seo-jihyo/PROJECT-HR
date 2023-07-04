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
<link rel="stylesheet" href="/assets/css/styles.css">
<link rel="stylesheet" href="/assets/css/modal.css">
<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<title>근로정보</title>

</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<section id="body-pd" class="body-pd">
		<div class="main_title">
			<h2>근무일정</h2>
			<input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
				근무일정 추가하기</label>
			<div class="modal">
				<div>
					<label for="popup">X</label>
					<h1>근무일정 추가하기(토, 7월 1일)</h1>
					<hr>

					<form method="get" action="/">
						<table class="modal-table">
							<tr class="modal-tr">
								<td >날짜</td>
								<td><input type="date" name="날짜"> <!-- <input type="text" id="datepicker"> -->
								</td>
							</tr>
							<tr class="modal-tr">
								<td>근무일정 유형</td>
								<td><select name="workType" id="workType">
										<option value="">(없음)</option>
										<option value="">외근(간주근로 9h)</option>
										<option value="">재택근무(간주근로)</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>조직</td>
								<td><select name="group" id="group">
										<option value="">조직없음</option>
										<option value="">전략부서</option>
										<option value="">개발부서</option>
										<option value="">인사부서</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>직무</td>
								<td><select name="" id="">
										<option value="">직무없음</option>
										<option value="">인사업무</option>
										<option value="">개발업무</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>직원</td>
								<td><select name="" id="">
										<option value="">직원없음</option>
										<option value="">이재경</option>
										<option value="">송기석</option>
										<option value="">권지연</option>
										<option value="">서지효</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>시간</td>
								<td><input type="text" class="startTime"
									onKeyup="inputTimeColon(this);" placeholder="출근시간"
									maxlength="5" />&nbsp;&nbsp;-&nbsp; <input type="text"
									class="endTime" onKeyup="inputTimeColon(this);"
									placeholder="퇴근시간" maxlength="5" /></td>
							</tr>
							<tr class="modal-tr">
								<td>일정노트</td>
								<td><textarea name="" id="" cols="30" rows="4">
    							</textarea></td>
							</tr>
						</table>
					</form>

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
				</tr>
				<tr>
					<th>사원번호</th>
					<th>직원</th>
					<th>날짜</th>
					<th>일정시간</th>
					<th>근무일정 유형</th>
					<th>조직</th>
					<th>직무</th>
					<th>근무일정 템플릿</th>
					<th>일정노트</th>
					<th>휴게시간</th>
					<th>총 시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>001</td>
					<td>이재경</td>
					<td>7/1</td>
					<td>하루 종일</td>
					<td>연차</td>
					<td>개발부서</td>
					<td>직무</td>
					<td></td>
					<td>일정노트</td>
					<td>1시간</td>
					<td>8시간</td>
				</tr>
				<tr>
					<td>001</td>
					<td>이재경</td>
					<td>7/1</td>
					<td>하루 종일</td>
					<td>연차</td>
					<td>개발부서</td>
					<td>직무</td>
					<td></td>
					<td>일정노트</td>
					<td>1시간</td>
					<td>8시간</td>
				</tr>
			</tbody>
		</table>

	</section>

<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>