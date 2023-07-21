<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 367px;
	height: 640px;
	left: 40%;
}

.diatitle {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

.work-table {
	padding: 20px 20px;
	width: 100%;
}

.work-table tr {
	margin: 5px;
}

.work-table tr td {
	padding: 7px;
	font-size: 15px;
}

.workadd {
	width: 150px;
	height: 25px;
	border: 1px solid black;
}

.work-area {
	width: 320px;
	height: 90px;
	border: 1px solid black;
	margin-left: 20px;
	margin-bottom: 20px;
}

.work-table th {
	text-align: left;
}

.modaltwo {
	letter-spacing: 58px;
	padding-right: 0px;
}

.four {
	letter-spacing: 10px;
}
.workMulti{
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	padding-left:20px;
	padding-right:20px;
}
.workp{
	padding: 10px 10px 20px 20px;
	font-weight: bold;
}
.workMulti div{
	margin: 10px;
}
.workMulti div label{
	cursor: pointer;
}
.workMulti div label input[type="checkbox"]{
	display: none;
}
.workMulti div label span{
	position: relative;
	display: inline-block;
	background: #FFAEAE;
	padding: 5px;
	border-radius: 30px;
	transition: 0.5s;
	user-select: none;
	overflow: hidden;
	color: white;
}
.workMulti div label input[type="checkbox"]:checked ~ span{
	background: F76666;
	color: black;
}
.two{
	letter-spacing: 7px;
}
.twomemo{
	letter-spacing: 40px;
}
.modaladd{
	margin-left: 70px;
}
.custom-btn{
	float: right;
    margin-right: 10px
}
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<section id="body-pd" class="body-pd">
		<div class="main_title">
			<h2>근로정보</h2>
			<nav class="plusinfo">
 			<input type="checkbox" id="popup" onclick="resetForm()"> 
 			<label class="labelBtn" for="popup">+ 근로정보 추가하기</label>
				<div class="modal" style="display: hidden;">

					<div class="modal-content">
						
						
						<label for="popup">X</label>
						<h1>근로정보 추가하기</h1>
						<hr>
						<form action="/addwork.do" id="frm">
								<table class="work-table">
								<tr>
								<th>근로정보명</th>
								<td><input type="text" id="workName" class="workadd" name="workName"></td>
								</tr>
								<tr>
								<th class="two">시급(&#8361;)</th>
								<td><input type="number" value="0" id="pay" class="workadd" name="pay"></td>
								</tr>
								</table>
								<P class="workp">소정근로요일</P>
								<div class="workMulti">
									<div>
									
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="월">
											<span>월</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="화">
											<span>화</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="수">
											<span>수</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="목">
											<span>목</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="금">
											<span>금</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="토">
											<span>토</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="일">
											<span>일</span>
										</label>
									</div>
								</div>

							
								<P class="workp">주휴요일</P>
								<div class="workMulti">
									<div>
									
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="월">
											<span>월</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="화">
											<span>화</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="수">
											<span>수</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="목">
											<span>목</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="금">
											<span>금</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="토">
											<span>토</span>
										</label>
									</div>
									<div>
										<label>
											<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="일">
											<span>일</span>
										</label>
									</div>
								</div>
								<p class="workp twomemo">메모</p>
									<textarea class="work-area" id="remarks" name="remarks"></textarea>

							<hr>
							<div class="bottom-btn">
								<div class="right-btn">
									<button class="custom-btn btn-10">추가하기</button>
									<button type="button" class="btn_close custom-btn btn-10"
										onclick="btnClose();">닫기</button>
								</div>
							</div>
						</form>
					</div>
					<label for="popup"></label>
				</div>
		</div>
		</nav>

		<table class="table sec-table table-hover my-table">
			<thead>
				<tr>
					<th>근로정보명</th>
					<th>시급</th>
					<th>소정근로요일</th>
					<th>주휴요일</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr data-work-num="${list.work_num}"
						data-work-name="${list.work_name}" data-pay="${list.pay}"
						data-fixed-work-days="${list.fixed_work_days}"
						data-holidays="${list.holidays}" data-remarks="${list.remarks}">
						<td>${list.work_name}</td>
						<td><fmt:formatNumber value="${list.pay}" type="currency" /></td>
						<td>${list.fixed_work_days}</td>
						<td>${list.holidays}</td>
						<td>${list.remarks}</td>
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
	<h2 class="diatitle">근로 정보 수정하기</h2>
	<hr>
	<form id="frm2">
	<div>

	</div>	
		<hr>
		<br>
		<button type="button" class="btn_close custom-btn btn-10"
			onclick="dialogClose();">닫기</button>
		<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
		<button type="submit" id="updateBtn" class="custom-btn btn-10">수정하기</button>
		
		
	
	</form>
	</dialog>
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/modal.js"></script>
	<script type="text/javascript">

	updateRowsPerPage(18);
	
    const dialog = document.querySelector("dialog");

    function dialogClose() {
        dialog.close();
    }

    function resetForm() {
        $('#frm')[0].reset();
    }

    const $form = $('#frm2');

    $(document).on('click', '#updateBtn', function () {
        $form.attr('action', 'workupdate.do')
        $form.attr('method', 'post')
        $form.submit()
    })
    $(document).on('click', '#deleteBtn', function () {
        $form.attr('action', 'workdelete.do')
        $form.attr('method', 'post')
        $form.submit()
    })

    $(document).on("click", ".sec-table tbody tr", function () {
        dialog.showModal();
        $workNum = $(this).data("work-num")
        $workName = $(this).data("work-name")
        $pay = $(this).data("pay")
        $fixedWorkDays = $(this).data("fixed-work-days")
        $weeklyHoliday = $(this).data("holidays")
        $remarks = $(this).data("remarks")

        let str = `
       

            <p  class="workp">근로정보명

                <input type="hidden" name="workNum" value="`+$workNum+`" >
                <input type="text" class="workadd modaladd" name="workName" value="` + $workName + `"></p>



                <p  class="workp twomemo">시급
				<input type="text" class="workadd" name="pay" value="` + $pay + `"></p>

           
				<p class="workp">소정근로요일</p>
				<div class="workMulti">
				<div>
				
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="월">
						<span>월</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="화">
						<span>화</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="수">
						<span>수</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="목">
						<span>목</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="금">
						<span>금</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="토">
						<span>토</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="fixedWorkingDay" id="fixedWorkingDay" value="일">
						<span>일</span>
					</label>
				</div>
			</div>

		
			<P class="workp">주휴요일</P>
			<div class="workMulti">
				<div>
				
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="월">
						<span>월</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="화">
						<span>화</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="수">
						<span>수</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="목">
						<span>목</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="금">
						<span>금</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="토">
						<span>토</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox" name="weekly_holiday" id="weekly_holiday" value="일">
						<span>일</span>
					</label>
				</div>
			</div>
			<p class="workp twomemo">메모</p>
			<textarea class="work-area" id="remarks" name="remarks">` + $remarks + `</textarea>

		`;

        $('dialog div').html(str)

    });
</script>
</body>
</html>