<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <h1 class="company">MAIN</h1>
        <nav class="link-menu">
            <a href="/views/user/userScheduleView.jsp">스케줄</a>
            <a href="/views/user/workRecord/workRecordView.jsp">출퇴근기록</a>
            <a href="/views/user/requestHistoryView.jsp">요청 내역</a>
            <a href="/views/user/myPage.jsp">마이페이지</a>
        </nav>
    <nav class="top-nav">

        <div class="container">
            <input type="checkbox" class="toggle" id="rounded">
            <label for="rounded" data-checked="근 무 중" class="rounded" data-unchecked="  퇴   근"/>
        </div>

        <img class="reload" src="/assets/images/reload.png" onClick="window.location.reload()"/>
        <button class="logout" onClick='/logoutok.do'>로그아웃</button>
        <button class="mode-btn">관리자 모드</button>
    </nav>
</header>
