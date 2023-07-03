<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/assets/css/styles.css">

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
/* body 스타일 */
html, body {
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>


<title>휴가관리모달창</title>
</head>
<body id="body-pd">
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '450px', // 달력 높이
			expandRows: true, //화면에 맞게 노이 재설정
			headerToolbar: { // 헤더에 표시할 툴바
		          right: 'prev,next'
		    },
			initialView: 'dayGridMonth',
	        editable: true, // 수정 가능?
	        selectable: true, // 달력 일자 드래그 설정가능
	        nowIndicator: true, // 현재 시간 마크
	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			locale: 'ko',
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
		     }
		    
		})
		calendar.render();
	})
</script>
	<h1>휴가관리하기</h1>
	<hr>

	<form method="get" action="/">
		<table>
			<tr>
				<td>직원</td>
				<td><select name="" id="">
						<option value="">이재경</option>
						<option value="">송기석</option>
						<option value="">권지연</option>
						<option value="">서지효</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- calendar 태그 -->
					<div id='calendar-container'>
						<div id='calendar'></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>휴가 유형</td>
				<td><select name="" id="">
						<option value="">선택안됨</option>
						<option value="">연차(8h, 1일)</option>
						<option value="">반차(4h, 0.5일)</option>
						<option value="">병가(8h, 1일)</option>
				</select></td>
			</tr>
			<tr>
				<td>사유</td>
				<td><textarea name="" id="" cols="30" rows="3">
      </textarea></td>
			</tr>
		</table>
	</form>
	<hr>
	<br>
	<button type="button">닫기</button>
	<button type="button">추가하기</button>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>