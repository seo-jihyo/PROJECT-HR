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
.tab-scroll{
	margin-left:20px;
}
.sec-table{
	margin-left:20px;
	width:98%;
}
h2{
	margin-top: 30px;
}

.workdate{
	margin-top: 20px;
	display: inline-block;
	width: 150px;
	height: 30px;
	border: solid 1px black;
}
.side{
	margin-top: 20px;
	margin-right: 40px;
	display: inline-block;
	float:right;
}
.side select{
	width: 150px;
	height:	30px;
	border: solid 1px black;
}
.workrecbtn{
	color: white;
	background-color:  rgb(4, 4, 80);
	width: 70px;
	height:	30px;
	border-radius: 8px;
	transition: all 0.4s;
	cursor: pointer;
	border: 1.5px solid rgb(4, 4, 80);
	font-size: 16px;
}
.workrecbtn:hover{
	background-color: white;
    color: black;
}
.worksearch{
	width: 200px;
	height:	30px;
	border: solid 1px black;
}

dialog{
	width: 500px;
	height: 555px;

}
.diatitle{
	padding-bottom:20px;
	padding-left:20px;
}
.workrec-table{
	padding-bottom: 20px;
}
.workrec-area{
	width: 170px;
	height: 60px;
	
}
.workrec-table th{
	padding: 20px 20px;
	text-align: left;
}
.workrec-tr{
	height: 50px;
}
.two{
	letter-spacing: 30px;
}


.workmodal-table {
	padding: 20px 20px;
	width: 100%;
}
.workmodal-table tr {
	margin: 5px;
}
.workmodal-table tr td {
	padding: 7px;
	font-size: 15px;
}
.workadd{
	height: 30px;
	width: 150px;
	border: 1px solid black;
}
.work-area{
	width:450px;
	height: 100px;
	border: 1px solid black;
}
.workrec-area{
	border: 1px solid black;
}
.twomodal{
	letter-spacing: 30px;
	padding: 0px;
}

.workmodal-table th{
		text-align: left;
}
.bottom-btn{
	margin-top:10px;
}
.dialogsub{
	backgroud:black;
	color: red;
}
</style>
<title>휴가관리</title>
<style type="text/css">
	
</style>
</head>
<body>
	<%@include file="/views/include/header_user.jsp"%>

		
		<div class="tab-scroll">
		<h2> 내 출퇴근기록</h2>
		<input type="date" class="workdate"> ~ <input type="date" class="workdate">
		<div class="side">
		<select>
			<option>선택없음</option>
			<option>날짜</option>
			<option>출근시간</option>
			<option>퇴근시간</option>
			<option>근무일정</option>
			<option>부서</option>
			<option>직급</option>
			<option>휴게시간</option>
			<option>총시간</option>
			<option>근무노트</option>
		</select>
		<input type="text" class="worksearch">
		<button class="workrecbtn">검색</button>
		<input type="checkbox" id="popup"><label class="labelBtn searchs" for="popup">+
				출퇴근 기록 생성 요청</label>

			<div class="modal" style="display: hidden;">
			
				<div class="modal-content">
				
					<label for="popup">x</label>
					<h1>출퇴근 기록 생성 요청</h1>
					<hr>

					<form method="get" action="/">
						<table class="workmodal-table">
							<tr class="rank-tr1">
								<th class="twomodal">날짜</th>
								<td><input type="date" class="workadd"></td>
							</tr>
								<tr class="work-tr1">
								<th>근무일정</th>
								<td><select class="workadd">
										<option></option>
										<option></option>
										<option></option>
									</select>
								</td>
							</tr>
								<tr class="work-tr1">
								<th class="twomodal">부서</th>
								<td><select class="workadd">
										<option></option>
										<option></option>
										<option></option>
									</select>
								</td>
								<th class="twomodal">직급</th>
								<td><select class="workadd">
										<option></option>
										<option></option>
										<option></option>
									</select>
								</td>								
							</tr>
							
							<tr class="work-tr1">
								<th>출근시간</th>
								<td><input type="time" class="workadd"></td>
								<th>퇴근시간</th>
								<td><input type="time" class="workadd"></td>
							</tr>
							<tr>
								<th>근무노트</th>
								<td colspan='3'><textarea name="" class="work-area" cols="70" rows="4">
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
		</div>
		<table class="sec-table table-hover table">
			<thead class="thead">

				<tr>
					<th style="width: 30px"><input type='checkbox' id="chkAll"
						onclick="allCheckboxes('chk[]', this.checked)"></th>
					<th>날짜</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>근무일정</th>
					<th>부서</th>
					<th>직급</th>
					<th>휴게시간</th>
					<th>총시간</th>
					<th>근무노트</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td></td>
						<td></td>
						<td></td>
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
			
	<dialog>

	<h2 class="diatitle">출퇴근 기록 생성 변경</h2>
	<hr>

	
	<form method="dialog">
		<table class="workrec-table">

			<tr class="workrec-tr">
				<th class="two">날짜</th>
				<td><input type="date" class="workadd" name=""></td>
			</tr>
			<tr class="workrec-tr">
				<th>출근시간</th>
				<td><input type="time" class="workadd" name=""></td>
			</tr>
			<tr class="workrec-tr">
				<th>퇴근시간</th>
				<td><input type="time" class="workadd" name=""></td>
			</tr>
			<tr class="workrec-tr">
				<th>근무일정</th>
					<td><select class="workadd">
						<option></option>
						<option></option>
						<option></option>
					</select>
					</td>
			</tr>
			<tr class="workrec-tr">
				<th>휴게시간</th>
				<td style="font-weight:bold;">1시간</td>
			</tr>

			<tr class="workrec-tr">
				<th>근무노트</th>
				<td><textarea name="" class="workrec-area" cols="70" rows="4"></textarea></td>
			</tr>
		</table>
		<hr>

		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" class="btn_close custom-btn btn-10">수정하기</button>
				<button type="submit" class="btn_close custom-btn btn-10">삭제하기</button>
				<button class="btn_close custom-btn btn-10" onclick="window.dialog.close();">닫기</button>
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