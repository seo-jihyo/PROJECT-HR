<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <h1 class="company">MAIN</h1>
        <nav class="link-menu">
            <a href="">스케줄</a>
            <a href="/views/user/workRecord/workRecordView.jsp">출퇴근기록</a>
            <a href="">요청 내역</a>
        </nav>
    <nav class="top-nav">

        <div class="container">
            <input type="checkbox" class="toggle" id="rounded">
            <label for="rounded" data-checked="근 무 중" class="rounded" data-unchecked="  퇴   근"/>
        </div>

        <img class="reload" src="/assets/images/reload.png" onClick="window.location.reload()"/>
        <button class="logout">로그아웃</button>
        <c:if test="${login.permisson_type == 1}">
            <button class="mode-btn" onclick="location.href='/views/user/dashboard.jsp'">관리자 모드</button>
        </c:if>
    </nav>
</header>
