<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

.vacation-table {
	margin: 0px auto;
	padding: 20px 20px;
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
}
.vacation-type {
	width: 150px;
    height: 30px;
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
		
			<h2>직급 관리</h2>
			<nav class="plusinfo">
			<select class="searchtype searchs">
				<option>선택없음</option>
				<option>직급명</option>
				<option>메모</option>
			</select>
			<input type="text" class="search searchs">
			
			<input type="checkbox" id="popup"><label class="labelBtn searchs" for="popup">+
				직급 관리하기</label>

			<div class="modal" style="display: hidden;">
			
				<div class="modal-content">
				
					<label for="popup">x</label>
					<h1>직급 추가하기</h1>
					<hr>

					<form method="get" action="/">
						<table class="vacation-table">
							<tr class="vacation-tr1">
								<td>직급명</td>
								<td><input type="text" class="rankadd"></td>
							</tr>

							<tr>
								<td>메모</td>
								<td><textarea name="" class="vacation-area" cols="70" rows="4">
      						</textarea></td>
							</tr>
						</table>
					</form>

					<hr>

					<div class="right-btn">
						<button type="button" class="btn_close" onclick="btnClose();">닫기</button>
					</div>
				</div>
				<label for="popup"></label>
			
			</div>
		</div>
</nav>


		
		<div class= "tab-scroll">

		<table class="sec-table table-hover">
			<thead class="thead">

				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>직급명</th>
					<th>메모</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td></td>
						<td></td>

					</tr>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td></td>
						<td></td>

					</tr>
				</tbody>
			</table>
			</div>





	
</section>
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>