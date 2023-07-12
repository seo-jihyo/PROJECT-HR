<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>출퇴근기록</title>

<style type="text/css">
	.attend-table {
		height: 400px;
	}
	.attend-table tr td {
		padding: 7px;
		font-size: 15px;
	}
	.attend-date, #attend-emp, #attend-work, #attend-group, #attend-job, .startTime, .endTime {
		border: 1px solid black;
		height: 30px;
	}
	#attend-area {
		border: 1px solid black;
	}
</style>

</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">
			<h2>출퇴근기록</h2>
			<input type="text" id="datepicker1"> -
       	 	<input type="text" id="datepicker2">
			<nav class="plusinfo">
			<select class="searchtype searchs">
				<option>전체</option>
				<option>사원번호</option>
				<option>직원</option>
				<option>날짜</option>
				<option>근무일정</option>
				<option>근무시간</option>
				<option>총 시간</option>
				<option>출근시간</option>
				<option>퇴근시간</option>
			</select>
			<input type="text" class="search searchs">
			<input type="button" class="seachbtn" value="검 색">
			<input type="checkbox" id="popup" onclick="resetForm()"> <label class="labelBtn" for="popup">+
				출퇴근기록 추가하기</label>
			<div class="modal">
				<div>
					<label for="popup">X</label>
					<h1>출퇴근기록 추가하기</h1>
					<hr>

					<form method="get" action="/" id="frm">
						<table class="attend-table">
							<tr>
								<td>날짜
								<br></td>
								<td><input type="date" class="attend-date"></td>
							</tr>
							<tr>
								<td>직원
								<br></td>
								<td><select name="employee" id="attend-emp">
										<option value="">이재경</option>
										<option value="">송기석</option>
										<option value="">권지연</option>
										<option value="">서지효</option>
								</select></td>
							</tr>
							<tr>
								<td>근무일정
								<br></td>
								<td><select name="work" id="attend-work">
										<option value="">근무1</option>
										<option value="">근무2</option>
										<option value="">근무3</option>
								</select></td>
							</tr>
							<tr>
								<td>조직
								<br></td>
								<td><select name="group" id="attend-group">
										<option value="">조직없음</option>
										<option value="">인사부서</option>
										<option value="">개발부서</option>
								</select></td>
							</tr>
							<tr>
								<td>직무
								<br></td>
								<td><select name="" id="attend-job">
										<option value="">직무없음</option>
										<option value="">인사업무</option>
										<option value="">개발업무</option>
								</select></td>
							</tr>
							<tr>
								<td>출근시간
								<br></td>
								<td><input type="time" class="startTime"
									onKeyup="inputTimeColon(this);" placeholder="출근시간"
									maxlength="5" /></td>

							</tr>
							<tr>
								<td>퇴근시간
								<br></td>
								<td><input type="time" class="endTime"
									onKeyup="inputTimeColon(this);" placeholder="퇴근시간"
									maxlength="5" /> <input type="checkbox" name="check" id="check"
									value="">현재 근무중</td>
							</tr>

							<tr>
								<td>근무노트
								<br></td>
								<td><textarea name="" id="attend-area" cols="30" rows="4">
    	</textarea></td>
							</tr>
						</table>
					</form>
					<hr>
					<div class="bottom-btn">
						<div class="right-btn">
							<button class="custom-btn btn-10">추가하기</button>
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
					<th>출근시간</th>
					<th>퇴근시간</th>
					<!--<th>근무일정</th>
	 			<th>부서</th>
					<th>직급</th> -->
					<th>휴게시간</th>
					<th>근무시간합계</th>
				</tr>
			</thead>
			<tbody>
			
			
			
			  <c:forEach var="CMTList" items="${list}">
				<tr data-num="${CMTList.emp_num}"
					data-name="${CMTList.emp_name}"
					data-date="${CMTList.go_work}"
					data-go-time="<fmt:formatDate  value="${CMTList.go_work}" pattern="HH:mm"/>"
					data-leave-time="<fmt:formatDate  value="${CMTList.leave_work}" pattern="HH:mm"/>"
				<%-- 	data-status="${CMTList.att_status}" --%>
					data-break="${CMTList.break_time}"
					data-total="${CMTList.work_time}" >
					<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
					<td>${CMTList.emp_num}</td>
					<td>${CMTList.emp_name}</td>
					<td>${CMTList.go_work}</td>
					<td><fmt:formatDate  value="${CMTList.go_work}" pattern="HH:mm"/></td>
					<td><fmt:formatDate  value="${CMTList.leave_work}" pattern="HH:mm"/></td>
					<%-- <td>${CMTList.att_status}</td> --%>
					<td>${CMTList.break_time}</td>
					<td>${CMTList.work_time}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
<dialog>
    
    				<h1>출퇴근 기록 수정하기</h1>
					<hr>
					

					<form method="get">
						<table class="attend-table">
							<tr>
								<td>날짜
								<br></td>
								<td><input type="date" class="attend-date"></td>
							</tr>
							<tr>
								<td>직원
								<br></td>
								<td><select name="employee" id="attend-emp">
										<option value="">이재경</option>
										<option value="">송기석</option>
										<option value="">권지연</option>
										<option value="">서지효</option>
								</select></td>
							</tr>
							<tr>
								<td>근무일정
								<br></td>
								<td><select name="work" id="attend-work">
										<option value="">근무1</option>
										<option value="">근무2</option>
										<option value="">근무3</option>
								</select></td>
							</tr>
							<tr>
								<td>조직
								<br></td>
								<td><select name="group" id="attend-group">
										<option value="">조직없음</option>
										<option value="">인사부서</option>
										<option value="">개발부서</option>
								</select></td>
							</tr>
							<tr>
								<td>직무
								<br></td>
								<td><select name="" id="attend-job">
										<option value="">직무없음</option>
										<option value="">인사업무</option>
										<option value="">개발업무</option>
								</select></td>
							</tr>
							<tr>
								<td>출근시간
								<br></td>
								<td><input type="time" class="startTime"
									onKeyup="inputTimeColon(this);" placeholder="출근시간"
									maxlength="5" /></td>

							</tr>
							<tr>
								<td>퇴근시간
								<br></td>
								<td><input type="time" class="endTime"
									onKeyup="inputTimeColon(this);" placeholder="퇴근시간"
									maxlength="5" /> <input type="checkbox" name="check" id="check"
									value="">현재 근무중</td>
							</tr>

							<tr>
								<td>근무노트
								<br></td>
								<td><textarea name="" id="attend-area" cols="30" rows="4"></textarea></td>
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
function resetForm() {
	  $('#frm')[0].reset();
}
</script>
<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>