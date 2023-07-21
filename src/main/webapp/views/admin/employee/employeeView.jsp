<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.profile-text {
	border: 1px solid black;
	height: 25px;
}

.profile tr td {
	padding: 7px;
	font-size: 15px;
}

.two {
	letter-spacing: 30px;
	padding: 0px;
}

.three {
	letter-spacing: 8px;
}

.profile th {
	text-align: left;
}

.addrtext {
	width: 342px;
}

.profiledate {
	width: 163px;
	height: 25px;
}

.profiletype {
	width: 163px;
	height: 25px;
	border: 1px solid black;
}

.right {
	padding-left: 11em;
}

.rights {
	padding-left: 10.5em;
}

.empmemo {
	border: 1px solid black;
	width: 650px;
	height: 100px;
}
.diaempmemo{
	border: 1px solid black;
	width: 698px;
	height: 100px;
}
.emptext {
	border: 1px solid black;
	width: 160px;
	height: 70px;
}

.postbtn {
	width: 150px;
	height: 25px;
	color: white;
	background-color: #116fab;
	border: 0px;
	cursor: pointer;
}
.diapostbtn {
	width: 125px;
	height: 25px;
	color: white;
	background-color: #116fab;
	border: 0px;
	cursor: pointer;
}

.custom {
	border: 1px solid black;
	height: 25px;
	width: 150px;
}

.modal {
	width: 100%;
}

dialog {
    height: 800px;
    width: 900px;
    top: 10%;
    left: 30%;
}
.diatitle{
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}
div.plusbtn{
	width: 280px;
}
.delBtn{
	background-color: #116fab;
	color: white;
	height: 25px;
    width: 80px;
    letter-spacing: 5px;
    border:0px;
    cursor: pointer;
}
</style>
<title>휴가관리</title>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/views/include/header.jsp"%>
	<script defer>
    $(document).on('keyup', '#keyEmp', function () {
        $('.keyEmp').val($(this).val());

    })
