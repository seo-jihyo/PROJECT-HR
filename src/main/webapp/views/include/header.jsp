<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${login == null}">
    <c:redirect url="/login.do"/>
</c:if>


<header>
    <h1 class="company">MAIN</h1>

    <nav class="top-nav">
        <h1>${login.emp_name}님 환영합니다&nbsp;</h1 >
        <div class="container">

            <input type="checkbox" class="toggle" id="rounded">
            <label for="rounded" data-checked="근 무 중" class="rounded" data-unchecked="  퇴   근"/>
        </div>

        <img class="reload" src="/assets/images/reload.png" onClick="window.location.reload()"/>
        <button class="mode-btn" onclick="location.href='/userSchedule.do'">직원 모드</button>
    </nav>
</header>
<div class="navbar_1 expander" id="navbar">
    <nav class="nav">
        <div>
            <div class="nav_brand">
                <i class='nav_toggle nav_icon menu-outline bx bx-menu' id="nav-toggle"></i>
                <a href="/" class="nav_logo">Menu</a>
            </div>

            <a class="nav_list"></a>
            <a href="/dashboard.do?cate=nav-home" id="nav-home" class="nav_link">
                <i class='nav_icon bx bx-home'></i>
                <span class="nav_name">대시보드</span>
            </a>
            <a href="/workschedule.do?cate=nav-ws" id="nav-ws" class="nav_link">
                <i class='nav_icon bx bx-calendar'></i>
                <span class="nav_name">근무일정</span>
            </a>
            <a href="/cmtrecord.do?cate=nav-cmt-rec" id="nav-cmt-rec" class="nav_link">
                <i class='nav_icon bx bx-time'></i>
                <span class="nav_name">출퇴근 기록</span>
            </a>
            <a href="/vacation.do?cate=nav-vac" id="nav-vac" class="nav_link">
                <i class='nav_icon bx bxs-plane-alt'></i>
                <span class="nav_name">휴   가</span>
            </a>
            <a href="/requesthistory.do?cate=nav-req-his" id="nav-req-his" class="nav_link">
                <i class='nav_icon bx bxs-paper-plane'></i>
                <span class="nav_name">요청내역</span>
            </a>
            <a href="/salary.do?cate=nav-sal" id="nav-sal" class="nav_link">
                <i class='nav_icon bx bx-money-withdraw'></i>
                <span class="nav_name">급여내역</span>
            </a>
            <div href="/emp.do?cate=nav-emp" id="nav-emp" class="nav_link collapse">
                <i class='nav_icon bx bxs-report'></i>
                <span class="nav_name">관   리</span>

                <i class='collapse_link bx bxs-chevron-down arrow'></i>

                <ul class="collapse_menu">
                    <a href="/emp.do?cate=nav-emp" class="collapse_sublink">직원</a><br>
                    <a href="/dept.do" class="collapse_sublink">부서</a><br>
                    <a href="/rank.do" class="collapse_sublink">직급</a><br>
                    <a href="/vacationtype.do" class="collapse_sublink">휴가유형</a><br>
                    <a href="/work.do" class="collapse_sublink">근로정보</a><br>
                    <a href="/worktype.do" class="collapse_sublink">근무일정유형</a><br>

                    <!--  <a href="/views/admin/manage/workSchedulTempView.jsp" class="collapse_sublink">근무일정템플릿</a><br>
                    <a href="/views/admin/manage/vacationRulesView.jsp" class="collapse_sublink">휴가발생규칙</a><br> -->
                </ul>
            </div>

        </div>


        <a href="/logoutok.do" class="nav_link">
            <i class='nav_icon bx bx-log-out' id="log_out"></i>
            <span class="nav_name">Log Out</span>
        </a>
    </nav>
</div>
</div>

<script>
    const navCategory = "${param.cate}"
    $("#nav-home").removeClass("active");
    $("#"+navCategory).addClass("active");

</script>
