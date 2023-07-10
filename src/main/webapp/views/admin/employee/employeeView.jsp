<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="/assets/css/styles.css">

<link rel="stylesheet" href="/assets/css/modal.css">
<style type="text/css">

.profile {
	padding: 20px 20px;
	width: 100%;
}

.profile tr {
	margin: 5px;
}
.profile-text{
	border : 1px solid black;
	height: 25px;
}
.profile tr td {
	padding: 7px;
	font-size: 15px;
}

.two{
	letter-spacing: 30px;
	padding: 0px;
}
.three{
	letter-spacing: 8px;
}
.profile th{
	text-align: left;
}
.addrtext{	
	width:342px;
}
.profiledate{
	width:163px;
	height: 25px;
}
.profiletype{
	width:163px;
	height: 25px;
	border : 1px solid black;
}
.right{
	padding-left:11em;
}
.rights{
	padding-left:12.5em;
}

.empmemo{
	border : 1px solid black;
	width: 635px;
	height: 100px;
}
.emptext{
	border : 1px solid black;
	width: 160px;
	height: 70px;
}
.postbtn{
	width: 160px; 
	height: 25px;
	color: white;
	background-color: #116fab;
	border: 0px;
	cursor : pointer;

}
.custom{
	border : 1px solid black;
	height: 25px;
	width: 150px; 
}
.modal{
	width:100%;
}
</style>
<title>휴가관리</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>

	<section id="body-pd" class="body-pd">

		<div class="main_title">

			<h2>직원 관리</h2>
			<nav class="plusinfo">
			
				<select class="searchtype searchs">
					<option value="none">선택없음</option>
					<option value="groupname">사원번호</option>
					<option value="name">이름</option>
					<option value="hire_date">입사일</option>
					<option value="dept">부서</option>
					<option value="position">직위</option>
					<option value="duty">직책</option>
					<option value="rank">직급</option>
					<option value="worktype">근로정보명</option>
					<option value="pay">시급</option>
					<option value="memo">메모</option>
				</select> <input type="text" class="search searchs"> <input
					type="checkbox" id="popup" onclick="resetForm()"><label class="labelBtn searchs"
					for="popup">+ 직원 추가하기</label>
				
				<div class="modal" style="display: hidden;">

					<div class="modal-content">

						<label for="popup">x</label>
						<h1>직원 추가하기</h1>
						<hr>

						<form method="get" action="/" id="frm">
							<div class="tabs">
								<a data-tab="tab-1">기본정보</a> 
								<a data-tab="tab-2">직원 커스텀 필드</a> 
							</div>
							<hr>
							<div class="modal_nav" id="tab-1" style="display: block;">
								<form method="get" action="/empok.do" id="기본정보">
									<table class="profile">

										<tr>
											<th>사원번호</th>
											<td><input type="text" class="profile-text"></td>
											<th class="two rights">이름</th>
											<td><input type="text" class="profile-text"> </td>
										</tr>
										<tr>
											<th class="two">부서</th>
											<td><select class="profiletype">
													<option>개발팀</option>
													<option>영업팀</option>
													<option>인사팀</option>													
												</select></td>
											<th class="rights">주민번호</th>
											<td><input type="text" class="profile-text"></td>
										</tr>
										<tr>
											<th class="two">직급</th>
											<td><select class="profiletype">
													<option>부장</option>
													<option>대리</option>
													<option>사원</option>													
												</select></td>
											<th class="rights">휴대전화</th>
											<td><input type="tel" class="profile-text"></td>
										</tr>
										<tr>
											<th>권한타입</th>
											<td>
											<select class="profiletype">
												<option>최고관리자</option>
												<option>직원</option>
											</select>
											</td>
											<th class="rights">직통번호</th>
											<td><input type="tel" class="profile-text"></td>
										</tr>
										<tr>
				

										<tr>
											<th class="three">이메일</th>
											<td><input type="email" class="profile-text" value=""></td>
										</tr>

										<tr>
											<th class="two">주소</th>
											<td><input type="text" id="origin-modal_postcode" class="profile-text" placeholder="우편번호"> </td>
											<td><input type="button" class="postbtn" data-post-search="origin-modal" value="우편번호 찾기"></td>

										</tr>
										<tr>
											<th></th>
											<td colspan='2'><input type="text" id="origin-modal_address" class="profile-text addrtext" placeholder="주소"></td>
										</tr>
										<tr>
											<th></th>
											<td colspan='2'><input type="text" id="origin-modal_detailAddress" class="profile-text addrtext" placeholder="상세주소"> </td>

										</tr>
											<th class="three">입사일</th>
											<td><input type="date" class="profile-text profiledate"></td>
											<th class="three right"><label><input type='checkbox' id='my_checkbox' onclick='toggleTextbox(this)'/> 퇴사일</label></th>
											<td><input type="date" id="empdate" class="profile-text profiledate"></td>
										</tr>
										<tr>
											<th></th>
											<td></td>
											
											<th class="rights" id="emptext" >퇴사사유</th>
											<td><textarea class="emptext" id="emptext" ></textarea>
											
										<tr>
											<th class="two">메모</th>
											<td colspan='3'><textarea class="empmemo"></textarea>
										</tr>
										
									</table>



								</form>
							</div>
							<div class="modal_nav" id="tab-2" style="display: none;">
								<form action="" id="직원 커스텀 필드">
								<h4>학력</h4>
								<label for="edu_num">학력번호</label>
								<label for="school_name">학교명</label>
								<label for="school_dept">학과명</label>
								<label for="addmissions_day">입학년월</label>
								<label for="graduation_day">졸업년월</label>
								<label for="graduation_status">졸업상태</label>
								<label for="remarks">비고</label>
								<br>
								<input type="text" class="custom" id="edu_num">
								<input type="text" class="custom" id="school_name">
								<input type="text" class="custom" id="school_dept">
								<input type="date" class="custom" id="addmissions_day">
								<input type="date" class="custom" id="graduation_day">
								<select class="custom" id="graduation_status">
									<option></option>
									<option></option>
									<option></option>
									<option></option>
								</select>
								<input type="text" class="custom" id="remarks">
								<br>
								
								<h4>경력</h4>
								<label>경력번호</label>
								<label>회사명</label>
								<label>부서명</label>
								<label>직급</label>
								<label>주요업무</label>
								<label>입사년월</label>
								<label>퇴사년월</label>								
								<label>비고</label>
								<br>
								<input type="text" class="custom">
								<input type="text" class="custom">
								<input type="text" class="custom">
								<input type="text" class="custom">
								<input type="text" class="custom">								
								<input type="date" class="custom">
								<input type="date" class="custom">								
								<input type="text" class="custom">
								<br>
								<h4>자격증</h4>
								<label>자격증번호</label>
								<label>자격증명</label>
								<label>발행처</label>
								<label>취득년월</label>
								<label>비고</label>
								<br>
								<input type="text" class="custom">
								<input type="text" class="custom">
								<input type="text" class="custom">
								<input type="date" class="custom">
								<input type="text" class="custom">
								</form>
							</div>
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
		</nav>



		<div class="tab-scroll">
			<table class="sec-table table-hover table">
				<thead class="thead">

					<tr>
						<th style="width: 30px"><input type='checkbox' id="chkAll"
							onclick="allCheckboxes('chk[]', this.checked)"></th>
						<th>사원번호</th>
						<th>이름</th>
						<th>권한타입</th>
						<th>부서</th>
						<th>직급</th>
						<th>근로정보명</th>
						<th>입사일</th>
						<th>연차</th>
						<th>메모</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="empList" items="${list}">
					<tr class="asd"
						data-emp-num="${empList.emp_num}"
						data-name="${empList.emp_name}"
						data-regist-num="${empList.regist_num}"
						data-permission-type="${empList.permission_type}"
						data-dept="${empList.dept}"
						data-rank="${empList.rank}"
						data-work-num="${empList.work_num}"
						data-hire-date="<fmt:formatDate value="${empList.hire_date}" pattern="yyyy-MM-dd"/>"
						data-phone="${empList.phone}"
						data-direct-num="${empList.direct_num}"
						data-post-code="${empList.post_code}"
						data-address="${empList.address}"
						data-detail-address="${empList.detail_address}"
						data-annual-num="${empList.annual_num}">
						<th><input type='checkbox' name='chk[]'
							onclick="isAllCheck(this.name, 'chkAll');"></th>
						<td>${empList.emp_num}</td>
						<td>${empList.emp_name}</td>
						<td>${empList.permission_type}</td>
						<td>${empList.dept}</td>
						<td>${empList.rank}</td>
						<td>${empList.work_num}</td>
						<td><fmt:formatDate value="${empList.hire_date}" pattern="yyyy-MM-dd"/> </td>
						<td>${empList.annual_num}</td>
						<td>${empList.remarks}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</section>
	<dialog>
	<h2 class="diatitle">직급 변경하기</h2>
	<hr>
	<form method="get" id="frm2">
		<table class="employee-table">

		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" class="custom-btn btn-10">수정하기</button>
				<button type="button"  class="custom-btn btn-10">삭제하기</button>
				<button type="button"  class="btn_close custom-btn btn-10" onclick="dialogClose();">닫기</button>
			</div>
		</div>
	</form>

	</dialog>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script>

	const dialog = document.querySelector("dialog");
	$(document).on("click", ".table tbody tr", function () {
		dialog.showModal();
		console.log(this);
	});

	function dialogClose(){
		dialog.close();
	}

	$(document).on("click", ".table tbody tr", function () {
		$empNum = $(this).data("emp-num")
		$name = $(this).data("name")
		$dept = $(this).data("dept")
		$registNum = $(this).data("regist-num")
		$rank = $(this).data("rank")
		$phone = $(this).data("phone")
		$permissionType = $(this).data("permission-type")
		$directNum = $(this).data("direct-num")
		$postCode = $(this).data("postCode")
		$address = $(this).data("address")
		$detailAddress = $(this).data("detail-address")
		$hireDate = $(this).data("hire-date")
		//$annualNum = $(this).data("annual-num")
		$remarks = $(this).data("remarks")
		let str = `
			<tr>
				<th>사원번호</th>
				<td><input type="text" class="profile-text" value="`+$empNum+`"></td>
				<th class="two rights">이름</th>
				<td><input type="text" class="profile-text" value="`+$name+`"> </td>
			</tr>
			<tr>
				<th class="two">부서</th>
				<td><select class="profiletype">
					<option value="`+$dept+`">개발팀</option>
					<option value="`+$dept+`">영업팀</option>
					<option value="`+$dept+`">인사팀</option>													
				</select></td>
				<th class="rights">주민번호</th>
				<td><input type="text" class="profile-text" value="`+$registNum+`"></td>
			</tr>
			<tr>
				<th class="two">직급</th>
					<td><select class="profiletype">
							<option value="`+$rank+`">부장</option>
							<option value="`+$rank+`">대리</option>
							<option value="`+$rank+`">사원</option>													
					</select></td>
				<th class="rights">휴대전화</th>
				<td><input type="tel" class="profile-text" value="`+$phone+`"></td>
			</tr>
			<tr>
				<th>권한타입</th>
				<td>
				<select class="profiletype">
					<option value="`+$permissionType+`">최고관리자</option>
					<option value="`+$permissionType+`">직원</option>
				</select>
				</td>
				<th class="rights">직통번호</th>
				<td><input type="tel" class="profile-text" value="`+$directNum+`"></td>
			</tr>
			<tr>
				<th class="three">이메일</th>
				<td><input type="email" class="profile-text" value=""></td>
			</tr>


			<tr>
				<th class="two">주소</th>
				<td><input type="text" id="modal_postcode" class="profile-text" placeholder="우편번호" value="`+$postCode+`"> </td>
				<td><input type="button" class="postbtn" data-post-search="modal" value="우편번호 찾기"></td>
	
			</tr>
			<tr>
				<th></th>
				<td colspan='2'><input type="text" id="modal_address" class="profile-text addrtext" placeholder="주소" value="`+$address+`"></td>
			</tr>
			<tr>
				<th></th>
				<td colspan='2'><input type="text" id="modal_detailAddress" class="profile-text addrtext" placeholder="상세주소" value="`+$detailAddress+`"> </td>
	
			</tr>
			<tr>
				<th class="three">입사일</th>
				<td><input type="date" class="profile-text profiledate" value="`+$hireDate+`"></td>
				<th class="three right"><label><input type='checkbox' id='my_checkbox' onclick='toggleTextbox(this)'/> 퇴사일</label></th>
				<td><input type="date" id="empdate" class="profile-text profiledate"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				
				<th class="rights" id="emptext" >퇴사사유</th>
				<td><textarea class="emptext" id="emptext" ></textarea>
				
			<tr>
				<th class="two">메모</th>
				<td colspan='3'><textarea class="empmemo" value="`+$remarks+`"></textarea>
			</tr>
		`;

		$('dialog table').html(str)
	})
	
	function toggleTextbox(checkbox) {
		  
		  // 1. 텍스트 박스 element 찾기
		  const empdate_elem = document.getElementById('empdate');
		  const emptext_elem = document.getElementById('emptext')
		  // 2-1. 체크박스 선택여부 체크
		  // 2-2. 체크박스 선택여부에 따라 텍스트박스 활성화/비활성화
		  empdate_elem.disabled = checkbox.checked ? false : true;
		  
		  // 3. 텍스트박스 활성화/비활성화 여부에 따라
		  // - 텍스트박스가 비활성화 된 경우 : 텍스트박스 초기화
		  // - 텍스트박스가 활성화 된 경우 : 포커스 이동
		  if(empdate_elem.disabled) {
			  empdate_elem.value = null;
			  emptext_elem.hide();
		  }else {
			  empdate_elem.focus();
			  emptext_elem.show();
		  }
		}

  // 버튼 눌렀을때 해당하는 form 의 ajax 통신
  function testfn(){

    // console.log()
  }



  $('.tabs a').click(function(){
    let $tabId = $(this).data('tab')
    $('.modal_nav').hide()

    $('#'+$tabId).show()
    $('input[type="submit"]').attr('form',$('#'+$tabId).children('form').attr("id"))
  })
  
/*   다음 주소 API */

$(document).on('click','.postbtn',function(){
	execDaumPostcode($(this).data('post-search'));
})
		
		// 고칠거!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      function execDaumPostcode(input) {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                document.getElementById(input+"_postcode").value = data.zonecode;
                document.getElementById(input+"_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById(input+"_detailAddress").focus();
            }
        }).open();
    }

  function resetForm() {
	  $('#frm')[0].reset();
  }

</script>
</body>
</html>