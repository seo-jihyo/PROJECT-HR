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

.rank-table {
	padding: 20px 20px;
	width: 100%;
}
.rank-table tr {
	margin: 5px;
}
.rank-table tr td {
	padding: 7px;
	font-size: 15px;
}
.rankadd{
	height: 25px;
	border: 1px solid black;
}
.rank-area{
	height: 200px;
	border: 1px solid black;
}
.seachbtn{

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
				<option>상위코드</option>
				<option>코드번호</option>
				<option>직급명</option>
				<option>메모</option>
			</select>
			<input type="text" class="search searchs">
			<input type="button" class="seachbtn" value="검 색">
			<input type="checkbox" id="popup"><label class="labelBtn searchs" for="popup">+
				직급 추가하기</label>

			<div class="modal" style="display: hidden;">
			
				<div class="modal-content">
				
					<label for="popup">x</label>
					<h1>직급 추가하기</h1>
					<hr>
					

					<form method="post" action="/rankok.do" id="frm">
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
					<th>상위코드</th>
					<th>코드번호</th>
					<th>직급명</th>
					<th>메모</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="rankList" items="${list}">
				<tr class="asd">
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td >${rankList.parent_code}</td>
						<td>${rankList.code_name}</td>
						<td>${rankList.code_value}</td>
						<td>${rankList.remarks}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			</div>
	<div>
   
    
</div>



	
</section>
	<dialog>

	<h3>직급 추가하기</h3>
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
		<button class="dialogbtn">수정</button>
		<button class="dialogbtn">삭제</button>
		<button class="dialogbtn" onclick="window.dialog.close();">닫기</button>
	</form>
	</dialog>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script type="text/javascript">
	
/* 	
	const dialog = document.querySelector("dialog");
	$(document).on("click", "section tbody tr", function() {
		dialog.showModal();
		console.log(this);
	});
	 */
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
</body>
</html>
