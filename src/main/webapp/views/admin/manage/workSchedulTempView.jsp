<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<%--    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/modal.css">
</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
    <div class="main_title">
        <h2>근무일정 템플릿</h2>
        <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
        근무일정 템플릿 추가하기</label>
        <div class="modal">
            <div>
                <h3>근무일정 템플릿 추가하기</h3>
                <label for="popup">X</label>
                <hr>
                <div class="modal_nav">
                    <form action="">
                        <label for="템플릿">템플릿 명</label>
                        <input type="text" id="템플릿" name="템플릿"> <br>
                        <label for="startTime">시간</label>
                        <input type="text" placeholder="HH" value="09" id="startTime" name="startTime1">:<input type="text" placeholder="MM" value="00" name="startTime2">
                        ~
                        <input type="text" placeholder="HH" value="18" name="endTime1">:<input type="text" placeholder="MM" value="00" name="endTime2">
                        <br>
                        <label for="근무일정유형">근무일정 유형</label>
                        <select name="근무일정유형" id="근무일정유형" multiple required>
                            <option value="없음" selected>없음</option>
                            <option value="외근" >외근</option>
                            <option value="재택근무" >재택근무</option>
                        </select> <br>

                        <label for="조직">조직</label>
                        <select name="조직" id="조직" multiple required>
                            <option value="인사팀" selected>인사팀</option>
                            <option value="개발팀" selected>개발팀</option>
                        </select> <br>
                        <label for="직무">직무</label>
                        <select name="직무" id="직무" multiple required>
                            <option value="인사팀" selected>인사팀</option>
                            <option value="개발팀" selected>개발팀</option>
                        </select> <br>
                        <label for="remarks">메모</label> <br>
                        <textarea name="remarks" id="remarks" cols="30" rows="2"></textarea>

                        <hr>
                        <button type="button" class="btn_close" onclick="btnClose();">닫기</button>
                        <input type="submit" value="추가하기">
                    </form>
                </div>
            </div>
            <label for="popup"></label>
        </div>
    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
            <th><input type="text" placeholder="검색.."></th>
        </tr>
        <tr>
            <th><input type="checkbox"></th>
            <th>템플릿 명</th>
            <th>시간</th>
            <th>근무일정 유형</th>
            <th>조직</th>
            <th>직무</th>
            <th>메모</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>개발팀</td>
            <td>09:00~18:00</td>
            <td></td>
            <td>신규사업팀</td>
            <td>개발</td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>인사팀</td>
            <td>09:00~18:00</td>
            <td></td>
            <td>인사팀</td>
            <td>인사담당자</td>
            <td></td>
        </tr>
        </tbody>
    </table>
</section>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/modal.js"></script>
</body>
</html>