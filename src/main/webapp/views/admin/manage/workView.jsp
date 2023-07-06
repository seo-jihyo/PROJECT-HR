<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<%--    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/modal.css">

</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
    <div class="main_title">
        <h2>근로정보</h2>
        <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
        근로정보 추가하기</label>
        <div class="modal">
            <div>
                <p>기본정보</p>
                <label for="popup">X</label>
                <hr>
                <form action="">
                    <table>
                        <tr>
                            <td>근로정보명</td>
                            <td><input type="text" id="workName" name="workName"></td>
                        </tr>
                        <tr>
                            <td>시급(&#8361;)</td>
                            <td><input type="number" value="0" id="pay" name="workName"></td>
                        </tr>
                        <tr>
                            <td>소정근로요일</td>
                            <td>
                                <select name="fixedWorkingDay" id="fixedWorkingDay" multiple>
                                    <option value="mon" selected>월</option>
                                    <option value="tue" selected>화</option>
                                    <option value="wed" selected>수</option>
                                    <option value="thu" selected>목</option>
                                    <option value="fri" selected>금</option>
                                    <option value="sat">토</option>
                                    <option value="sun">일</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>주휴요일</td>
                            <td>
                                <select name="weekly_holiday" id="weekly_holiday" multiple>
                                    <option value="mon">월</option>
                                    <option value="tue">화</option>
                                    <option value="wed">수</option>
                                    <option value="thu">목</option>
                                    <option value="fri">금</option>
                                    <option value="sat">토</option>
                                    <option value="sun" selected>일</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>메모</td>
                            <td><input type="text" id="remarks" name="remarks"></td>
                        </tr>
                    </table>
                    <button type="button" class="btn_close" onclick="btnClose();">닫기</button>
                    <input type="submit" value="추가하기">
                </form>
            </div>
            <label for="popup"></label>
        </div>
    </div>


    <table class="sec-table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>근로정보명</th>
            <th>시급</th>
            <th>소정근로요일</th>
            <th>주휴요일</th>
            <th>메모</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>일반근무</td>
            <td><fmt:formatNumber type="currency" value="${12000}"/></td>
            <td>월,화,수,목,금</td>
            <td>일</td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>최저시급</td>
            <td><fmt:formatNumber type="currency" value="${10000}"/></td>
            <td>월,화,수,목,금</td>
            <td>일</td>
            <td></td>
        </tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>일반근무2</td>
            <td><fmt:formatNumber type="currency" value="${15000}"/></td>
            <td>월,화,수,목,금</td>
            <td>일</td>
            <td></td>
        </tr>
        </tbody>
    </table>
</section>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/modal.js"></script>
<script>
    $('#fixedWorkingDay').multiselect({
        includeSelectAllOption: true,
        selectAllText: "전체 선택",
        selectAllNumber: false,
        nonSelectedText: "선택해주세요.",
        allSelectedText: "월,화,수,목,금,토,일",
        numberDisplayed: 7,
    });
    $('#weekly_holiday').multiselect({
        includeSelectAllOption: true,
        selectAllText: "전체 선택",
        selectAllNumber: false,
        nonSelectedText: "선택해주세요.",
        allSelectedText: "월,화,수,목,금,토,일",
        numberDisplayed: 7,
    });
</script>
</body>
</html>