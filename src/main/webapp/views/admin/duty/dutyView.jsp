<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name='viewport'
	content='width=device-width, initial-scale=1, shrink-to-fit=no'>
<!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

    <link rel="stylesheet" href="/assets/css/styles.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

<title>Document</title>

</head>
<body>

	<header>
		<h1 class="company">MAIN</h1>

		<nav class="top-nav">

			<div class="container">
				<input type="checkbox" class="toggle" id="rounded"> <label
					for="rounded" data-checked="근 무 중" class="rounded"
					data-unchecked="  퇴   근" />
			</div>

			<img class="reload" src="/assets/images/reload.png"
				onClick="window.location.reload()" />
			<button class="mode-btn">관리자 모드</button>
		</nav>
	</header>
	<div class="navbar_1" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav_brand">
					<i class='nav_toggle nav_icon menu-outline bx bx-menu'
						id="nav-toggle"></i> <a href="#" class="nav_logo">Menu</a>
				</div>

				<a class="nav_list"> <a href="#" class="nav_link active"> <i
						class='nav_icon bx bx-home'></i> <span class="nav_name">메인</span>

				</a>
				</a>
				<div href="#" class="nav_link collapse">
					<i class='nav_icon bx bx-calendar'></i> <span class="nav_name">근무일정</span>

					<i class='collapse_link bx bxs-chevron-down arrow'></i>

					<ul class="collapse_menu">
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
					</ul>
				</div>
				<div href="#" class="nav_link collapse">
					<i class='nav_icon bx bx-time'></i> <span class="nav_name">출퇴근
						기록</span> <i class='collapse_link bx bxs-chevron-down arrow'></i>

					<ul class="collapse_menu">
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
					</ul>
				</div>
				<div href="#" class="nav_link collapse">
					<i class='nav_icon bx bxs-plane-alt'></i></i> <span class="nav_name">휴가</span> <i class='collapse_link bx bxs-chevron-down arrow'></i>

					<ul class="collapse_menu">
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
					</ul>
				</div>
				<div href="#" class="nav_link collapse">
					<i class='nav_icon bx bxs-paper-plane'></i> <span class="nav_name">요청내역</span>

					<i class='collapse_link bx bxs-chevron-down arrow'></i>

					<ul class="collapse_menu">
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
					</ul>
				</div>
				<div href="#" class="nav_link collapse">
					<i class='nav_icon bx bx-money-withdraw'></i> <span
						class="nav_name">급여내역</span> <i
						class='collapse_link bx bxs-chevron-down arrow'></i>

					<ul class="collapse_menu">
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
					</ul>
				</div>
				<div href="#" class="nav_link collapse">
					<i class='nav_icon bx bxs-report'></i></i> <span class="nav_name">관리</span> <i class='collapse_link bx bxs-chevron-down arrow'></i>

					<ul class="collapse_menu">
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
						<a href="#" class="collapse_sublink">Deta</a>
					</ul>
				</div>
			</div>

			<a href="#" class="nav_link"> <i class='nav_icon bx bx-log-out'
				id="log_out"></i> <span class="nav_name">Log Out</span>
			</a>
		</nav>
	</div>

	<section id="body-pd">
		<h1>직무 추가하기</h1><br>
		<nav class="plusinfo">
            <select id="dutysearchsel">
                <option value="none">선택없음</option>
                <option value="dutyname">직무명</option>
                <option value="memo">메모</option>
            </select>
			<input type="text" class="dutysearch">
			<button>직무추가하기</button>
		</nav>
		<div class= "tab-scroll">
		<table class="table table-hover">
			<thead class="thead">

				<tr>
					 <th style="width:30px"><input type='checkbox' id="chkAll" onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>직무명</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>
				<tr>
 				 <th><input type='checkbox' name = 'chk[]' onclick="isAllCheck(this.name, 'chkAll');"></th>
					<td>1</td>
					<td>김연아</td>

				</tr>
				<tr>

  				<th><input type='checkbox' name = 'chk[]' onclick="isAllCheck(this.name, 'chkAll');"></th>
					<td>연차휴가</td>
					<td>(회계연도 기준)연차 휴가 발생 규칙</td>

				</tr>
			</tbody>
		</table>
		
	</div>



	</section>
    <script src="/assets/js/main.js"></script>
</body>
</html>