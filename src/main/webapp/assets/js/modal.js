function btnClose() {
	//var modal = document.querySelector('.modal');
	document.getElementById('popup').checked = false;
	// 모달 닫기
	//modal.style.display = "none";
}

document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '350px', // 달력 높이
			expandRows: true, //화면에 맞게 높이 재설정
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

function inputTimeColon(time) {
	// replace 함수를 사용하여 콜론( : )을 공백으로 치환한다.
	var replaceTime = time.value.replace(/\:/g, "");

	// 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
	if (replaceTime.length >= 4 && replaceTime.length < 5) {
		var hours = replaceTime.substring(0, 2); // 선언한 변수 hours에 시간값을 담는다.
		var minute = replaceTime.substring(2, 4); // 선언한 변수 minute에 분을 담는다.

		// isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
		if (isFinite(hours + minute) == false) {
			alert("문자는 입력하실 수 없습니다.");
			time.value = "00:00";
			return false;
		}
		// 두 변수의 시간과 분을 합쳐 입력한 시간이 24시가 넘는지를 체크한다.
		if (hours + minute > 2400) {
			alert("시간은 24시를 넘길 수 없습니다.");
			time.value = "24:00";
			return false;
		}
		// 입력한 분의 값이 60분을 넘는지 체크한다.
		if (minute > 60) {
			alert("분은 60분을 넘길 수 없습니다.");
			time.value = hours + ":00";
			return false;
		}

		time.value = hours + ":" + minute;
	}
}