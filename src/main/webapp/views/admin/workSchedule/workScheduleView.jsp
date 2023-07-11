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
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- CSS Files -->
<link href="../../assets/css/dashboard.css?v=1.1.2" rel="stylesheet" />
<title>근로정보</title>

<style type="text/css">
	.ws-table {
		height: 400px;
	}
	.ws-table tr td {
		padding: 7px;
		font-size: 15px;
	}
	#workType, #group, #job, #emp-name {
		border: 1px solid black;
		width: 100px;
		height: 30px;
	}
	#ws-area {
		border: 1px solid black;
	}
	.ws-date, .startTime, .endTime {
		border: 1px solid black;
		width: 100px;
		height: 30px;
	}
	.ws-title {
		display: flex;
		justify-content: flex-start;
		padding: 7px 300px 10px 5px;
	}
</style>

</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<section id="body-pd" class="body-pd">
		<div class="main_title">
			<h2>근무일정</h2>
			<input type="text" id="datepicker1"> -
       	 	<input type="text" id="datepicker2">
			<nav class="plusinfo">
			<select class="searchtype searchs">
				<option>전체</option>
				<option>사원번호</option>
				<option>직원</option>
				<option>날짜</option>
				<option>일정시간</option>
				<option>근무일정유형</option>
				<option>조직</option>
				<option>직무</option>
				<option>휴게시간</option>
				<option>총 시간</option>
			</select>
			<input type="text" class="search searchs">
			<input type="button" class="seachbtn" value="검 색">
			<input type="checkbox" id="popup" onclick="resetForm()"> <label class="labelBtn" for="popup">+
				근무일정 추가하기</label>
			<div class="modal">
				<div>
					<label for="popup">X</label>
					<div class="ws-title text-white mb-0">
						<h3 id="ws-add">근무일정 추가하기</h3>&nbsp;
						<h4 id="current_date"></h4>
          			</div>
					<hr>

					<form method="get" action="/workscheduleok.do" id="frm">
						<table class="ws-table">
							<tr class="modal-tr">
								<td >날짜</td>
								<td><input type="date" name="ws_date" class="ws-date">
								</td>
							</tr>
							<tr class="modal-tr">
								<td>근무일정 유형</td>
								<td><select name="workType" id="workType">
										<option value="none">(없음)</option>
										<option value="out_work">외근(간주근로 9h)</option>
										<option value="home_work">재택근무(간주근로)</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>조직</td>
								<td><select name="group" id="group">
										<option value="none_group">조직없음</option>
										<option value="strategy_dept">전략부서</option>
										<option value="development_dept">개발부서</option>
										<option value="hr_dept">인사부서</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>직급</td>
								<td><select name="job" id="job">
										<option value="none_job">직급없음</option>
										<option value="hr_job">사장</option>
										<option value="development_job">부장</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>직원</td>
								<td><select name="empName" id="emp-name">
										<option value="none_emp">직원없음</option>
										<option value="emp1">이재경</option>
										<option value="emp2">송기석</option>
										<option value="emp3">권지연</option>
										<option value="emp4">서지효</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>시간</td>
								<td><input type="time" name="startTime" class="startTime"
									onKeyup="inputTimeColon(this);" placeholder="출근시간"
									maxlength="5" />&nbsp;&nbsp;-&nbsp; <input type="time"
									name="endTime" class="endTime" onKeyup="inputTimeColon(this);"
									placeholder="퇴근시간" maxlength="5" /></td>
							</tr>
							<tr class="modal-tr">
								<td>일정노트</td>
								<td><textarea name="ws_area" id="ws-area" cols="65" rows="4"></textarea></td>
							</tr>
						</table>
					</form>

					<hr>
					<div class="bottom-btn">
						<div class="right-btn">
							<button class="custom-btn btn-10" form="frm">추가하기</button>
							<button type="button" class="btn_close custom-btn btn-10" onclick="btnClose();">닫기</button>
						</div>
					</div>
				</div>
				<label for="popup"></label>
			</div>
		</div>
