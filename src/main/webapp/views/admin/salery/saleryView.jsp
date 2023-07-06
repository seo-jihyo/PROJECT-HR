<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <title>급여</title>
  
<style type="text/css">
	.salery-emp {
		font-size: 15px;
		padding: 5px 0;
	}
	.salery-table {
		width: 500px;
	}
	.salery-table tr td {
		border: 1px solid black;
		padding: 7px;
		font-size: 15px;
	}
	.salery-table2 {
		width: 500px;
		margin-bottom: 10px;
	}
	.salery-table2 tr td {
		border: 1px solid black;
		padding: 7px;
		font-size: 15px;
	}
	#select {
		border: 1px solid black;
		margin-left: 20px;
		padding: 0 7px;
		width: 100px;
		height: 25px;
	}
</style>
  
</head>
<body>

	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">
			<h2>급여</h2>
			<input type="text" id="datepicker1"> -
       	 	<input type="text" id="datepicker2">
			<nav class="plusinfo">
			<select class="searchtype searchs">
				<option>전체</option>
				<option>사원번호</option>
				<option>귀속연월</option>
				<option>이름</option>
				<option>기본금</option>
				<option>상여금</option>
				<option>직책수당</option>
				<option>연차수당</option>
				<option>국민연금</option>
				<option>건강보험</option>
				<option>장기요양보험</option>
				<option>고용보험</option>
				<option>소득세</option>
				<option>지방소득세</option>
				<option>실수령액</option>
			</select>
			<input type="text" class="search searchs">
			
			<input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
				급여명세서</label>
			<div class="modal">
				<div>
					<label for="popup">X</label>
					<h1>급여명세서</h1>
					<hr>

					<div class="salery-emp">
						<p>직원 : <select name="select" id="select">
							<option value="lee">이재경</option>
							<option value="song">송기석</option>
							<option value="gun">권지연</option>
							<option value="seo">서지효</option>
						</select>
					</div>
					<hr>

					<table class="salery-table">
						<tr>
							<td>성명</td>
							<td><div id="name" onChange="getselect()">이재경</div></td>
						</tr>
						<tr>
							<td>지급일</td>
							<td>2023.07.02</td>
						</tr>
					</table>
					<br>
					<table class="salery-table2">
						<tr>
							<td colspan="2">임금지급내역</td>
							<td colspan="2">공제내역</td>
						</tr>
						<tr>
							<td>임금항목</td>
							<td>지급금액(원)</td>
							<td>공제항목</td>
							<td>지급금액(원)</td>
						</tr>
						<tr>
							<td>기본금</td>
							<td>5,000,000</td>
							<td>소득세</td>
							<td>0</td>
						</tr>
						<tr>
							<td>상여금</td>
							<td>1,000,000</td>
							<td>국민연금</td>
							<td>0</td>
						</tr>
						<tr>
							<td>직책수당</td>
							<td>0</td>
							<td>건강보험</td>
							<td>0</td>
						</tr>
						<tr>
							<td>연차수당</td>
							<td>0</td>
							<td>고용보험</td>
							<td>0</td>
						</tr>
						<tr>
							<td>지급액 계</td>
							<td>6,000,000</td>
							<td>공제액 계</td>
							<td>0</td>
						</tr>
						<tr>
							<td>실지급액</td>
							<td colspan="3">6,000,000</td>
						</tr>
					</table>
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
					<th>귀속연월</th>
					<th>이름</th>
					<th>기본금</th>
					<th>상여금</th>
					<th>직책수당(팀장이상)</th>
					<th>연차수당</th>
					<th>국민연금(4.5%)</th>
					<th>건강보험(3.99%)</th>
					<th>장기요양보험</th>
					<th>고용보험</th>
					<th>소득세</th>
					<th>지방소득세</th>
					<th>실수령액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
					<td>001</td>
					<td>7/1</td>
					<td>이재경</td>
					<td>하루 종일</td>
					<td>연차</td>
					<td>개발부서</td>
					<td>직무</td>
					<td></td>
					<td>일정노트</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</section>
<dialog>
    
    				<h1>급여 수정하기</h1>
					<hr>
					

					<form method="dialog">
						<table class="rank-table">
						
							<tr class="rank-tr1">
								<td>상위코드</td>
								<td><input type="text" class="rankadd" name="parent_code"></td>
							</tr>
							<tr class="rank-tr1">
								<td>코드번호</td>
								<td><input type="text" class="rankadd" name="code_name"></td>
							</tr>
							<tr class="rank-tr1">
								<td>직급명</td>
								<td><input type="text" class="rankadd" name="code_value"></td>
							</tr>

							<tr>
								<td>메모</td>
								<td><textarea name="remarks" class="rank-area" cols="70" rows="4"></textarea></td>
							</tr>
						</table>
						
					
       				<hr>
       		<button class="">수정</button>
       		<button>삭제</button>
            <button onclick="window.dialog.close();">닫기</button>
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