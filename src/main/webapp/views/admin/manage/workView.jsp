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

    <style type="text/css">
        dialog {
            width: 560px;
            height: 500px;

        }

        .diatitle {
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 20px;
        }

        .work-table {
            padding: 20px 20px;
            width: 100%;
        }

        .work-table tr {
            margin: 5px;
        }

        .work-table tr td {
            padding: 7px;
            font-size: 15px;
        }

        .workadd {
            height: 25px;
            border: 1px solid black;
        }

        .work-area {
            width: 300px;
            height: 90px;
            border: 1px solid black;
        }

        .work-table th {
            text-align: left;
        }

        .modaltwo {
            letter-spacing: 58px;
            padding-right: 0px;
        }

        .four {
            letter-spacing: 10px;
        }
    </style>
</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
    <div class="main_title">
        <h2>근로정보</h2>
        <nav class="plusinfo">
            <select class="searchtype searchs">
                <option>선택없음</option>
                <option>근로정보명</option>
                <option>시급</option>
                <option>소정근로요일</option>
                <option>주휴요일</option>
                <option>메모</option>
            </select>
            <input type="text" class="search searchs">
            <input type="button" class="seachbtn" value="검 색">
            <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
            근로정보 추가하기</label>
            <div class="modal">
                <div>
                    <p>기본정보</p>
                    <label for="popup">X</label>
                    <hr>
                    <form action="/addwork.do">
                        <table>
                            <tr>
                                <td>근로정보명</td>
                                <td><input type="text" id="workName" name="workName"></td>
                            </tr>
                            <tr>
                                <td>시급(&#8361;)</td>
                                <td><input type="number" value="0" id="pay" name="pay"></td>
                            </tr>
                            <tr>
                                <td>소정근로요일</td>
                                <td>
                                    <select name="fixedWorkingDay" id="fixedWorkingDay" multiple>
                                        <option value="월" selected>월</option>
                                        <option value="화" selected>화</option>
                                        <option value="수" selected>수</option>
                                        <option value="목" selected>목</option>
                                        <option value="금" selected>금</option>
                                        <option value="토">토</option>
                                        <option value="일">일</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>주휴요일</td>
                                <td>
                                    <select name="weekly_holiday" id="weekly_holiday" multiple>
                                        <option value="월">월</option>
                                        <option value="화">화</option>
                                        <option value="수">수</option>
                                        <option value="목">목</option>
                                        <option value="금">금</option>
                                        <option value="토">토</option>
                                        <option value="일" selected>일</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>메모</td>
                                <td><input type="text" id="remarks" name="remarks"></td>
                            </tr>
                        </table>
                        <hr>
                        <div class="bottom-btn">
                            <div class="right-btn">
                                <button class="custom-btn btn-10">추가하기</button>
                                <button type="button" class="btn_close custom-btn btn-10" onclick="btnClose();">닫기
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <label for="popup"></label>
            </div>
    </div>
    </nav>

    <table class="table sec-table table-hover">
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
        <c:forEach var="list" items="${list}">
            <tr
                    data-work-num="${list.work_num}"
                    data-work-name="${list.work_name}"
                    data-pay="${list.pay}"
                    data-fixed-work-days="${list.fixed_work_days}"
                    data-holidays="${list.holidays}"
                    data-remarks="${list.remarks}">
                <td><input type="checkbox"></td>
                <td>${list.work_name}</td>
                <td><fmt:formatNumber value="${list.pay}" type="currency"/></td>
                <td>${list.fixed_work_days}</td>
                <td>${list.holidays}</td>
                <td>${list.remarks}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>
<!-- 수정 dialog -->
<dialog>
    <h3>근로정보</h3>
    <hr>
    <form method="post">
        <table class="rank-table">

        </table>
        <hr>
        <button class="dialogbtn">수정</button>
        <button class="dialogbtn">삭제</button>
        <button class="dialogbtn" onclick="window.dialog.close();">닫기</button>
    </form>
</dialog>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/modal.js"></script>
<script type="text/javascript">

    const dialog = document.querySelector("dialog");
    // dialogPolyfill.registerDialog(dialog);
    $(document).on("click", ".sec-table tbody tr", function () {
        dialog.showModal();

        $workName = $(this).data("work-name")
        $pay = $(this).data("pay")
        $fixedWorkDays = $(this).data("fixed-work-days")
        $weeklyHoliday = $(this).data("holidays")
        $remarks = $(this).data("remarks")

        let str = `
		<tr class="rank-tr1">
                <td>근로정보명</td>
                <td><input type="text" class="rankadd" name="parent_code" value="` + $workName + `"></td>
            </tr>
            <tr class="rank-tr1">
                <td>시급</td>
                <td><input type="text" class="rankadd" name="code_name" value="` + $pay + `"></td>
            </tr>
            <tr class="rank-tr1">
                <td>소정근로요일</td>
                <td>
                <select name="fixedWorkingDay" id="fixedWorkingDay" multiple>
                    <option value="월" >월</option>
                    <option value="화" >화</option>
                    <option value="수" >수</option>
                    <option value="목" >목</option>
                    <option value="금" >금</option>
                    <option value="토">토</option>
                    <option value="일">일</option>
                </select>
                </td>
            </tr>
            <tr class="rank-tr1">
                <td>주휴요일</td>
                <td>
                    <select name="weekly_holiday" id="weekly_holiday" multiple>
                        <option value="월">월</option>
                        <option value="화">화</option>
                        <option value="수">수</option>
                        <option value="목">목</option>
                        <option value="금">금</option>
                        <option value="토">토</option>
                        <option value="일" >일</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>메모</td>
                <td><textarea name="remarks" class="rank-area" cols="70" rows="4">` + $remarks + `</textarea></td>
            </tr>
		`;

        $('dialog table').html(str)
        let arr = $fixedWorkDays.split(",");
        arr.forEach(value => {
            $("#fixedWorkingDay option[value='" + value + "']").prop("selected", true);
        });
        arr = $weeklyHoliday.split(",");
        arr.forEach(value => {
            $("#weekly_holiday option[value='" + value + "']").prop("selected", true);
        });
    });
</script>
</body>
</html>