<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
 	.labelBtn {
	float: right;
	margin-right: 90px;
	} 
	.btn {
	float: center;
	}
  </style>
</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
<!-- 모달창 -->
<!-- <nav> -->
<h2>근무일정</h2>
<nav>
<input type="checkbox" id="popup"> <label class="labelBtn" for="popup"> 근무일정 추가하기</label>

	<div class="modal" style="display: hidden;">
		<div class="modal-content">
			<label for="popup">x</label>
				<h1>근무일정 추가하기</h1>
				<hr>

					<form method="get" action="/">
						<table class="schedule-table">
							<tr class="vacation-tr1">
								<td>날짜</td>
								<td><input type="date"></td>
							</tr>
							<tr>
								<td>근무일정 유형</td>
								<td><select name="" class="schedule-type">
								<option selected disabled hidden>-------------</option>
										<option value="">없음</option>
										<option value="">외근 (간주근로 9h)</option>
										<option value="">재택근무 (간주근로)</option>
									</select></td>
							</tr>
							<tr>
								<td>조직</td>
								<td><select name="" id="group">
										<option selected disabled hidden>-----</option>
										<option value="1">없음</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>직무</td>
								<td><select name="" id="">
										<option value="1">없음</option>
										<option selected disabled hidden>-----</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>직원</td>
								<td><select name="" id="group">										
										<option selected disabled hidden>-----</option>
										<option value="1">권지연</option>
										<option value="1">서지효</option>
										<option value="1">송기석</option>
										<option value="1">이재경</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>시간</td>
								<td>
								<input type="time" class="startTime" onKeyup="inputTimeColon(this);" placeholder="출근시간" maxlength="5" />
								&nbsp;&nbsp;-&nbsp; 
								<input type="time" class="endTime" onKeyup="inputTimeColon(this);" placeholder="퇴근시간" maxlength="5" />
								</td>
							</tr>
							<tr>
								<td>일정노트</td>
								<td><textarea name="" class="schedule-memo" cols="70" rows="4"></textarea></td>
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
	</nav>				
  <!-- calendar 태그 -->
  <div id='calendar-container' class='calendar-container'>
    <div id='calendar'></div>
  </div>
  
  <script>
    (function(){
      $(function(){
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
        // full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
          height: '700px', // calendar 높이 설정
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
          editable: true, // 수정 가능?
          selectable: true, // 달력 일자 드래그 설정가능
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
            {
              title: 'All Day Event',
              start: '2021-07-01',
            },
            {
      	      title: 'Long Event',
              start: '2021-07-07',
              end: '2021-07-10'
            }, 
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2021-07-09T16:00:00'
            },
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2021-07-16T16:00:00'
            },
            {
              title: 'Conference',
              start: '2021-07-11',
              end: '2021-07-13'
            },
            {
              title: 'Meeting',
              start: '2021-07-12T10:30:00',
              end: '2021-07-12T12:30:00'
            },
            {
              title: 'Lunch',
              start: '2021-07-12T12:00:00'
            },
            {
              title: 'Meeting',
              start: '2021-07-12T14:30:00'
            },
            {
              title: 'Happy Hour',
              start: '2021-07-12T17:30:00'
            },
            {
              title: 'Dinner',
              start: '2021-07-12T20:00:00'
            },
            {
              title: 'Birthday Party',
              start: '2021-07-13T07:00:00'
            },
            {
              title: 'Click for Google',
              url: 'http://google.com/', // 클릭시 해당 url로 이동
              start: '2021-07-28'
            }
          ]
        });
        // 캘린더 랜더링
        calendar.render();
      });
    })();
  </script>
</section>
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
</body>
</html>