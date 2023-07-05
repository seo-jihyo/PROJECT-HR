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
				<select class="searchtype searchs">
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
				<input type="text" class="search searchs">
			</nav>
		</div>
		<table class="sec-table table-hover">
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
<!-- js -->
<script src="/assets/js/main.js"></script>
</body>
</html>