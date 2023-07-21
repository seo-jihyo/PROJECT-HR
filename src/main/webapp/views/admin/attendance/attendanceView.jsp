<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>출퇴근기록</title>

<style type="text/css">

dialog {
	height:540px;
	width: 370px;
	left: 45%;

}

.diatitle {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

.attend-table {
	height: 400px;
}

.attend-table tr td {
	padding: 7px;
	font-size: 15px;
}

.atttext {
	border: 1px solid black;
	height: 30px;
	width: 150px;
}

#attend-area {
	border: 1px solid black;
}

.attend-table th {
	text-align: left;
}

.two {
	letter-spacing: 20px;
}

.three {
	letter-spacing: 5px;
}

.modaltable th {
	padding: 20px;
}
</style>

</head>
<body>
<script defer>

	$(document).on('blur', '.dp', function(){
		let datepicker1 = document.querySelector('#datepicker1');
		let datepicker2 = document.querySelector('#datepicker2');
		console.log(datepicker1.value);
		console.log(datepicker2.value);
		$.ajax({
			type:"post",
			data: {
				"datepicker1" : datepicker1.value,
				"datepicker2" : datepicker2.value,
			},
			url:"/searchByDateAtt.do",
			dataType:"json",
			success : sucFuncJson,
			error : errFunc
		});
		function sucFuncJson(data) {
			console.log(data);
		    $('#mainTable tbody').html(htmlStr(data));
			if (data) {
				if(data.result == true){
					alert("검색 성공");
				}
			} else {
				alert("검색 실패");
			}
		}
		function errFunc(e) {	
			console.log(e)
			alert("실패" + e.status)
		}
	})
	
	$(document).on('click','.searchbtn',function(){
		let searchType = document.querySelector(".searchtype");
		let searchWord = document.querySelector(".search");
		$.ajax({
			type: "post",
			data: {
				"searchType" : searchType.value,
				"searchWord" : searchWord.value,
			},
			url: "/searchTotalAtt.do",
			dataType: "json",
			success : sucFuncJson,
			error : errFunc
		})
		function sucFuncJson(data) {
			console.log(data);
		    $('#mainTable tbody').html(htmlStr(data));
			if (data) {
				if(data.result == true){
					alert("검색 성공");
				}
			} else {
				alert("검색 실패");
			}
		}
		function errFunc(e) {	
			console.log(e)
			alert("실패" + e.status)
		}
	})
	
	function htmlStr(data){

			let html='';
			data.forEach(value => {
                const goWork = moment(value.go_work, 'MMM DD, YYYY, h:mm:ss A').format('YYYY-MM-DD');
                const goTime = moment(value.go_work, 'MMM DD, YYYY, h:mm:ss A').format('HH:mm');
                
                const leaveTime = value.leave_work!=null? moment(value.leave_work, 'MMM DD, YYYY, h:mm:ss A').format('HH:mm'):" ";
                html += `
               <tr 
                    data-num="`+value.emp_num+`"
                    data-name="`+value.emp_name+`"
                    data-date="`+goWork+`"
                    data-go-time="`+goTime+`"
                    data-leave-time="`+leaveTime+`"
                    data-break="`+value.break_time+`"
                    data-total="`+value.work_time+`"
                    >


                    <td>`+value.emp_num+`</td>
                    <td>`+value.emp_name+`</td>
                    <td>`+goWork+`</td>
                    <td>`+goTime+`</td>
                    <td>`+leaveTime+`</td>
                    <td>`+value.break_time+`</td>
                    <td>`+value.work_time+`</td>
                </tr>
                `;
            })

            return html;
		}
