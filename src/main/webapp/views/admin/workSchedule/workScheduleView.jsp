<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<!-- datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

.asd .remarks {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

</head>
<body>
	<script defer>

	$(document).on('blur', '.dp', function(){
		let datepicker1 = document.querySelector('#datepicker1');
		let datepicker2 = document.querySelector('#datepicker2');
		console.log(datepicker1.value);
		console.log(datepicker2.value);
		$.ajax({
			type:"post",
			data: {
				"datepicker1" : datepicker1.value,
				"datepicker2" : datepicker2.value,
			},
			url:"/searchByDate.do",
			dataType:"json",
			success : sucFuncJson,
			error : errFunc
		});
		function sucFuncJson(data) {
			console.log(data);
		    $('#mainTable tbody').html(htmlStr(data));
			if (data) {
				if(data.result == true){
					alert("검색 성공");
				}
			} else {
				alert("검색 실패");
			}
		}
		function errFunc(e) {	
			console.log(e)
			alert("실패" + e.status)
		}
		
	})
	
	$(document).on('click','.searchbtn',function(){
		let searchType = document.querySelector(".searchtype");
		let searchWord = document.querySelector(".search");
		$.ajax({
			type: "post",
			data: {
				"searchType" : searchType.value,
				"searchWord" : searchWord.value,
			},
			url: "/searchTotal.do",
			dataType: "json",
			success : sucFuncJson,
			error : errFunc
		})
		function sucFuncJson(data) {
			console.log(data);
		    $('#mainTable tbody').html(htmlStr(data));
			if (data) {
				if(data.result == true){
					alert("검색 성공");
				}
			} else {
				alert("검색 실패");
			}
		}
		function errFunc(e) {	
			console.log(e)
			alert("실패" + e.status)
		}
	})
	
	function htmlStr(data){

			let html='';
			data.forEach(value => {
                const schedule = moment(value.schedule, 'MMM DD, YYYY, h:mm:ss A').format('YYYY-MM-DD');
                const goWork = moment(value.go_work, 'MMM DD, YYYY, h:mm:ss A').format('HH:mm');
                const leaveWork = moment(value.leave_work, 'MMM DD, YYYY, h:mm:ss A').format('HH:mm');

                html += `
               <tr 
                    data-work-sch-num="`+value.work_sch_num+`"
                    data-work-sch-type-num="`+value.work_sch_type_num+`"
                    data-emp-num="`+value.emp_num+`"
                    data-emp-name="`+value.emp_name+`"
                    data-schedule="`+schedule+`"
                    data-go-work="`+goWork+`"
                    data-leave-work="`+leaveWork+`"
                    data-work-name="`+value.work_name+`"
                    data-restTime="`+value.totalTime/4+`" data-dept="`+value.dept+`"
                    data-dept-code="`+value.dept_code+`" data-rank="`+value.rank+`"
                    data-rank-code="`+value.rank_code+`"
                    data-remarks="`+value.remarks+`"
                    data-totalTime="`+value.totalTime+`">

                    <th><input type='checkbox' name='chk[]'
                        onclick="isAllCheck(this.name, 'chkAll');"></th>
                    <td>`+value.emp_num+`</td>
                    <td>`+value.emp_name+`</td>
                    <td>`+schedule+`</td>
                    <td>`+goWork+`~`+leaveWork+`</td>
                    <td>`+value.work_name+`</td>
                    <td>`+value.totalTime/4+`시간</td>
                    <td>`+value.rank+`</td>
                    <td
                        style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">`+value.remarks+`</td>
                    <td>`+value.totalTime+`시간</td>
                </tr>
                `;
            })

            return html;
		}
	
</script>

	<%@include file="/views/include/header.jsp"%>
	<section id="body-pd" class="body-pd">
		<div class="main_title">
			<h2>근무일정</h2>
			<input type="text" class="dp" id="datepicker1" name="a"> - <input
				type="text" class="dp" id="datepicker2" name='b'>
			<!-- - > $(#datepicker1).val() -->
			<nav class="plusinfo">
				<select class="searchtype searchs" name="searchType">
					<option value="total">전체</option>
					<option value="empNum">사원번호</option>
					<option value="empName">직원</option>
					<option value="workType">근무일정유형</option>
					<option value="rank">직급</option>
				</select> <input type="text" class="search searchs"> <input
					type="button" class="searchbtn" value="검 색"> <input
					type="checkbox" id="popup" onclick="resetForm()"> <label
					class="labelBtn" for="popup">+ 근무일정 추가하기</label>
				<div class="modal">
					<div>
						<label for="popup">X</label>
						<div class="ws-title text-white mb-0">
							<h3 id="ws-add">근무일정 추가하기</h3>
							&nbsp;
							<h4 id="current_date"></h4>
						</div>
						<hr>

						<form method="get" action="/workscheduleok.do" id="frm">
							<table class="ws-table">
								<tr class="modal-tr">
									<td>날짜</td>
									<td><input type="date" name="ws-date" class="ws-date"></td>
								</tr>
								<tr class="modal-tr">
									<td>근무일정 유형</td>
									<td><select name="ws-type" id="workType">
											<c:forEach var="list" items="${tlist}">
												<option value="${list.work_sch_type_num}">${list.work_name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="modal-tr">
									<td>부서</td>
									<td><select name="ws-dept" id="group">
											<c:forEach var="list" items="${optDept}">
												<option value="${list.code_name}">${list.code_value}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="modal-tr">
									<td>직급</td>
									<td><select name="ws-rank" id="job">
											<c:forEach var="list" items="${optRank}">
												<option value="${list.code_name}">${list.code_value}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="modal-tr">
									<td>직원</td>
									<td><select name="emp-name" id="emp-name">
											<c:forEach var="list" items="${elist}">
												<option value="${list.emp_num}">${list.emp_name}</option>
											</c:forEach>
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
									<td><textarea name="ws-area" id="ws-area" cols="65"
											rows="4" style="resize: none;"></textarea></td>
								</tr>
							</table>
						</form>

						<hr>
						<div class="bottom-btn">
							<div class="right-btn">
								<button class="custom-btn btn-10" form="frm">추가하기</button>
								<button type="button" class="btn_close custom-btn btn-10"
									onclick="btnClose();">닫기</button>
							</div>
						</div>
					</div>
					<label for="popup"></label>
				</div>
		</div>
		</nav>
		<table class="table sec-table table-hover my-table" id="mainTable"
			style="table-layout: fixed;">
			<thead>
				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>사원번호</th>
					<th>직원</th>
					<th>날짜</th>
					<th>일정시간</th>
					<th>근무일정 유형</th>
					<th>휴게시간</th>
					<th>직급</th>
					<th>일정노트</th>
					<th>총 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="wsList" items="${list}">
					<tr class="asd" data-work-sch-num="${wsList.work_sch_num}"
						data-work-sch-type-num="${wsList.work_sch_type_num}"
						data-emp-num="${wsList.emp_num}"
						data-emp-name="${wsList.emp_name}"
						data-schedule='<fmt:formatDate value="${wsList.schedule}" pattern="yyyy-MM-dd" />'
						data-go-work='<fmt:formatDate value="${wsList.go_work}" pattern="HH:mm" />'
						data-leave-work='<fmt:formatDate value="${wsList.leave_work}" pattern="HH:mm" />'
						data-work-name="${wsList.work_name}"
						data-restTime="${wsList.totalTime/4}" data-dept="${wsList.dept}"
						data-dept-code="${wsList.dept_code}" data-rank="${wsList.rank}"
						data-rank-code="${wsList.rank_code}"
						data-remarks="${wsList.remarks}"
						data-totalTime="${wsList.totalTime}">

						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td>${wsList.emp_num}</td>
						<td>${wsList.emp_name}</td>
						<td><fmt:formatDate value="${wsList.schedule}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${wsList.go_work}" pattern="HH:mm" />
							~ <fmt:formatDate value="${wsList.leave_work}" pattern="HH:mm" /></td>
						<td>${wsList.work_name}</td>
						<td>${wsList.totalTime/4}시간</td>
						<td>${wsList.rank}</td>
						<td
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${wsList.remarks}</td>
						<td>${wsList.totalTime}시간</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="pagination">
			<i class='bx bxs-chevron-left'></i>
			<ol id="pagingNumbers">
			</ol>
			<i class='bx bxs-chevron-right'></i>		
		</div>
	</section>
	<dialog>

	<h1>근무일정 수정하기</h1>
	<hr>


	<form method="get" id="frm2">
		<table class="ws-table">

		</table>

		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="button" id="updateBtn" class="custom-btn btn-10">수정하기</button>
				<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="dialogbtn custom-btn btn-10"
					onclick="dialogClose();">닫기</button>
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
		$workScheduleNum = $(this).data("work-sch-num")
		$empNum = $(this).data("emp-num")
		$empName = $(this).data("emp-name")
		$schedule = $(this).data("schedule")
		$goWork = $(this).data("go-work")
		$leaveWork = $(this).data("leave-work")
		$workName = $(this).data("work-name")
		$restTime = $(this).data("restTime")
		$dept = $(this).data("dept")
		$deptCode = $(this).data("dept-code")
		$rank = $(this).data("rank")
		$rankCode = $(this).data("rank-code")
		$remarks = $(this).data("remarks")
		$workScheduleTypeNum = $(this).data("work-sch-type-num");
		let str = `
			<input type="hidden" name="ws-num" value="` + $workScheduleNum + `">
			<tr class="modal-tr">
				<td>날짜</td>
				<td><input type="date" name="ws-date" class="ws-date" value="` + $schedule + `"></td>
			</tr>
			
			<tr class="modal-tr">
				<td>근무일정 유형</td>
				<td>
					<select name="ws-type" id="workType">
					<c:forEach var="list" items="${tlist}">
						<option value="${list.work_sch_type_num}">${list.work_name}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr class="modal-tr">
				<td>부서</td>
				<td>
					<input type="hidden" name="ws-dept" id="group" value="`+$deptCode+`" readonly>
					`+$dept+`
				</td>
			</tr>
			<tr class="modal-tr">
				<td>직급</td>
				<td>
					<input type="hidden" name="ws-rank" id="job" value="`+$deptCode+`" readonly>
					`+$rank+`
				</td>
			</tr>
			<tr class="modal-tr">
				<td>직원</td>
				<td>
					<input type="hidden" name="emp-name" id="emp-name" value="`+$empNum+`" readonly>
					`+$empName+`
				</td>
			</tr>
			<tr class="modal-tr">
				<td>시간</td>
				<td>
					<input type="time" name="startTime" class="startTime" value="` + $goWork + `"
					onKeyup="inputTimeColon(this);" placeholder="출근시간" maxlength="5" />&nbsp;&nbsp;-&nbsp;
					<input type="time" name="endTime" class="endTime" value="` + $leaveWork + `"
					onKeyup="inputTimeColon(this);" placeholder="퇴근시간" maxlength="5" />
				</td>
			</tr>
			<tr class="modal-tr">
			<td>일정노트</td>
			<td><textarea name="ws-area" id="ws-area" cols="65" rows="4" style="resize: none;">` + $remarks + `</textarea></td>
			</tr>
		`;
	
		$('dialog table').html(str)
		/* $("select[name='ws-dept']").val($deptCode).prop("selected", true);
		$("select[name='ws-rank']").val($rankCode).prop("selected", true);
		$("#emp-name option[value='" + $empNum + "']").prop("selected", true); */
		$("select[name='ws-type']").val($workScheduleTypeNum).prop("selected", true);
	})
</script>

	<script type="text/javascript">

function resetForm() {
	  $('#frm')[0].reset();
} 
console.log("....");
const $form = $('#frm2');
$(document).on('click', '#updateBtn', function () {
	console.log("....");
    $form.attr('action', '/workscheduleupdate.do')
    $form.attr('method', 'post')
    $form.submit()
})
$(document).on('click', '#deleteBtn', function () {
    console.log("qweqweq");
	$form.attr('action', '/workscheduledelete.do')
    $form.attr('method', 'post')
    $form.submit()
})

function textLengthOverCut(txt, len, lastTxt) {
	if (len == "" || len == null) { // 기본값
	    len = 10;
	}
	if (lastTxt == "" || lastTxt == null) { // 기본값
	    lastTxt = "...";
	}
	if (txt.length > len) {
	    txt = txt.substr(0, len) + lastTxt;
	}
	return txt;
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
	<script type="text/javascript" src="/assets/js/moment.js"></script>
</body>
</html>