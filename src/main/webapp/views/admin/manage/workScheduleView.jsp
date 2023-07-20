<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>

<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<%--    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="/assets/css/styles.css">
<link rel="stylesheet" href="/assets/css/modal.css">
<style type="text/css">
dialog {
	width: 340px;
	height: 310px;
	top: 30%;
	left: 42%;
}

.diatitle {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

.schedule-table {
	padding: 20px 20px;
	width: 100%;
}

.schedule-table tr {
	margin: 5px;
}

.schedule-table tr td {
	padding: 7px;
	font-size: 15px;
}

.scheduleadd {
	width: 150px;
	height: 25px;
	border: 1px solid black;
}

.schedule-area {
	width: 300px;
	height: 90px;
	border: 1px solid black;
}

.schedule-table th {
	text-align: left;
}

.modaltwo {
	letter-spacing: 58px;
	padding-right: 0px;
}
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<section id="body-pd" class="body-pd">
		<div class="main_title">
			<h2>근무일정 유형</h2>
			<nav class="plusinfo">
				<input type="checkbox" id="popup"> <label class="labelBtn"
					for="popup">+ 근무일정 유형 추가하기</label>
				<div class="modal" style="display: hidden;">

					<div class="modal-content">

						<label for="popup">X</label>
						<h1>근무일정 유형 추가하기</h1>
						<hr>
						
							<form method="post" action="/worktypeok.do" id="frm">
								<table class="schedule-table">
									<tr>
										<th>근무일정 유형명</th>
										<td><input type="hidden" id="work_sch_type_num"
											name="work_sch_type_num" value="101"> <input
											type="text" id="work_name" class="scheduleadd" name="work_name"></td>
									</tr>
									<tr>
										<th>근무 시작 시간</th>
										<td><input type="text" class="scheduleadd" id="work_start" name="work_start"></td>
									</tr>
									<tr>
										<th>근무 종료 시간</th>
										<td><input type="text" class="scheduleadd" id="work_end" name="work_end"></td>
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
		<table class="sec-table table-hover my-table">
			<thead>
				<tr>

					<th>근로일정 유형명</th>
					<th>근무 시작 시간</th>
					<th>근무 종료 시간</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="WSTList" items="${list}">
					<c:set var="work_start">
						<fmt:formatDate value="${WSTList.work_start}" pattern="HH:mm" />
					</c:set>
					<c:set var="work_end">
						<fmt:formatDate value="${WSTList.work_end}" pattern="HH:mm" />
					</c:set>
					<tr data-num="${WSTList.work_sch_type_num}"
						data-name="${WSTList.work_name}" data-start="${work_start}"
						data-end="${work_end}">

						<td>${WSTList.work_name}</td>
						<td><fmt:formatDate value="${WSTList.work_start}"
								pattern="HH:mm" /></td>
						<td><fmt:formatDate value="${WSTList.work_end}"
								pattern="HH:mm" /></td>
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

	<!-- 수정 dialog -->
	<dialog>
	<h2 class="diatitle">근무일정 유형</h2>
	<hr>
	<form method="get" id="frm2">
		<table class="schedule-table">

		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" id="updateBtn" class="custom-btn btn-10">수정하기</button>
				<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="btn_close custom-btn btn-10"
					onclick="dialogClose();">닫기</button>
			</div>
		</div>
	</form>
	</dialog>

	<script src="/assets/js/modal.js"></script>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript">
	updateRowsPerPage(18);
	
    const dialog = document.querySelector("dialog");

    function dialogClose() {
        dialog.close();
    }

    $(document).on("click", ".sec-table tbody tr", function () {
        dialog.showModal();
        console.log(this);
        $num = $(this).data("num")
        $name = $(this).data("name")
        $start = $(this).data("start")
        $end = $(this).data("end")

        let str = `
             <tr class="rank-tr1">

                <tr class="rank-tr1">
                   <th>근무일정유형</td>
                   <td><input type="hidden" value="` + $num + `" name="work_sch_type_num">
                       <input type="text" class="scheduleadd" name="name" value="` + $name + `"></td>
                </tr>
                <tr class="rank-tr1">
                   	<th>근무시작시간</td>
                  	<td><input type="text" class="scheduleadd" name="start" value="`+$start+`"></td>
                </tr>

                <tr class="rank-tr1">
                   	<th>근무종료시간</td>
			 		<td><input type="text" class="scheduleadd" name="end" value="`+$end+`"></td>
				</tr>
             </tr>
             `;
        $('dialog table').html(str)
    });

    function resetForm() {
        $('#frm')[0].reset();
    }

    const $form = $('#frm2');

    $(document).on('click', '#updateBtn', function () {
        $form.attr('action', 'worktypeupdate.do')
        $form.attr('method', 'post')
        $form.submit()
    })
    $(document).on('click', '#deleteBtn', function () {
        $form.attr('action', 'worktypedelete.do')
        $form.attr('method', 'post')
        $form.submit()
    })

</script>
</body>
</html>