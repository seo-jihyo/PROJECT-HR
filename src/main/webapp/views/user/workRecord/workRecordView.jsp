<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내 출퇴근기록</title>
    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/modal.css">
	<style type="text/css">
.tab-scroll{
	margin-left:20px;
}
.sec-table{
	margin-left:20px;
	width:98%;
}
h2{
	margin-top: 30px;
}
.workdate{
	margin-top: 20px;
	display: inline-block;
	width: 150px;
	height: 30px;
	border: solid 1px black;
}
.side{
	margin-top: 20px;
	margin-right: 40px;
	display: inline-block;
	float:right;
}
.side select{
	width: 150px;
	height:	30px;
	border: solid 1px black;
}
.workrecbtn{
	color: white;
	background-color: rgb(4, 4, 80);
	width: 70px;
	height:	30px;
	border-radius: 8px;
	transition: all 0.4s;
	cursor: pointer;
	border: 1.5px solid rgb(4, 4, 80);
	font-size: 16px;
}
.workrecbtn:hover{
	background-color: white;
    color: black;
}
.worksearch{
	width: 200px;
	height:	30px;
	border: solid 1px black;
}
.diatitle{
	padding-bottom:20px;
	padding-left:20px;
}
.workrec-table{
	padding-bottom: 20px;
}
.workrec-area{
	width: 170px;
	height: 60px;
}
.workrec-table th{
	padding: 20px 20px;
	text-align: left;
}
.workrec-tr{
	height: 50px;
}
.two{
	letter-spacing: 30px;
}
.workmodal-table {
	padding: 20px 20px;
	width: 100%;
}
.workmodal-table tr {
	margin: 5px;
}
.workmodal-table tr td {
	padding: 7px;
	font-size: 15px;
}
.workadd{
	height: 30px;
	width: 150px;
	border: 1px solid black;
}
.work-area{
	width:450px;
	height: 100px;
	border: 1px solid black;
}
.workrec-area{
	border: 1px solid black;
}
.twomodal{
	letter-spacing: 30px;
	padding: 0px;
}
.workmodal-table th{
	text-align: left;
}
.bottom-btn{
	margin-top:10px;
}
.dialogsub{
	backgroud:black;
	color: red;
}
</style>
</head>
<body>
	<%@include file="/views/include/header_user.jsp"%>
		<div class="tab-scroll">
		<h2>내 출퇴근기록</h2>
		<input type="date" class="workdate"> ~ <input type="date" class="workdate">
		<div class="side">
		<!-- 출퇴근기록 생성 요청 -->
		<input type="checkbox" id="popup"><label class="labelBtn searchs" for="popup">+ 출퇴근기록 생성 요청</label>
			<div class="modal" style="display: hidden;">
				<div class="modal-content">
					<label for="popup">x</label>
					<h1>출퇴근기록 생성 요청</h1>
					<hr>
					<form method="get" action="/workrecordInsertAtt.do" id="frm">

						<table class="workmodal-table">
							<tr class="rank-tr1">
								<th class="twomodal">날짜</th>
								<td><input type="date" class="workadd" name="cmt_date"></td>
							</tr>
							<tr class="work-tr1">
								<th>출근시간</th>
								<td><input type="time" class="workadd" name="go_work"></td>
								<th>퇴근시간</th>
								<td><input type="time" class="workadd" name="leave_work"></td>
							 	<td><input type="hidden" name="request_type" value="A"></td> 
							</tr>
							<tr>
								<td>
							</tr>
						</table>
					</form>
					<hr>
					<div class="bottom-btn">
						<div class="right-btn">
							<button class="custom-btn btn-10" form="frm">요청하기</button>
							<button type="button" class="btn_close custom-btn btn-10" onclick="btnClose();">닫기</button>
						</div>
					</div>
				</div>
				<label for="popup"></label>
			</div>
		</div>
		</div>
		<table class="sec-table table-hover table my-table">
			<thead class="thead">
				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll" onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>직원</th>
					<th>날짜</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>휴게시간</th>
					<th>근무시간합계</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="rcd" items="${rcdlist}">
   				<tr data-att-num="${rcd.att_num}"
			        data-name="${rcd.emp_name}"
			        data-date='<fmt:formatDate  value="${rcd.go_work}" pattern="yyyy-MM-dd"/>'
			        data-go-time='<fmt:formatDate  value="${rcd.go_work}" pattern="HH:mm"/>'
			        data-leave-time='<fmt:formatDate  value="${rcd.leave_work}" pattern="HH:mm"/>'
			        data-break="${rcd.break_time}"
			        data-total="${rcd.work_time}" >
			    <th><input type='checkbox' name='chk[]' onclick="isAllCheck(this.name, 'chkAll');"></th>
		        <td>${rcd.emp_name}</td>
		        <td><fmt:formatDate  value="${rcd.go_work}" pattern="yyyy-MM-dd"/></td>
		        <td><fmt:formatDate  value="${rcd.go_work}" pattern="HH:mm"/></td>
		        <td><fmt:formatDate  value="${rcd.leave_work}" pattern="HH:mm"/></td>
    			<td>
    			<!-- 근무시간 7시간 초과 시 휴게시간 1, 8시간 미만일 때 휴게시간 0 -->
					<c:choose>
						<c:when test="${rcd.work_time >= 8 }">
							${rcd.break_time} 
						</c:when>
						<c:otherwise>
							${rcd.break_time -1}
						</c:otherwise>
			    	</c:choose>
				</td>
					
				<td><!-- 근무시간 7시간 초과 시 - 1 (휴게시간) -->
					<c:choose>
						<c:when test="${rcd.work_time >= 8}">
							${rcd.work_time - 1}
						</c:when>
						<c:otherwise>
							${rcd.work_time}
						</c:otherwise>
					</c:choose>
				</td>
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
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>