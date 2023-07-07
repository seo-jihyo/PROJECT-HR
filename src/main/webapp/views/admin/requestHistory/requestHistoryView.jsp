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
<link rel="stylesheet" href="/assets/css/styles.css">
<link rel="stylesheet" href="/assets/css/modal.css">
<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <title>요청내역</title>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<section id="body-pd" class="body-pd">
		<div class="main_title">
			<h2>요청 내역</h2>
			<input type="text" id="datepicker1"> -
       	 	<input type="text" id="datepicker2">
			<nav class="plusinfo">
				<select class="searchs searchtype">
					<option>전체</option>
					<option>사원번호</option>
					<option>요청종류</option>
					<option>요청 보낸 사람</option>
					<option>본조직</option>
					<option>요청사항</option>
					<option>요청사유</option>
					<option>상태</option>
					<option>신청일자</option>
					<option>관리</option>
				</select>
				<input type="text" class="searchs search">
			</nav>
		</div>
		<table class="table sec-table table-hover">
			<thead>
				<tr>
					<th>사원번호</th>
					<th>요청 종류</th>
					<th>요청 보낸 사람</th>
					<th>본조직</th>
					<th>요청사항</th>
					<th>요청 사유</th>
					<th>상태</th>
					<th>승인권자 노트</th>
					<th>신청일자</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>001</td>
					<td>휴가요청</td>
					<td>이재경</td>
					<td>개발부서</td>
					<td>휴가승인부탁드려요</td>
					<td>기본전환</td>
					<td>승인대기</td>
					<td></td>
					<td>7/1</td>
					<td>
						<button type="button" class="approve">승인</button>&nbsp;
						<button type="button" class="reject">거절</button>
					</td>
				</tr>
			</tbody>
		</table>
	</section>
<dialog>
    
    				<h1>승인하기</h1>
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
       					<div class="bottom-btn">
						<div class="right-btn">
							<button class="custom-btn btn-10">수정하기</button>
							<button type="button" class="custom-btn btn-10">삭제하기</button>
            				<button class="custom-btn btn-10" onclick="window.dialog.close();">닫기</button>
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