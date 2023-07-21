<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" /> 
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Dashboard</title>
  <%--jquery--%>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="/assets/css/styles.css">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../../assets/css/dashboard.css?v=1.1.2" rel="stylesheet" />
</head>

<body class="" >
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
 
    <!-- Header -->
    <div>
      <div class="container-fluid">
        <div class="header-body">
        
        <!-- 날짜 출력 -->
          <h1 class="text-white mb-0">
        	<div id="current_date"></div><p><p><p>
          </h1>
          <!-- Card stats -->
          <!-- Card 1 -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">근무중 인원</h5>
                      <span class="h1-1 font-weight-bold mb-0">
							${vo.att_count}명
					  </span>
                    </div>
                   <div class="col text-right-b">
                  	<a href="/cmtrecord.do?cate=nav-cmt-rec" class="btn btn-sm btn-primary">더보기</a>
                   </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm"></p>
                </div>
              </div>
            </div>
            <!-- Card 2 -->
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">미출근 인원</h5>
                      <span class="h1-1 font-weight-bold mb-0">
                            ${vo.not_att_count}명
					  </span>
                    </div>
                   <div class="col text-right-b">
                  	<a href="/cmtrecord.do?cate=nav-cmt-rec" class="btn btn-sm btn-primary">더보기</a>
                   </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm"></p>
                </div>
              </div>
            </div>
            <!-- Card 3 -->
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">퇴근 인원</h5>
                      <span class="h1-1 font-weight-bold mb-0">
                            ${vo.leave_count}명
                      </span>
                    </div>
                   <div class="col text-right-b">
                  	<a href="/cmtrecord.do?cate=nav-cmt-rec" class="btn btn-sm btn-primary">더보기</a>
                   </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm"></p>
                </div>
              </div>
            </div>
            <!-- Card 4 -->
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">휴가 현황</h5>
                      <span class="h1-1 font-weight-bold mb-0">
                            ${vo.vac_count}명
					  </span>
                    </div>
                   <div class="col text-right-b">
                  	<a href="/vacation.do?cate=nav-vac" class="btn btn-sm btn-primary">더보기</a>
                   </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm"></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <p><p>
    <!-- Over View -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-xl-8 mb-5 mb-xl-0">
          <div class="card shadow">          
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">Overview</h6>
                  <h2 class="mb-0 title-container">미확인 요청내역&nbsp;&nbsp;-&nbsp;&nbsp;${vo.non_approve_count} 건&nbsp;&nbsp;&nbsp;&nbsp;
	                 	<a href="/requesthistory.do?cate=nav-req-his" class="btn btn-sm btn-primary">더보기</a>
               
                  </h2>
                  
           		</div>
           	  </div>
           </div>
            <div class="card-body">
       			<table class="col-6">
       				<thead class="thead">
       					<th class="text-lg"><h3 class="mb-0 text-center">이름</h2></th>
       					<th class="text-lg"><h3 class="mb-0 text-center">요청내역번호</h2></th>
       					<th class="text-lg"><h3 class="mb-0 text-center">부서</h2></th>
       					<th class="text-lg"><h3 class="mb-0 text-center">요청타입</h2></th>
       					
       				</thead>
       				<tbody>
	       				<c:forEach var="list" items="${vo.rhvo}">
	       					<tr>
	       						<td class="text-sm"><h4 class="mb-0 text-center">${list.emp_name}</h4></td>
	       						<td class="text-sm"><h4 class="mb-0 text-center">${list.rqst_hstry_num}</td>
	       						<td class="text-sm"><h4 class="mb-0 text-center">${list.dept}</td>
	       						<td class="text-sm"><h4 class="mb-0 text-center">${list.request_type == 'A' ? '출퇴근요청' :
                                                                                    list.request_type == 'W' ? '근무일정 요청' :
                                                                                            list.request_type == 'V' ? '휴가 요청' :''}</td>
	       					</tr>
	       				</c:forEach>
       				</tbody>
       			</table>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="card shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">Overview</h6>
                  <h2 class="mb-0">관리 바로가기</h2>
                </div>
              </div>
           	 </div>
            <div class="card-body">
            <table class="admin">
            <tr>
            	<td><a href="/emp.do?cate=nav-emp"><h4 class="mb-0">ㆍ직원 관리하기</h4></a><br></td>
            	<td><a href="/dept.do"><h4 class="mb-0">ㆍ부서 관리하기</h4></a><br></td>
            </tr>
            <tr>
            	<td><a href="/rank.do"><h4 class="mb-0">ㆍ직급 관리하기</h4></a><br></td>
            	<td><a href="/vacationtype.do"><h4 class="mb-0">ㆍ휴가유형 관리하기</h4></a><br></td>
            </tr>
            <tr>
            	<td><a href="/work.do"><h4 class="mb-0">ㆍ근로정보 관리하기</h4></a><br></td>
            	<td><a href="/worktype.do"><h4 class="mb-0">ㆍ근무일정유형 관리하기</h4></a><br></td>
            </tr>
            </table>
            </div>
          </div>
        </div>
        
     </div>
      <!-- Footer -->
     <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2023 <a href="#" class="font-weight-bold ml-1" target="_blank">HR Project</a>
            </div>
          </div>
          <div class="col-xl-6">
          </div>
        </div>
      </footer> 
    </div>
  </section>
<script src="/assets/js/main.js"></script>
   <script>

   /* 오늘 날짜 출력 js */
    var date = new Date();
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var dayOfWeek = week[date.getDay()];

    document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일 " + "(" + dayOfWeek + ")";
  </script>
</body>

</html>