</script>
	<section id="body-pd" class="body-pd">

		<div class="main_title">

			<h2>직원 관리</h2>
			<nav class="plusinfo">

				<select class="searchtype searchs">
					<option value="none">선택없음</option>
					<option value="empNum">사원번호</option>
					<option value="empName">이름</option>
					<option value="hireDate">입사일</option>
					<option value="dept">부서</option>
					<option value="rank">직급</option>
					<option value="workType">근로정보명</option>
					<option value="remarks">메모</option>
				</select> 
					<input type="text" class="search searchs"> 
					<input type="button" class="searchbtn" value="검 색"> 
					<input type="checkbox" id="popup" onclick="resetForm()">
					<label class="labelBtn searchs" for="popup">+ 직원 추가하기</label>

				<div class="modal" style="display: hidden;">

					<div class="modal-content">


						<label for="popup">x</label>
						<h1>직원 추가하기</h1>
						<hr>

						<div class="tabs">
							<a data-tab="tab-1">기본정보</a>&nbsp;&nbsp;&nbsp; <a
								data-tab="tab-3">경력</a>&nbsp;&nbsp;&nbsp; <a data-tab="tab-4">자격증</a>
						</div>
						<hr>
						<div class="modal_nav" id="tab-1" style="display: block;">
							<form method="get" id="frm">
								<table class="profile">

									<tr>
										<th>사원번호</th>
										<td><input type="text" class="profile-text" id="keyEmp"
											name="emp-num"></td>
										<th class="two rights">이름</th>
										<td><input type="text" class="profile-text"
											name="emp-name"></td>
									</tr>
									<tr>
										<th class="two">부서</th>
										<td><select class="profiletype" name="emp-dept">

												<c:forEach var="list" items="${optDept}">
													<option value="${list.code_name}">${list.code_value}</option>
												</c:forEach>
										</select></td>

										<th class="rights">주민번호</th>
										<td><input type="text" class="profile-text"
											name="emp-regist-num"></td>
									</tr>
									<tr>
										<th class="two">직급</th>

										<td><select class="profiletype" name="emp-rank">
												<c:forEach var="list" items="${optRank}">
													<option value="${list.code_name}">${list.code_value}</option>
												</c:forEach>
										</select></td>

										<th class="rights">휴대전화</th>
										<td><input type="tel" class="profile-text"
											name="emp-phone"></td>
									</tr>
									<tr>
										<th>권한타입</th>
										<td><select class="profiletype"
											name="emp-permission-type">
												<option value="1">최고관리자</option>
												<option value="0">직원</option>
										</select></td>
										<th class="rights">직통번호</th>
										<td><input type="tel" class="profile-text"
											name="emp-direct-num"></td>
									</tr>

									<tr>
										<th class="three">이메일</th>
										<td><input type="email" class="profile-text"
											name="emp-email"></td>
									</tr>

									<tr>
										<th class="two">주소</th>
										<td><input type="text" id="origin-modal_postcode"
											name="emp-post-code" class="profile-text" placeholder="우편번호"></td>
										<td><input type="button" class="postbtn" data-post-search="origin-modal" value="우편번호 찾기"></td>

									</tr>
									<tr>
										<th></th>
										<td colspan='2'><input type="text"
											id="origin-modal_address" name="emp-address"
											class="profile-text addrtext" placeholder="주소"></td>
									</tr>
									<tr>
										<th></th>
										<td colspan='2'><input type="text"
											id="origin-modal_detailAddress" name="emp-detail-address"
											class="profile-text addrtext" placeholder="상세주소"></td>

									</tr>
									<tr>
										<th class="three">입사일</th>
										<td><input type="date" name="emp-hire-date"
											class="profile-text profiledate"></td>

										<th class="three right">퇴사일</th>
										<td><input type="date" id="empdate"
											name="emp-departure-date" class="profile-text profiledate"></td>
									</tr>
									<tr>
										<th></th>
										<td></td>

										<th class="right" id="emptext">퇴사사유</th>
										<td><textarea name="emp-reason" class="emptext"
												id="emptext"></textarea>
									<tr>
										<th>근로정보</th>
										<td><select class="profiletype" name="emp-workNum">
												<c:forEach var="list" items="${optWork}">
													<option value="${list.work_num}">${list.work_name}</option>
												</c:forEach>
										</select></td>
									</tr>

									<tr>
										<th class="two">메모</th>
										<td colspan='3'><textarea name="remarks" class="empmemo"></textarea>
									</tr>

								</table>
								<hr>
								<div class="bottom-btn">
									<div class="right-btn">
										<button type="button" class="custom-btn btn-10" id="sendEmail">추가하기</button>
										<button type="button" class="btn_close custom-btn btn-10"
											onclick="btnClose();">닫기</button>
									</div>
								</div>

							</form>
						</div>
						<div class="modal_nav" id="tab-3" style="display: none;">
							<form id="careerFrm">
								<br>
								<h4>경력</h4>
								<table class="profile career">
									<thead>
										<tr>
											<!-- <th>경력번호</th> -->
											<th>회사명</th>
											<th>부서명</th>
											<th>직급</th>
											<th>주요업무</th>
											<th>입사년월</th>
											<th>퇴사년월</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<input type="hidden" class="custom keyEmp" name="empNum">
											<!-- <input type="text" class="custom" name="career-num"> -->
											<td><input type="text" class="custom"
												name="companyName[]"></td>
											<td><input type="text" class="custom" name="dept[]"></td>
											<td><input type="text" class="custom" name="rank[]"></td>
											<td><input type="text" class="custom" name="mainTask[]"></td>
											<td><input type="date" class="custom" name="joinDate[]"></td>
											<td><input type="date" class="custom" name="leaveDate[]"></td>
											<td><input type="text" class="custom"
												name="careerRemarks[]"></td>
											<td><input type="button" class="delBtn" onclick="delCareer(this)"
												value="삭제"></td>
										</tr>
									</tbody>
								</table>
								<hr>
								<div class="bottom-btn">
									<div class="right-btn plusbtn">
										<button type="button" id="career_table"
											class="custom-btn btn-10 btnplus">테이블 추가하기</button>
										<button class="custom-btn btn-10 btnplus" form="경력"
											onclick="sendCareer(this.form);">추가하기</button>
										<button type="button" class="btn_close custom-btn btn-10 btnplus"
											onclick="btnClose();">닫기</button>
									</div>
								</div>
							</form>
						</div>
						<div class="modal_nav" id="tab-4" style="display: none;">
							<form id="certFrm">
								<br>
								<h4>자격증</h4>
								<table class="profile certification">
									<thead>
										<tr>
											<!-- <td>자격증번호</td> -->
											<th>자격증명</th>
											<th>발행처</th>
											<th>취득년월</th>
											<th>비고</th>
											<th></th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<input type="hidden" class="custom keyEmp" name="emp-num">
											<!-- <input type="text" class="custom" name="cert-num"> -->
											<td><input type="text" class="custom" name="cert-name[]"></td>
											<td><input type="text" class="custom" name="issuer[]"></td>
											<td><input type="date" class="custom"
												name="acquisition-date[]"></td>
											<td><input type="text" class="custom"
												name="cert-remarks[]"></td>
											<td><input type="button" class="delBtn" onclick="delCert(this)"
												value="삭제"></td>
											<!-- onclick="deleteTableBtn(this)" -->
										</tr>
									</tbody>
								</table>
								<hr>
								<div class="bottom-btn">
									<div class="right-btn plusbtn">
										<button type="button" id="cert_table" class="custom-btn btn-10">테이블 추가하기</button>
										<button type="button" class="custom-btn btn-10" onclick="sendCert(this.form)">추가하기</button>
										<button type="button" class="btn_close custom-btn btn-10 btnplus" onclick="btnClose();">닫기</button>
									</div>
								</div>
							</form>

							<script>


                            function sendCareer(input) {
                                const trCareer = Array.from(document.querySelectorAll('.career tbody tr'))
                                const careerGroup = trCareer.map(tr => {
                                    return Array.from(tr.querySelectorAll('input')).map(input => input.value);
                                })
                                $.ajax({
                                    url: "/careerInsertByManager.do",
                                    type: "post",
                                    data: {"careerGroup": JSON.stringify(careerGroup)}
                                });
                            }

                            function delCareer(input) {
                                var companyName = $('input[name=companyName]').val();
                                $.ajax({
                                    url: "/careerDeleteByManager.do",
                                    type: "post",
                                    data: {"companyName": companyName},
                                    success: deleteTableBtn(input)
                                });
                            }

                            function sendCert(input) {
                                console.log(input)
                                const trCert = Array.from(document.querySelectorAll('.certification tbody tr'))
                                const certGroup = trCert.map(tr => {
                                    return Array.from(tr.querySelectorAll('input')).map(input => input.value);
                                })
                                $.ajax({
                                    url: "/certInsertByManager.do",
                                    type: "post",
                                    data: {"certGroup": JSON.stringify(certGroup)}
                                });
                            }


                            function delCert(input) {
                                var certName = $('input[name=cert-name]').val();
                                var issuer = $('input[name=issuer]').val();
                                console.log(certName + " " + issuer);
                                $.ajax({
                                    url: "/certDeleteByManager.do",
                                    type: "post",
                                    data: {
                                        "certName": certName,
                                        "issuer": issuer
                                    },
                                    success: deleteTableBtn(input)
                                });
                            }

                            $(document).on("click", "#career_table", function () {
                                const str = `
		                            	<tr>
		                                    <input type="hidden" class="custom keyEmp" name="emp-num" value="` + $('#keyEmp').val() + `">
		                                    <td><input type="text" class="custom" name="company-name[]"></td>
		                                    <td><input type="text" class="custom" name="dept[]"></td>
		                                    <td><input type="text" class="custom" name="rank[]"></td>
		                                    <td><input type="text" class="custom" name="main-task[]"></td>
		                                    <td><input type="date" class="custom" name="join-date[]"></td>
		                                    <td><input type="date" class="custom" name="leave-date[]"></td>
		                                    <td><input type="text" class="custom" name="career-remarks[]"></td>
		                                    <td><input type="button" class="delBtn" onclick="deleteTableBtn(this)" value="삭제"></td>
	                                	</tr>
	                            `;

                                $(".career tbody").append(str);
                            })

                            $(document).on("click", "#cert_table", function () {
                                const str = `
                                <tr>
                                    <input type="hidden" class="custom keyEmp" name="emp-num" value="` + $('#keyEmp').val() + `">
                                    <td><input type="text" class="custom" name="cert-name"></td>
                                    <td><input type="text" class="custom" name="issuer"></td>
                                    <td><input type="date" class="custom" name="acquisition-date"></td>
                                    <td><input type="text" class="custom" name="cert-remarks"></td>
                                    <td><input type="button"  class="delBtn" onclick="deleteTableBtn(this)" value="삭제"></td>
                                </tr>
                                `;
                                $(".certification tbody").append(str);
                            })

                            function deleteTableBtn(el) {
                                const parent = el.parentNode.parentNode;
                                $(parent).remove();
                            }
                        </script>
						</div>

					</div>
					<label for="popup"></label>
				</div>
		</div>
		</nav>


		<div class="tab-scroll">
			<table class="sec-table table-hover table my-table" id="mainTable">
				<thead class="thead">

					<tr>

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
						<tr class="asd" data-emp-num="${empList.emp_num}"
							data-name="${empList.emp_name}"
							data-regist-num="${empList.regist_num}"
							data-permission-type="${empList.permission_type}"
							data-dept="${empList.dept}" data-rank="${empList.rank}"
							data-dept-code="${empList.dept_code}" data-rank-code="${empList.rank_code}"
							data-work-num="${empList.work_num}"
							data-hire-date="<fmt:formatDate value="${empList.hire_date}" pattern="yyyy-MM-dd"/>"
							data-phone="${empList.phone}"
							data-direct-num="${empList.direct_num}"
							data-post-code="${empList.post_code}"
							data-address="${empList.address}"
							data-detail-address="${empList.detail_address}"
							data-annual-num="${empList.annual_num}"
							data-email="${empList.email}" data-remarks="${empList.remarks}"
							data-work-num="${empList.work_num}"
						>

							<td>${empList.emp_num}</td>
							<td>${empList.emp_name}</td>
							<td>${empList.permission_type}</td>
							<td>${empList.dept}</td>
							<td>${empList.rank}</td>
							<td>${empList.work_name}</td>
							<td><fmt:formatDate value="${empList.hire_date}"
									pattern="yyyy-MM-dd" /></td>
							<td>${empList.annual_num}</td>
							<td>${empList.remarks}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="pagination">
			<i class='bx bxs-chevron-left'></i>
			<ol id="pagingNumbers">
			</ol>
			<i class='bx bxs-chevron-right'></i>
		</div>
	</section>
	<dialog>
	<h2 class="diatitle">직원 정보 수정하기</h2>
	<hr>
	<form method="get" id="frm2">
		<table class="employee-table profile">

		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="button" id="updateBtn" class="custom-btn btn-10">수정하기</button>
				<button type="button" id="deleteBtn" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="btn_close custom-btn btn-10"
					onclick="dialogClose();">닫기</button>
			</div>
		</div>
	</form>

	</dialog>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script src="/assets/js/moment.js"></script>
	<script type="text/javascript">
    updateRowsPerPage(18);

    $("#sendEmail").click(function () {
		name="emp-email"
		if($.trim($("#keyEmp").val())==""){
			alert("아이디를 입력해주세요")
			return false;
		}
		if($.trim($("input[name='emp-name']").val())==""){
			alert("이메일을 입력해주세요")
			return false;
		}

        $frm = $("#frm").serialize();
        $.ajax({
            url: "/empok.do",
            type: "post",
            data: $frm,
            dataType: "json",
            success: sucFuncJson,
            error: errFunc
        });

        function sucFuncJson(data) {
            console.log(data);
            if (data.status == "false") {
                alert("이미 등록된 이메일입니다.");
            } else {
                alert("이메일로 아이디와 비밀번호를 전송하였습니다.");
                window.location.href = "/emp.do?cate=nav-emp"
            }
        }

        function errFunc(e) {
            alert("실패" + e.status)
        }
    })


    const dialog = document.querySelector("dialog");
    $(document).on("click", ".table tbody tr", function () {
        dialog.showModal();
        console.log(this);
    });

    function dialogClose() {
        dialog.close();
    }

    $(document).on("click", ".table tbody tr", function () {
        $empNum = $(this).data("emp-num")
        $name = $(this).data("name")
        $registNum = $(this).data("regist-num")
		$deptCode = $(this).data("dept-code")
		$rankCode = $(this).data("rank-code")
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
        $email = $(this).data("email")
		$workNum = $(this).data("work-num");

        let str = `
        <input type="hidden" name="workNum" class="profile-text" value="` + $workNum + `">
         <tr>
            <th>사원번호</th>
            <td><input type="text" name="emp-num" class="profile-text" value="` + $empNum + `"></td>
            <th class="two rights">이름</th>
            <td><input type="text" name="emp-name" class="profile-text" value="` + $name + `"> </td>
         </tr>
         <tr>
            <th class="two">부서</th>
            <td><select class="profiletype" name="emp-dept">
                    <c:forEach var="list" items="${optDept}">
                        <option value="${list.code_name}">${list.code_value}</option>
                    </c:forEach>
            </select></td>
            <th class="rights">주민번호</th>
            <td><input type="text" name="emp-regist-num" class="profile-text" value="` + $registNum + `" readonly></td>
         </tr>
         <tr>
            <th class="two">직급</th>
               <td><select class="profiletype" name="emp-rank">
                    <c:forEach var="list" items="${optRank}">
                        <option value="${list.code_name}">${list.code_value}</option>
                    </c:forEach>
               </select></td>
            <th class="rights">휴대전화</th>
            <td><input type="tel" name="emp-phone" class="profile-text" value="` + $phone + `"></td>
         </tr>
         <tr>
            <th>권한타입</th>
            <td>
            <select class="profiletype" name="emp-permission-type">
               <option value="1">최고관리자</option>
               <option value="0">직원</option>
            </select>
            </td>
            <th class="rights">직통번호</th>
            <td><input type="tel" name="emp-direct-num" class="profile-text" value="` + $directNum + `"></td>
         </tr>
         <tr>
            <th class="three">이메일</th>
            <td><input type="email" name="emp-email" class="profile-text" value="` + $email + `" readonly></td>
         </tr>


         <tr>
            <th class="two">주소</th>
            <td><input type="text" id="modal_postcode" name="emp-post-code" class="profile-text" placeholder="우편번호" value="` + $postCode + `"> </td>
            <td><input type="button" class="diapostbtn" data-post-search="modal" value="우편번호 찾기"></td>
   
         </tr>
         <tr>
            <th></th>
            <td colspan='2'><input type="text" id="modal_address" name="emp-address" class="profile-text addrtext" placeholder="주소" value="` + $address + `"></td>
         </tr>
         <tr>
            <th></th>
            <td colspan='2'><input type="text" id="modal_detailAddress" name="emp-detail-address" class="profile-text addrtext" placeholder="상세주소" value="` + $detailAddress + `"> </td>
   
         </tr>
         <tr>
            <th class="three">입사일</th>
            <td><input type="date" class="profile-text profiledate" name="emp-hire-date" value="` + $hireDate + `"></td>
            <th class="three right">퇴사일</th>
            <td><input type="date" id="empdate" name="emp-departure-date" class="profile-text profiledate"></td>
         </tr>
         <tr>
            <th></th>
            <td></td>
            
            <th class="right" id="emptext" >퇴사사유</th>
            <td><textarea class="emptext" name="emp-reason" id="emptext" ></textarea>
         </tr>
         <tr>
										<th>근로정보</th>
										<td><select class="profiletype" name="emp-workNum">
												<c:forEach var="list" items="${optWork}">
													<option value="${list.work_num}">${list.work_name}</option>
												</c:forEach>
										</select></td>
									</tr>
         <tr>
            <th class="two">메모</th>
            <td colspan='3'><textarea class="diaempmemo" name="emp-remarks" value="` + $remarks + `"></textarea>
         </tr>
      `;

        $('dialog table').html(str)
		$("select[name='emp-rank']").val($rankCode).prop("selected", true);
		$("select[name='emp-dept']").val($deptCode).prop("selected", true);
		$("select[name='emp-permission-type']").val($permissionType).prop("selected", true);
		$("select[name='emp-workNum']").val($workNum).prop("selected", true);
    })

    $(document).on('click', '.searchbtn', function () {
        let searchType = document.querySelector(".searchtype");
        let searchWord = document.querySelector(".search");
        $.ajax({
            type: "post",
            data: {
                "searchType": searchType.value,
                "searchWord": searchWord.value,
            },
            url: "/searchEmp.do",
            dataType: "json",
            success: sucFuncJson,
            error: errFunc
        })

        function sucFuncJson(data) {
            console.log(data);
            $('#mainTable tbody').html(htmlStr(data));
            if (data) {
                if (data.result == true) {
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

        function htmlStr(data) {
            let html = '';
            data.forEach(value => {
                const hireDate = moment(value.hire_date, 'MMM DD, YYYY, h:mm:ss A').format('YYYY-MM-DD');

                html += `
               <tr
                    data-emp-num="` + value.emp_num + `"
                    data-emp-name="` + value.emp_name + `"
                    data-permisision-type="` + value.permission_type + `"
                    data-dept-code="` + value.dept_code + `"
                    data-rank-code="` + value.rank_code + `"
                    data-rank-code="` + value.rank_code + `"
                    data-work-num="` + value.work_num + `"
                    data-hire-date-work="` + hireDate + `"
                    data-annual-numk="` + value.annual_num + `"
                    data-remarks="` + value.remarks + `"
                    >


                    <td>` + value.emp_num + `</td>
                    <td>` + value.emp_name + `</td>
                    <td>` + value.permission_type + `</td>
                    <td>` + value.dept + `</td>
                    <td>` + value.rank + `</td>
                    <td>` + value.work_name + `</td>
                    <td>` + hireDate + `</td>
                    <td>` + value.annual_num + `</td>
                    <td>` + value.remarks + `</td>
                </tr>
                `;

            })
            return html;
        }
    })


    $('.tabs a').click(function () {
        let $tabId = $(this).data('tab')
        $('.modal_nav').hide()

        $('#' + $tabId).show()
        $('input[type="submit"]').attr('form', $('#' + $tabId).children('form').attr("id"))
    })

    /*   다음 주소 API */

    $(document).on('click', '.postbtn', function () {
        execDaumPostcode($(this).data('post-search'));
    })

    function execDaumPostcode(input) {
        new daum.Postcode({
            oncomplete: function (data) {
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

                document.getElementById(input + "_postcode").value = data.zonecode;
                document.getElementById(input + "_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById(input + "_detailAddress").focus();
            }
        }).open();
    }

    function resetForm() {
        $('#frm')[0].reset();
    }

    const $form = $('#frm2');
    $(document).on('click', '#updateBtn', function () {
        $form.attr('action', '/empupdate.do')
        $form.attr('method', 'post')
        if (!confirm("등록하시겠습니까?")) {
            alert("취소하셨습니다.");
        } else {
            alert("해당 직원의 정보를 수정하셨습니다.");
            $form.submit()
        }
    })
    $(document).on('click', '#deleteBtn', function () {
        $form.attr('action', '/empdelete.do')
        $form.attr('method', 'post')
        if (!confirm("삭제하시겠습니까?")) {
            alert("취소하셨습니다.");
        } else {
            alert("해당 직원을 삭제 하셨습니다.");
            $form.submit()
        }
    })
</script>
</body>
</html>