</script>
	<%@include file="/views/include/header.jsp"%>
	
	<section id="body-pd" class="body-pd">

		<div class="main_title">
			<h2>출퇴근기록</h2>
			<br>
			<input type="text" class="dp" id="datepicker1"> -
       	 	<input type="text" class="dp" id="datepicker2">
			<nav class="plusinfo">
			<select class="searchtype searchs" name="searchType">
				<option value="total">전체</option>
				<option value="empNum">사원번호</option>
				<option value="empName">직원</option>
				<!-- <option>날짜</option>
				<option>근무일정</option>
				<option>근무시간</option>
				<option>총 시간</option>
				<option>출근시간</option>
				<option>퇴근시간</option> -->
			</select>
			
			<!-- 추가하기 -->
			<input type="text" class="search searchs">
			<input type="button" class="searchbtn" value="검 색">
			<input type="checkbox" id="popup" onclick="resetForm()"> 
			<label class="labelBtn" for="popup">+ 출퇴근기록 추가하기</label>
			<div class="modal">
				<div>
					<label for="popup">X</label>
					<h1>출퇴근기록 추가하기</h1>
					<hr>
					<form method="get" action="/cmtrecordok.do" id="frm">
						<table class="attend-table">
								<tr>
									<th class="three">직원명</th>
									<td><select class="atttext" id="selectBox" name="emp_num">
										<c:forEach var="emplist" items="${empList}">
											<option value="${emplist.emp_num}">${emplist.emp_name}</option>
										</c:forEach>
									</select></td>
								</tr>
								<tr>
									<th class="two">날짜</th>
									<td><input type="date" name="cmt_date" class="startTime atttext" /> 
								</tr>
								<tr>
									<th>출근시간</th>
									<td><input type="time" name="go_work" class="startTime atttext" onKeyup="inputTimeColon(this);" /> 
										</td>
								</tr>
								<tr>
									<th>퇴근시간</th>
									<td><input type="time" name="leave_work" class="endTime atttext" onKeyup="inputTimeColon(this);" />
									<input type="checkbox" name="duty" id="duty" value="" onchange="toggleEndTime(this.checked)">   현재 근무중</td>
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
		<table class="table sec-table table-hover my-table" id="mainTable">
			<thead>
				<tr>

					<th>사원번호</th>
					<th>직원</th>
					<th>날짜</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>휴게시간</th>
					<th>근무시간합계</th>
				</tr>
			</thead>
			<tbody>
			
			  <c:forEach var="CMTList" items="${list}">
			    <c:set var="go_work"><fmt:formatDate value="${CMTList.go_work}" pattern="yyyy-MM-dd HH:mm" /></c:set> 
        		<c:set var="leave_work"><fmt:formatDate value="${CMTList.leave_work}" pattern="HH:mm"  /></c:set>
				  <c:if test="${CMTList.emp_num == login.emp_num && CMTList.att_status == 1}">
					  <script>
						  localStorage.setItem('attendanceState', 1);
					  </script>
				  </c:if>
				<tr data-att-num="${CMTList.att_num}"
					data-num="${CMTList.emp_num}"
					data-name="${CMTList.emp_name}"
					data-date='<fmt:formatDate  value="${CMTList.go_work}" pattern="yyyy-MM-dd"/>'
					data-go-time='<fmt:formatDate  value="${CMTList.go_work}" pattern="HH:mm"/>'
					data-leave-time='<fmt:formatDate  value="${CMTList.leave_work}" pattern="HH:mm"/>'
					data-break="${CMTList.break_time}"
					data-total="${CMTList.work_time}" >

					<td>${CMTList.emp_num}</td>
					<td>${CMTList.emp_name}</td>
					<td><fmt:formatDate  value="${CMTList.go_work}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate  value="${CMTList.go_work}" pattern="HH:mm"/></td>
					<td><fmt:formatDate  value="${CMTList.leave_work}" pattern="HH:mm"/></td>
					
					<td><!-- 근무시간 7시간 초과 시 휴게시간 1, 8시간 미만일 때 휴게시간 0 -->
					<c:choose>
						<c:when test="${CMTList.work_time >= 8 }">
							${CMTList.break_time} 
						</c:when>
						<c:otherwise>
							${CMTList.break_time -1}
						</c:otherwise>
					</c:choose>
					</td>
					
					<td><!-- 근무시간 7시간 초과 시 - 1 (휴게시간) -->
					<c:choose>
						<c:when test="${CMTList.work_time >= 8}">
							${CMTList.work_time - 1}
						</c:when>
						<c:otherwise>
							${CMTList.work_time}
						</c:otherwise>
					</c:choose>
					</td>
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
	</section>
	
	<dialog class="modaltable">
    	<h2 class="diatitle">출퇴근 기록 수정하기</h2><hr>
			<form method="get" id="frm2">
				<table class="attend-table">
				</table>
					<hr>
					<div class="bottom-btn">
						<div class="right-btn">
							<button type="submit" id="updateBtn" class="custom-btn btn-10">수정하기</button>
							<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
            				<button type="button" class="dialogbtn custom-btn btn-10" onclick="dialogClose();">닫기</button>
						</div>
					</div>
			</form>
    </dialog>
<script src="/assets/js/main.js"></script>
<script type="text/javascript">
	updateRowsPerPage(17);

	const dialog = document.querySelector("dialog");
	$(document).on("click", ".table tbody tr", function () {
		dialog.showModal();
		console.log(this);
	});
	
	function dialogClose(){
		dialog.close();
	}
	function resetForm() {
		  $('#frm')[0].reset();
	}
/* 여기부터 */
     $(document).on("click", ".sec-table tbody tr", function () {
	     console.log(this);
	     $att_num = $(this).data("att-num")
	     $num = $(this).data("num") 
	     $namtte = $(this).data("name")
	     $date = $(this).data("date")
	     $go_time = $(this).data("go-time")
	     $leave_time = $(this).data("leave-time")


     let str = `
          	<tr class="rank-tr1">
            	<th class="three">직원명</th>
              	<td>
              	<input type="hidden" class="rankadd" name="att_num" value="`+$att_num+`">
              	<select class="atttext" id="selectBox" name="emp_num">
					<c:forEach var="emplist" items="${empList}">
						<option value="${emplist.emp_num}">${emplist.emp_name}</option>
					</c:forEach>
				</select></td>
             </tr>
             <tr class="rank-tr1">
                <th class="two">날짜</th>
                <td><input type="date" class="atttext" name="cmt_date" value="`+$date+`"></td>

             </tr>
             <tr class="rank-tr1">
                <th>출근시간</th>
                <td><input type="time" class="atttext" name="go_time" value="`+$go_time+`"></td>
             </tr>
             <tr class="rank-tr1">
                <th>퇴근시간</th>
                <td><input type="time" class="atttext" name="leave_time" value="`+$leave_time+`"></td>
             </tr>
          `;
     $('dialog table').html(str)
	 $("select[name='emp_num']").val($num).prop("selected", true);

 });
	const $form = $('#frm2');
	
	$(document).on('click', '#updateBtn', function () {
	    $form.attr('action', 'cmtrecordupdate.do')
	    $form.attr('method', 'post')
	    $form.submit()
	})
	$(document).on('click', '#deleteBtn', function () {
	    $form.attr('action', 'cmtrecorddelete.do')
	    $form.attr('method', 'post')
	    $form.submit()
	})
	
	/* 현재 근무중 체크시 퇴근시간 입력 불가 */
	 function toggleEndTime(checked) {
        const endTimeInput = document.querySelector(".endTime");
        endTimeInput.disabled = checked;
        if (checked) {
            endTimeInput.value = "";
        }
    }


</script>
<!-- js -->

<script type="text/javascript" src="/assets/js/modal.js"></script>
<script type="text/javascript" src="/assets/js/moment.js"></script>
</body>
</html>