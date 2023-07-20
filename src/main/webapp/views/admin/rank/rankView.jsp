<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="/assets/css/styles.css">

<link rel="stylesheet" href="/assets/css/modal.css">
<style type="text/css">
dialog {
	width: 500px;
	height: 410px;
}

.diatitle {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

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

.rankadd {
	height: 25px;
	border: 1px solid black;
}

.rank-area {
	width: 300px;
	height: 90px;
	border: 1px solid black;
}

.rank-table th {
	text-align: left;
}

.two {
	letter-spacing: 30px;
}

.three {
	letter-spacing: 8px;
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

				<input type="checkbox" id="popup" onclick="resetForm()"><label
					class="labelBtn searchs" for="popup">+ 직급 추가하기</label>

				<div class="modal" style="display: hidden;">

					<div class="modal-content">

						<label for="popup">x</label>
						<h1>직급 추가하기</h1>
						<hr>


						<form method="post" action="/rankok.do" id="frm">
							<table class="rank-table">
								<tr class="rank-tr1" hidden>
									<th>상위코드</th>
									<td><input type="text" class="rankadd" name="parent_code"
										value="R001"></td>
								</tr>
								<tr class="rank-tr1" hidden>
									<th>코드번호</th>
									<td><input type="text" class="rankadd" name="code_name"
										value="R001"></td>
								</tr>
								<tr class="rank-tr1">
									<th class="three">직급명</th>
									<td><input type="text" class="rankadd" name="code_value"></td>
								</tr>
								<tr>
									<th class="two">메모</th>
									<td><textarea name="remarks" class="rank-area" cols="70"
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


		<div class="tab-scroll">

			<table class="sec-table table-hover table my-table">
				<thead class="thead">

					<tr>

						<th>상위코드</th>
						<th>코드번호</th>
						<th>직급명</th>
						<th>메모</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rankList" items="${list}">
						<tr class="asd" data-code="${rankList.parent_code}"
							data-name="${rankList.code_name}"
							data-value="${rankList.code_value}"
							data-remarks="${rankList.remarks}">

							<td>${rankList.parent_code}</td>
							<td>${rankList.code_name}</td>
							<td>${rankList.code_value}</td>
							<td>${rankList.remarks}</td>
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
		<div></div>


	</section>
	<dialog>

	<h2 class="diatitle">직급 변경하기</h2>
	<hr>

	<form method="get" id="frm2">
		<table class="rank-table">

		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="button" id="updateBtn" class="custom-btn btn-10">수정하기</button>
				<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="btn_close custom-btn btn-10"
					onclick="dialogClose();">닫기</button>
			</div>
		</div>


	</form>

	</dialog>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script type="text/javascript">
	updateRowsPerPage(18);
	
    const $form = $('#frm2');
    $(document).on('click', '#updateBtn', function () {
        $form.attr('action', '/rankupdate.do')
        $form.attr('method', 'post')
        $form.submit()
    })
    $(document).on('click', '#deleteBtn', function () {
        $form.attr('action', '/rankdelete.do')
        $form.attr('method', 'post')
        $form.submit()
    })

    const dialog = document.querySelector("dialog");
    $(document).on("click", ".table tbody tr", function () {
        dialog.showModal();
        console.log(this);
    });

    function dialogClose() {
        dialog.close();
    }

    $(document).on("click", ".table tbody tr", function () {
        $code = $(this).data("code")
        $name = $(this).data("name")
        $value = $(this).data("value")
        $remarks = $(this).data("remarks")

        let str = `
		<tr class="rank-tr1">
				<th>상위코드</td>
				<td><input type="text" class="rankadd" name="parent_code" value="` + $code + `" readonly></td>
			</tr>
			<tr class="rank-tr1">
				<th>코드번호</td>
				<td><input type="text" class="rankadd" name="code_name" value="` + $name + `" readonly></td>
			</tr>
			<tr class="rank-tr1">
				<th class="three">직급명</td>
				<td><input type="text" class="rankadd" name="code_value" value="` + $value + `"></td>
			</tr>

			<tr>
				<th class="two">메모</td>
				<td><textarea name="remarks" class="rank-area" cols="70" rows="4">` + $remarks + `</textarea></td>
			</tr>
		`;

        $('dialog table').html(str)
    })

    function resetForm() {
        $('#frm')[0].reset();
    }
</script>
</body>
</html>