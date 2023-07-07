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
        <nav class="plusinfo">
            <select class="searchtype searchs">
                <option>선택없음</option>
                <option>유형명</option>
                <option>부서명</option>
                <option>직급명</option>
                <option>메모</option>
            </select>
            <input type="text" class="search searchs">
            <input type="button" class="seachbtn" value="검 색">
        <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
        근무일정 유형 추가하기</label>
        <div class="modal">
            <div>
                <h3>근무일정 유형 추가하기</h3>
                <label for="popup">X</label>
                <hr>
                <div class="modal_nav">
                    <form action="">
                        <table>
                            <tr>
                                <td>근무일정 유형 명</td>
                                <td><input type="text" id="work_name" name="work_name"></td>
                            </tr>
                            <tr>
                                <td>부서</td>
                                <td>
                                    <select name="dept" id="dept" multiple required>
                                        <option value="B00101" selected>인사팀</option>
                                        <option value="B00102" selected>프론트팀</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>직급</td>
                                <td>
                                    <select name="rank" id="rank" multiple required>
                                        <option value="A00101" selected>대표</option>
                                        <option value="A00102" selected>이사</option>
                                        <option value="A00103" selected>부장</option>
                                        <option value="A00104" selected>차장</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>메모</td>
                                <td>
                                    <textarea name="remarks" id="remarks" cols="30" rows="2"></textarea>
                                </td>
                            </tr>
                        </table>
                        <hr>
<%--                        <input type="checkbox" name="출근가능여부" id="출근가능여부"> 출근가능여부 <br>--%>
<%--                        <input type="checkbox" name="연장근무일정 여부" id="연장근무일정 여부"> 연장근무일정 여부 <br>--%>
<%--                        <input type="checkbox" name="휴일근무 미적용 여부" id="휴일근무 미적용 여부"> 휴일근무 미적용 여부 <br>--%>
<%--                        <input type="checkbox" name="간주근로 여부" id="간주근로 여부"> 간주근로 여부 <br>--%>
<%--                        <input type="checkbox" name="출근 전 확인사항" id="출근 전 확인사항"> 출근 전 확인사항 <br>--%>
                        <div class="bottom-btn">
                            <div class="right-btn">
                                <button class="custom-btn btn-10" form="frm">추가하기</button>
                                <button type="button" class="btn_close custom-btn btn-10" onclick="btnClose();">닫기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <label for="popup"></label>
        </div>
    </div>
    </nav>
    <table class="sec-table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>근로일정 유형명</th>
            <th>부서</th>
            <th>직급</th>
            <th>메모</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>외근</td>
            <td>프론트팀</td>
            <td>모든직급</td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>재택근무</td>
            <td>백엔드팁</td>
            <td>모든직급</td>
            <td></td>
        </tr>
        </tbody>
    </table>
</section>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/modal.js"></script>
</body>
</html>