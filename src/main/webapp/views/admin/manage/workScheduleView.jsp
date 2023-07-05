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
        <h2>근무일정 유형</h2>
        <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
        근무일정 유형 추가하기</label>
        <div class="modal">
            <div>
                <h3>근무일정 유형 추가하기</h3>
                <label for="popup">X</label>
                <hr>
                <div class="modal_nav">
                    <form action="">
                        <label for="근무유형">근무일정 유형명</label>
                        <input type="text" id="근무유형" name="근무유형"> <br>
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
                        <hr>
                        <input type="checkbox" name="출근가능여부" id="출근가능여부"> 출근가능여부 <br>
                        <input type="checkbox" name="연장근무일정 여부" id="연장근무일정 여부"> 연장근무일정 여부 <br>
                        <input type="checkbox" name="휴일근무 미적용 여부" id="휴일근무 미적용 여부"> 휴일근무 미적용 여부 <br>
                        <input type="checkbox" name="간주근로 여부" id="간주근로 여부"> 간주근로 여부 <br>
                        <input type="checkbox" name="출근 전 확인사항" id="출근 전 확인사항"> 출근 전 확인사항 <br>
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

    <table class="sec-table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>근로일정 유형명</th>
            <th>조직</th>
            <th>출근가능여부</th>
            <th>연장근무일정여부</th>
            <th>휴일근무 미적용 여부</th>
            <th>간주근로 여부</th>
            <th>간주근로 고정근무시간</th>
            <th>출근 전 확인사항</th>
            <th>메모</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>외근</td>
            <td>개발팀</td>
            <td>프론트</td>
            <td>O</td>
            <td>X</td>
            <td>X</td>
            <td>X</td>
            <td>9h</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>재택근무</td>
            <td>개발팀</td>
            <td>백엔드</td>
            <td>O</td>
            <td>X</td>
            <td>X</td>
            <td>X</td>
            <td>9h</td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</section>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/modal.js"></script>
</body>
</html>