</nav>
		<table class="table sec-table table-hover">
			<thead>
				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
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
					<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
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
					<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
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
<dialog>

    				<h1>근무일정 수정하기</h1>
					<hr>


					<form method="post">
						<table class="ws-table">
							<tr class="modal-tr">
								<td >날짜</td>
								<td><input type="date" name="ws_date" class="ws-date">
								</td>
							</tr>
							<tr class="modal-tr">
								<td>근무일정 유형</td>
								<td><select name="workType" id="workType">
										<option value="none">(없음)</option>
										<option value="out_work">외근(간주근로 9h)</option>
										<option value="home_work">재택근무(간주근로)</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>조직</td>
								<td><select name="group" id="group">
										<option value="none_group">조직없음</option>
										<option value="strategy_dept">전략부서</option>
										<option value="development_dept">개발부서</option>
										<option value="hr_dept">인사부서</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>직급</td>
								<td><select name="job" id="job">
										<option value="none_job">직급없음</option>
										<option value="hr_job">사장</option>
										<option value="development_job">부장</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>직원</td>
								<td><select name="empName" id="emp-name">
										<option value="none_emp">직원없음</option>
										<option value="emp1">이재경</option>
										<option value="emp2">송기석</option>
										<option value="emp3">권지연</option>
										<option value="emp4">서지효</option>
								</select></td>
							</tr>
							<tr class="modal-tr">
								<td>시간</td>
								<td><input type="time" name="startTime" class="startTime"
									onKeyup="inputTimeColon(this);" placeholder="출근시간"
									maxlength="5" />&nbsp;&nbsp;-&nbsp; <input type="time"
									name="endTime" class="endTime" onKeyup="inputTimeColon(this);"
									placeholder="퇴근시간" maxlength="5" /></td>
							</tr>
							<tr class="modal-tr">
								<td>일정노트</td>
								<td><textarea name="ws_area" id="ws-area" cols="65" rows="4">
    							</textarea></td>
							</tr>
						</table>

					<hr>
					<div class="bottom-btn">
						<div class="right-btn">
							<button type="button" class="custom-btn btn-10">수정하기</button>
							<button type="button" class="custom-btn btn-10">삭제하기</button>
            				<button  class="dialogbtn custom-btn btn-10" type="button"  onclick="dialogClose();">닫기</button>
						</div>
					</div>
				</form>


    </dialog>

<script type="text/javascript">

const dialog = document.querySelector("dialog");
$(document).on("click", ".table tbody tr", function () {
	dialog.showModal();
	console.log(this);
});

function dialogClose(){
	dialog.close();
}

$(document).on("click", ".table tbody tr", function () {
	$code = $(this).data("code")
	$name = $(this).data("name")
	$value = $(this).data("value")
	$remarks = $(this).data("remarks")

	let str = `
		<tr class="rank-tr1">
				<th>상위코드</td>
				<td><input type="text" class="rankadd" name="parent_code" value="`+$code+`"></td>
			</tr>
			<tr class="rank-tr1">
				<th>코드번호</td>
				<td><input type="text" class="rankadd" name="code_name" value="`+$name+`"></td>
			</tr>
			<tr class="rank-tr1">
				<th class="three">직급명</td>
				<td><input type="text" class="rankadd" name="code_value" value="`+$value+`"></td>
			</tr>

			<tr>
				<th class="two">메모</td>
				<td><textarea name="remarks" class="rank-area" cols="70" rows="4">`+$remarks+`</textarea></td>
			</tr>
		`;

	$('dialog table').html(str)
})
</script>
<script type="text/javascript">
const dialog = document.querySelector("dialog");
$(document).on("click", ".table tbody tr", function () {
	dialog.showModal();
	console.log(this);
});

function dialogClose(){
	dialog.close();
}
function resetForm() {
	  $('#frm')[0].reset();
}
</script>
<script>
    /* 오늘 날짜 출력 js */
    var date = new Date();
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var dayOfWeek = week[date.getDay()];

    document.getElementById("current_date").innerHTML = "(" + month + "월 " + day + "일 " + ", " + dayOfWeek + ")";
</script>
<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>