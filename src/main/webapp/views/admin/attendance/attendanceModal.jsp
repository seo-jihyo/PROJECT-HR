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

<!-- jQuery UI 라이브러리 로드 -->
<link rel='stylesheet'
	href='https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css'>
<script src='https://code.jquery.com/jquery-1.12.4.js'></script>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>

<title>출퇴근기록모달창</title>
<script type="text/javascript">
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
  	</script>
</head>
<body id="body-pd">
	<h3>출퇴근기록 추가하기</h3>

	<form method="get" action="/">
		<table>
			<tr>
				<td>날짜<br><br></td>
				<td>
					<input type="text" id="datepicker">
				</td>
			</tr>
			<tr>
				<td>직원<br><br></td>
				<td><select name="employee" id="employee">
						<option value="">이재경</option>
						<option value="">송기석</option>
						<option value="">권지연</option>
						<option value="">서지효</option>
				</select></td>
			</tr>
			<tr>
				<td>근무일정<br><br></td>
				<td><select name="work" id="work">
						<option value="">근무1</option>
						<option value="">근무2</option>
						<option value="">근무3</option>
				</select></td>
			</tr>
			<tr>
				<td>조직<br><br></td>
				<td><select name="group" id="group">
						<option value="">조직없음</option>
						<option value="">인사부서</option>
						<option value="">개발부서</option>
				</select></td>
			</tr>
			<tr>
				<td>직무<br><br></td>
				<td><select name="" id="">
						<option value="">직무없음</option>
						<option value="">인사업무</option>
						<option value="">개발업무</option>
				</select></td>
			</tr>
			<tr>
				<td>출근시간<br><br></td>
				<td>
					<input type="text" class="startTime" onKeyup="inputTimeColon(this);" placeholder="출근시간" maxlength="5"/>
				</td>
				
			</tr>
			<tr>
				<td>퇴근시간<br><br></td>
				<td> 
      				<input type="text" class="endTime" onKeyup="inputTimeColon(this);" placeholder="퇴근시간" maxlength="5"/>
					<input type="checkbox" name="check" id="check" value="">현재 근무중
				</td>
			</tr>

			<tr>
				<td>근무노트<br><br></td>
				<td><textarea name="" id="" cols="30" rows="4">
    	</textarea></td>
			</tr>
		</table>
	</form>
	<hr>
	<br>
	<button type="button">닫기</button>
	<button type="button">추가하기</button>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
</body>
</html>