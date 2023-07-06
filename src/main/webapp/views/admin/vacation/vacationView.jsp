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
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.vacation-table {
	margin: 0px auto;
	padding: 8px 0;
	width: 100%;
}
.vacation-table tr {
	margin: 5px;
}
.vacation-table tr td {
	padding: 7px;
	font-size: 15px;
}
.selectBox {
	width: 100px;
    height: 30px;
    border: 1px solid black;
}
.vacation-type {
	width: 150px;
    height: 30px;
    border: 1px solid black;
}
.vacation-area {
	border: 1px solid black;
}
</style>
<title>휴가관리</title>
<style type="text/css">
	
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">
			<h2>휴가</h2>
			<input type="text" id="datepicker1"> -
       	 	<input type="text" id="datepicker2">
			<nav class="plusinfo">
			<select class="searchtype searchs">
				<option>전체</option>
				<option>사원번호</option>
				<option>직원</option>
				<option>휴가시간</option>
				<option>휴가그룹</option>
				<option>휴가유형</option>
				<option>유급시간</option>
				<option>차감일수</option>
				<option>사유</option>
			</select>
			<input type="text" class="search searchs">
			<input type="checkbox" id="popup"><label class="labelBtn" for="popup">+
				휴가 관리하기</label>
			<div class="modal" style="display: hidden;">
				<div class="modal-content">
					<label for="popup">x</label>
					<h1>휴가관리하기</h1>
					<hr>

					<form method="get" action="/">
						<table class="vacation-table">
							<tr class="vacation-tr1">
								<td>직원</td>
								<td><select name="" class="selectBox">
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
								<td><select name="" class="vacation-type">
										<option value="">선택안됨</option>
										<option value="">연차(8h, 1일)</option>
										<option value="">반차(4h, 0.5일)</option>
										<option value="">병가(8h, 1일)</option>
								</select></td>
							</tr>
							<tr>
								<td>사유</td>
								<td><textarea name="" class="vacation-area" cols="70" rows="4">
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
					<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
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
<dialog>
    
    				<h1>휴가 수정하기</h1>
					<hr>
					

					<form method="get">
						<table class="vacation-table">
							<tr class="vacation-tr1">
								<td>직원</td>
								<td><select name="" class="selectBox">
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
								<td><select name="" class="vacation-type">
										<option value="">선택안됨</option>
										<option value="">연차(8h, 1일)</option>
										<option value="">반차(4h, 0.5일)</option>
										<option value="">병가(8h, 1일)</option>
								</select></td>
							</tr>
							<tr>
								<td>사유</td>
								<td><textarea name="" class="vacation-area" cols="70" rows="4"></textarea></td>
							</tr>
						</table>
						<div class="bottom-btn">
						<div class="right-btn">
							<button class="custom-btn btn-10">수정하기</button>
							<button type="button" class="custom-btn btn-10">삭제하기</button>
            				<button class="custom-btn btn-10" onclick="window.dialog.close();">닫기</button>
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

$(document).on("click",".table tbody tr",function (){
    $td = $(this).children('td')
    let str = '';
    $.each($td,(i,item)=>{
        str +='값='+ item.innerText +'<br>'
    })
    console.log(str)
})
</script>
<!-- js -->
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>