<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <h1 class="company">MAIN</h1>
        <nav class="link-menu">
            <a href="/userSchedule.do">스케줄</a>
            <a href="/workrecord.do">출퇴근기록</a>
            <a href="/userRequesthistory.do">요청 내역</a>
            <a href="/myPage.do">마이페이지</a>
        </nav>
    <nav class="top-nav">
        <h1>${login.emp_name}님 환영합니다&nbsp;</h1 >
        <div class="container">
            <input type="checkbox" class="toggle" id="rounded" name="att_status">
            <label for="rounded" data-checked="근 무 중" class="rounded" data-unchecked="  퇴   근"/>
        </div>

        <img class="reload" src="/assets/images/reload.png" onClick="window.location.reload()"/>
        <button class="logout" onclick="location.href='/logoutok.do'">로그아웃</button>
        <c:if test="${login.permission_type == 1}">
            <button class="mode-btn" onclick="location.href='/dashboard.do?cate=nav-home'">관리자 모드</button>
        </c:if>
    </nav>
</header>
