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
<link rel="stylesheet" href="/assets/css/modal.css">
<script type="text/javascript" src="/assets/js/modal.js"></script>
<title>출퇴근기록</title>
</head>
<body id="body-pd">
	<%@include file="/views/include/header.jsp"%>

	<div class="main">

		<div class="main_title">
			<h2>출퇴근기록</h2>
			<input type="checkbox" id="popup"> <label for="popup">+
				출퇴근기록 추가하기</label>
			<div class="modal" style="display: hidden;">
				<div>
					<label for="popup">X</label>
					<h3>출퇴근기록 추가하기</h3>
					<hr>

					<form method="get" action="/">
						<table>
							<tr>
								<td>날짜<br>
								<br></td>
								<td><input type="text" id="datepicker"></td>
							</tr>
							<tr>
								<td>직원<br>
								<br></td>
								<td><select name="employee" id="employee">
										<option value="">이재경</option>
										<option value="">송기석</option>
										<option value="">권지연</option>
										<option value="">서지효</option>
								</select></td>
							</tr>
							<tr>
								<td>근무일정<br>
								<br></td>
								<td><select name="work" id="work">
										<option value="">근무1</option>
										<option value="">근무2</option>
										<option value="">근무3</option>
								</select></td>
							</tr>
							<tr>
								<td>조직<br>
								<br></td>
								<td><select name="group" id="group">
										<option value="">조직없음</option>
										<option value="">인사부서</option>
										<option value="">개발부서</option>
								</select></td>
							</tr>
							<tr>
								<td>직무<br>
								<br></td>
								<td><select name="" id="">
										<option value="">직무없음</option>
										<option value="">인사업무</option>
										<option value="">개발업무</option>
								</select></td>
							</tr>
							<tr>
								<td>출근시간<br>
								<br></td>
								<td><input type="text" class="startTime"
									onKeyup="inputTimeColon(this);" placeholder="출근시간"
									maxlength="5" /></td>

							</tr>
							<tr>
								<td>퇴근시간<br>
								<br></td>
								<td><input type="text" class="endTime"
									onKeyup="inputTimeColon(this);" placeholder="퇴근시간"
									maxlength="5" /> <input type="checkbox" name="check" id="check"
									value="">현재 근무중</td>
							</tr>

							<tr>
								<td>근무노트<br>
								<br></td>
								<td><textarea name="" id="" cols="30" rows="4">
    	</textarea></td>
							</tr>
						</table>
					</form>
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
					<th>근무시간</th>
					<th>근무일정</th>
					<th>조직</th>
					<th>직무</th>
					<th>출근 장소</th>
					<th>퇴근 장소</th>
					<th>근무노트</th>
					<th>휴게시간</th>
					<th>총 시간</th>
					<th>근무일정 오차범위</th>
					<th>출근시간 오차범위</th>
					<th>퇴근시간 오차범위</th>
					<th>급여</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>001</td>
					<td>이재경</td>
					<td>7/1</td>
					<td>09:00 - 18:00</td>
					<td>무일정근무</td>
					<td>조직없음</td>
					<td>직무없음</td>
					<td>서울지점</td>
					<td>서울지점</td>
					<td></td>
					<td>60분</td>
					<td>8시간</td>
					<td></td>
					<td></td>
					<td></td>
					<td>￦ 100,000</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>