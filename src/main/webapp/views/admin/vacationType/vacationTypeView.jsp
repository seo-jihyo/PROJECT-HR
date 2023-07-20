<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
    
    <link rel="stylesheet" href="/assets/css/modal.css">
<style type="text/css">

dialog{
	width: 350px;
	height: 350px;
	top: 30%;
	left: 40%;
}
.diatitle{
	padding-top:20px;
	padding-bottom:20px;
	padding-left:20px;
}
.vactype-table {
	padding: 20px 20px;
	width: 100%;
}
.vactype-table tr {
	margin: 5px;
}
.vactype-table tr td {
	padding: 7px;
	font-size: 15px;
}
.vactypeadd{
	width: 150px;
	height: 25px; 
	border: 1px solid black;
}
.vactype-area{
	width: 300px;
	height: 90px;
	border: 1px solid black;
}
.vactype-table th{
		text-align: left;
}
.two{
	letter-spacing: 62px;
}
.three{
	letter-spacing: 23px;
}
.four{
	letter-spacing: 10px;
}
.modaltwo{
	letter-spacing: 58px;
	padding-right: 0px;
}
</style>

<title>부서관리</title>
<style type="text/css">
	
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">
		
			<h2>휴가 유형 관리</h2>
			<nav class="plusinfo">
			<input type="checkbox" id="popup" onclick="resetForm()"><label class="labelBtn searchs" for="popup">+
				휴가 유형 관리</label>

			<div class="modal" style="display: hidden;">
			
				<div class="modal-content">
				
					<label for="popup">x</label>
					<h1>휴가 유형 관리</h1>
					<hr>
					

					<form method="post" action="/vacationtypeok.do" id="frm">
						<table class="vactype-table">
							<tr class="vactype-tr1">
								<th class="three">휴가명</th>
								<td><input type="text" class="vactypeadd" name="vctn_name"></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="four">유급시간</th>
								<td><input type="number" class="vactypeadd" value="8" name="vctn_time"></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="four">차감일수</th>
								<td><input type="text" class="vactypeadd" name="deduction_day"></td>
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

		<div class="tab-scroll">
			<table class="sec-table table-hover table my-table">
				<thead class="thead">
					<tr>

						<th>휴가유형번호</th>
						<th>휴가명</th>
						<th>유급시간</th>
						<th>차감일수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="vacationTypeList" items="${list}"> 
					<tr class="asd"
						data-vctn-type-num="${vacationTypeList.vctn_type_num}"
						data-vctn-name="${vacationTypeList.vctn_name}"
						data-vctn-time="${vacationTypeList.vctn_time}"
						data-deduction-day="${vacationTypeList.deduction_day}"
					>

 						<td>${vacationTypeList.vctn_type_num}</td>
						<td>${vacationTypeList.vctn_name}</td>
						<td>${vacationTypeList.vctn_time}</td>
						<td>${vacationTypeList.deduction_day}</td>
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
		</div>
	</section>
	
	<!-- 수정 dialog -->
	<dialog>
	<h2 class="diatitle">휴가 변경하기</h2>
	<hr>


		<form method="get" id="frm2">
			<table class="vactype-table">

			</table>

		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" id="updateBtn" class="custom-btn btn-10">수정하기</button>
				<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
				<button type="button"  class="btn_close custom-btn btn-10" onclick="dialogClose();">닫기</button>
			</div>
		</div>
	</form>
	</dialog>
	
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script type="text/javascript">
	updateRowsPerPage(18);
	
	const dialog = document.querySelector("dialog");
	$(document).on("click", ".table tbody tr", function () {
		dialog.showModal();
		console.log(this);
	});

	function dialogClose(){
		dialog.close();
	}

	$(document).on("click", ".table tbody tr", function () {
 		$vctnTypeNum = $(this).data("vctn-type-num")
		$vctnName= $(this).data("vctn-name")
		$vctnTime= $(this).data("vctn-time")
		$deductionDay= $(this).data("deduction-day")

		let str = `
		<tr class="vactype-tr1">
			<th>휴가유형번호</th>
			<td><input type="text" class="vactypeadd" name="vctn_type_num" value="`+$vctnTypeNum+`" readonly></td>
		</tr>

		<tr class="vactype-tr1">
			<th class="three">휴가명</th>
			<td><input type="text" class="vactypeadd" name="vctn_name" value="`+$vctnName+`"></td>
		</tr>
		<tr class="vactype-tr1">
			<th class="four">유급시간</th>
			<td><input type="number" class="vactypeadd" name="vctn_time" value="`+$vctnTime+`"></td>
		</tr>
		<tr class="vactype-tr1">
			<th class="four">차감일수</th>
			<td><input type="text" class="vactypeadd" name="deduction_day" value="`+$deductionDay+`"></td>
		</tr> 
			`;

		$('dialog table').html(str)
	}) 

	function resetForm() {
		  $('#frm')[0].reset();
	}
	  const $form = $('#frm2');
	  $(document).on('click','#updateBtn',function (){
	     $form.attr('action','/vacationTypeUpdate.do')
	     $form.attr('method','post')
	     $form.submit()
	  })
	  $(document).on('click','#deleteBtn',function (){
	     $form.attr('action','/vacationTypeDelete.do')
	     $form.attr('method','post')
	     $form.submit()
	  })
	
</script>
</body>
</html>