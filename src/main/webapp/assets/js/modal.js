function btnClose() {
	var modal = document.querySelector('.modal');
	// 팝업 닫기
	modal.style.display = "none";
}

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


$(function() {
	$('#datepicker')
		.datepicker(
			{
				dateFormat: 'yy-mm-dd' //달력 날짜 형태
				,
				showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,
				showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
				,
				changeYear: true //option값 년 선택 가능
				,
				changeMonth: true //option값  월 선택 가능                
				,
				showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				,
				buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
				,
				buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
				,
				buttonText: "선택" //버튼 호버 텍스트              
				,
				yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
				,
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
					'6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 텍스트
				,
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
				,
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 텍스트
				,
				dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일',
					'금요일', '토요일'] //달력의 요일 Tooltip
				,
				minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				,
				maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
			})
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