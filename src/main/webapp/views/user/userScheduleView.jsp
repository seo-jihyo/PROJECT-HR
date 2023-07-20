<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>사용자 근무일정</title>

  <%--jquery--%>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="/assets/css/styles.css">
  <link rel="stylesheet" href="/assets/css/modal.css">
  
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <style>
   body{
   	padding: 0;
   }
   /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
    .fc-header-toolbar {
      padding-top: 1em;
      padding-left: 1em;
      padding-right: 1em;
      margin-bottom: 40px;
    }
    .calendar-container{
    margin-top: 30px;
    width: 90%;
    margin-right: auto;
    margin-left: auto;
    } 
    .fc-day-sun a {
  color: red;
  text-decoration: none;
	}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
    /* 모달 css */
	.schedule-table {
	margin: 0px auto;
	padding: 20px 20px;
	width: 100%;
	}
	.schedule-table tr {
	margin: 5px;`
	}
	.schedule-table tr td {
	padding: 7px;
	font-size: 15px;
	}
	.selectBox {
	width: 100px;
    height: 30px;
	}
	.schedule-type {
	width: 150px;
    height: 30px;
	}
	.btn {
	float: center;
	}
	.title{
	margin: auto;
	margin-top: 20px;
	width: 90%;
	}
	.plusBtn{
		float: right;
		margin-right: 6%;
	}
	.plus{
		width: 140px;
		font-size: 15px;
		height: 30px;
		border-radius: 8px;
		background-color:rgb(3, 4, 71);
		color: white;

	}
	.plus:hover{
		cursor: pointer;
		background-color:white;
		color: black;
	}
	.textbox{
		border: solid 1px;
		width: 200px;
		height: 30px;
	}
	.schedule-memo{
		width: 200px;
	}
	h2{
		padding: 10px;
	}
	dialog{
		width: 400px;
		height: 380px;
	}	
	.schedule-table th{
		text-align: left;
	}
	.four{
	letter-spacing: 14px;
	}
  </style>
</head>
<body>
<%@include file="/views/include/header_user.jsp" %>
<h1 class="title">근무일정</h1>
<nav class="plusBtn">
<button class="vacBtn plus">휴가 신청</button>
<button class="workBtn plus">근무일정 추가</button>
</nav>

  <!-- calendar 태그 --> 
  <div id='calendar-container' class='calendar-container'>
    <div id='calendar'></div>

  <dialog class="vacModal">
      
    	<h2>휴가 신청하기</h2>
		<hr>					
					<form method="get" id="frm">
						<table class="schedule-table">
							<tr>
								<th class="four">휴가유형</th>
								<td>
							<!-- 	<input type="text" name="vctn_type_num">  -->
										
							<select name="vctn_type_num" class="textbox" id="workType">
  								<c:forEach var="vctnlist" items="${vctnTypeList}">
    								<option value="${vctnlist.vctn_type_num}">${vctnlist.vctn_name}(${vctnlist.vctn_time}h, ${vctnlist.deduction_day}일)</option>
  								</c:forEach>
							</select>
							</tr>
							<tr class="vacation-tr1">
								<th>휴가 시작 날짜</th>
								<td><input type="datetime-local" class="textbox" name="vctn_start_date"></td>
							</tr>
							<tr class="vacation-tr1">
								<th>휴가 종료 날짜</th>
								<td><input type="datetime-local" class="textbox" name="vctn_end_date"></td>
							</tr>

							
							<tr hidden>
								<th class="four">휴가 종류</th>
								<td><input type="text" name="request_type" class="textbox" value="V">
							</tr>
							<tr>
								<th class="four">휴가사유</th>
								<td><textarea name="vctn_reason" class="schedule-memo" cols="70" rows="4"></textarea></td>
							</tr>
						</table>

					<hr>
						<div class="bottom-btn">
						<div class="right-btn">
							<button type="submit" id="VacInsertBtn" class="custom-btn btn-10">신청하기</button>
            				<button  class="dialogbtn custom-btn btn-10" type="button"  onclick="dialogClose();">닫기</button>
						</div>
					</div>
					</form>
    </dialog>
    
      <dialog class="workModal">
      
    	<h2>근무일정 추가하기</h2>
		<hr>					
					<form method="get" id="frm2">
							<table class="schedule-table">
								<tr class="modal-tr">
									<th>근무일정 유형</th>
									<td><select name="ws-type" class="textbox" id="workType">
											<c:forEach var="worklist" items="${workList}">
												<option value="${worklist.work_sch_type_num}">${worklist.work_name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="modal-tr">
								<tr class="modal-tr">
								<th>근무 시작 시간</th>
								<td><input type="datetime-local" class="textbox" name="startTime" /></td>
								</tr>
								<tr class="modal-tr">
								<th>근무 종료 시간</th>
								<td><input type="datetime-local" class="textbox" name="endTime" /></td>
								</tr>
								<tr class="modal-tr">
								<th class="four">일정노트</th>
									<td><textarea name="ws-area" class="schedule-memo" id="ws-area" cols="65" rows="4" style="resize: none;"></textarea></td>
								</tr>
								<tr hidden>
								<td><input type="text" name="request_type" value="W">
								</tr>
							</table>

					<hr>
						<div class="bottom-btn">
						<div class="right-btn">
							<button type="submit" id="WorkInsertBtn" class="custom-btn btn-10">신청하기</button>
            				<button  class="dialogbtn custom-btn btn-10" type="button"  onclick="dialogCloseWork();">닫기</button>
						</div>
					</div>
					</form>
    </dialog>
  <script>
    (function(){
      $(function(){
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
        // full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
          height: '720px', // calendar 높이 설정
          expandRows: true, // 화면에 맞게 높이 재설정
          slotMinTime: '08:00', // Day 캘린더에서 시작 시간
          slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
          // 해더에 표시할 툴바
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
          },
          initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
 //       initialDate: '2023-07-01', 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
          navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
 //       editable: true, // 수정 가능?
 //        selectable: true, // 달력 일자 드래그 설정가능
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: 'ko', // 한국어 설정
          eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
          },
          eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
          },
          eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
            console.log(obj);
          },
          select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
            var title = prompt('Event Title:');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            calendar.unselect()
          },
          // 이벤트
          events: [
        	  <c:forEach var="userlist" items="${userSchedule}">
        	  {
         		 color:'E9BFD1',
         		 textColor:'5D082D',
         		 title: '${userlist.work_name}',
                 start: '<fmt:formatDate value="${userlist.wsgowork}" pattern="yyyy-MM-dd HH:mm" />',
                 end: '<fmt:formatDate value="${userlist.wsleavework}" pattern="yyyy-MM-dd HH:mm" />',
         	 },
         	{
         		  color: 'D8F0A0',
         		  textColor: '385000',
         		  title: '${userlist.vctn_name}',
         		  start: '<fmt:formatDate value="${userlist.vctn_start_date}" pattern="yyyy-MM-dd HH:mm" />',
         		  end: '<fmt:formatDate value="${userlist.vctn_end_date}" pattern="yyyy-MM-dd HH:mm" />',
         		},
        	 
            {
              color: '',
              textColor: 'black',
              title: '출근',
              start: '<fmt:formatDate value="${userlist.go_work}" pattern="yyyy-MM-dd HH:mm" />',
            },
            {
                color: 'red',
                textColor: 'black',
                title: '퇴근',
                start: '<fmt:formatDate value="${userlist.leave_work}" pattern="yyyy-MM-dd HH:mm" />',
              },
            </c:forEach>
            
            
            
          ]
        });
         // 캘린더 랜더링
        calendar.render(); 
      });
    })();
    
    const dialog = document.querySelector(".vacModal");
    $(document).on("click", ".vacBtn", function () {
    	dialog.showModal();
    	console.log(this);
    });

    function dialogClose(){
    	dialog.close();
    }
    
    const $form = $('#frm');
    $(document).on('click','#VacInsertBtn',function (){
       $form.attr('action','/userScheduleInsertVac.do')
       $form.attr('method','post')
       $form.submit()
    })
    
    const dialogWork = document.querySelector(".workModal");
    $(document).on("click", ".workBtn", function () {
    	dialogWork.showModal();
    	console.log(this);
    });

    function dialogCloseWork(){
    	dialogWork.close();
    }
    
    const $forms = $('#frm2');
    $(document).on('click','#WorkInsertBtn',function (){
       $forms.attr('action','/userScheduleInsertWork.do')
       $forms.attr('method','post')
       $forms.submit()
    })
    
  </script>
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>