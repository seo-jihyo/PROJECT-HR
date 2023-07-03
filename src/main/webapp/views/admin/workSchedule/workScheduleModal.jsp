<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- CSS -->
  <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/assets/css/styles.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <%-- <link rel="stylesheet" href="static/css/style.css"> --%>
  
  <!-- jQuery UI 라이브러리 로드 -->
  <link rel='stylesheet' href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>
  <script src='https://code.jquery.com/jquery-1.12.4.js'></script>
  <script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
  
  <script>
  	$(function(){
  		$('#datepicker').datepicker({
  			dateFormat: 'yy-mm-dd' //달력 날짜 형태
  	           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
  	           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
  	           ,changeYear: true //option값 년 선택 가능
  	           ,changeMonth: true //option값  월 선택 가능                
  	           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
  	           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
  	           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
  	           ,buttonText: "선택" //버튼 호버 텍스트              
  	           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
  	           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
  	           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
  	           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
  	           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
  	           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
  	           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
  		})
  	})
  	
  	 function inputTimeColon(time) {
        // replace 함수를 사용하여 콜론( : )을 공백으로 치환한다.
        var replaceTime = time.value.replace(/\:/g, "");

        // 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
        if(replaceTime.length >= 4 && replaceTime.length < 5) {
            var hours = replaceTime.substring(0, 2);      // 선언한 변수 hours에 시간값을 담는다.
            var minute = replaceTime.substring(2, 4);    // 선언한 변수 minute에 분을 담는다.
           
            // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
            if(isFinite(hours + minute) == false) {
                alert("문자는 입력하실 수 없습니다.");
                time.value = "00:00";
                return false;
            }
            // 두 변수의 시간과 분을 합쳐 입력한 시간이 24시가 넘는지를 체크한다.
            if(hours + minute > 2400) {
                alert("시간은 24시를 넘길 수 없습니다.");
                time.value = "24:00";
                return false;
            }
            // 입력한 분의 값이 60분을 넘는지 체크한다.
            if(minute > 60) {
                alert("분은 60분을 넘길 수 없습니다.");
                time.value = hours + ":00";
                return false;
            }

            time.value = hours + ":" + minute;
        }
  	}
  </script>
  
  <title>근무일정모달창</title>
</head>
<body id="body-pd">
<h3>근무일정 추가하기(토, 7월 1일)</h3><hr>

<form method="get" action="/">
<table >
  <tr>
    <td>날짜</td>
    <td>
    	<input type="text" id="datepicker">
    	<!-- <div id="calendar"></div> -->
    </td>
  </tr>
  <tr>
    <td>근무일정 유형</td>
    <td>
      <select name="workType" id="workType">
        <option value="">(없음)</option>
        <option value="">외근(간주근로 9h)</option>
        <option value="">재택근무(간주근로)</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>조직</td>
    <td>
      <select name="group" id="group">
        <option value="">조직없음</option>
        <option value="">전략부서</option>
        <option value="">개발부서</option>
        <option value="">인사부서</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>직무</td>
    <td>
      <select name="" id="">
        <option value="">직무없음</option>
        <option value="">인사업무</option>
        <option value="">개발업무</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>직원</td>
    <td>
      <select name="" id="">
        <option value="">직원없음</option>
        <option value="">이재경</option>
        <option value="">송기석</option>
        <option value="">권지연</option>
        <option value="">서지효</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>시간</td>
    <td>
      <input type="text" class="startTime" onKeyup="inputTimeColon(this);" placeholder="출근시간" maxlength="5"/>&nbsp;&nbsp;-&nbsp;
      <input type="text" class="endTime" onKeyup="inputTimeColon(this);" placeholder="퇴근시간" maxlength="5"/>
      <!-- <input type="text" name="hour" id="hour">:
      <input type="text" name="minute" id="minute">~
      <input type="text" name="hour" id="hour">:
      <input type="text" name="minute" id="minute"> -->
    </td>
  </tr>
  <tr>
    <td>일정노트</td>
    <td>
    	<textarea name="" id="" cols="30" rows="4">
    	</textarea>
    </td>
  </tr>
</table>
</form><hr><br>
<button type="button">닫기</button>
<button type="button">추가하기</button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>