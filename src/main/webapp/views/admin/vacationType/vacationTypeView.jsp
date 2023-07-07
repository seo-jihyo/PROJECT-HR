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
	width: 520px;
	height: 540px;

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
			<select class="searchtype searchs">
				<option>선택없음</option>
				<option>휴가유형번호</option>
				<option>휴가명</option>
				<option>부서</option>
				<option>직급</option>
				<option>유급시간</option>
				<option>차감일수</option>
				<option>휴가사유</option>
			</select>
			<input type="text" class="search searchs">
			<input type="button" class="seachbtn" value="검 색">
			<input type="checkbox" id="popup"><label class="labelBtn searchs" for="popup">+
				휴가 유형 관리</label>

			<div class="modal" style="display: hidden;">
			
				<div class="modal-content">
				
					<label for="popup">x</label>
					<h1>휴가 유형 관리</h1>
					<hr>
					

					<form method="" action="" id="">
						<table class="vactype-table">
							<tr class="vactype-tr1">
								<th>휴가유형번호</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="three">휴가명</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="two">부서</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="two">직급</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="four">유급시간</th>
								<td><input type="number" class="vactypeadd" value="8" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="four">차감일수</th>
								<td><input type="number" class="vactypeadd" name=""></td>
							</tr>
							<tr>
								<th class="four">휴가사유</th>
								<td><textarea name="" class="vactype-area" cols="70" rows="4"></textarea></td>

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


		
		<div class= "tab-scroll">

		<table class="sec-table table-hover table">
			<thead class="thead">

				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>휴가유형번호</th>
					<th>휴가명</th>
					<th>직급</th>
					<th>유급시간</th>
					<th>차감일수</th>
					<th>휴가사유</th>
				</tr>
				</thead>
				<tbody>
				<tr class="asd">
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

				</tbody>
			</table>

			</div>
	<div>
   
    
</div>



	
</section>
	<dialog>

	<h2 class="diatitle">부서 변경하기</h2>
	<hr>


	<form method="dialog">
	<table class="vactype-table">
							<tr class="vactype-tr1">
								<th>휴가유형번호</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="three">휴가명</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="modaltwo">부서</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="modaltwo">직급</th>
								<td><input type="text" class="vactypeadd" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="four">유급시간</th>
								<td><input type="number" class="vactypeadd" value="8" name=""></td>
							</tr>
							<tr class="vactype-tr1">
								<th class="four">차감일수</th>
								<td><input type="number" class="vactypeadd" name=""></td>
							</tr>
							<tr>
								<th class="four">휴가사유</th>
								<td><textarea name="" class="vactype-area" cols="70" rows="4"></textarea></td>

							</tr>
						</table>

		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" class="btn_close custom-btn btn-10">수정하기</button>
				<button type="button"  class="btn_close custom-btn btn-10">삭제하기</button>
				<button type="button"  class="btn_close custom-btn btn-10" onclick="dialogClose();">닫기</button>
			</div>
		</div>
	</form>
	</dialog>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script type="text/javascript">

	const dialog = document.querySelector("dialog");
	$(document).on("click", ".table tbody tr", function () {
		dialog.showModal();
		console.log(this);
	});

	function dialogClose(){
		dialog.close();
	}
	
</script>
</body>
</html>