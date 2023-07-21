<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내 출퇴근기록</title>
    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <!-- datepicker -->
    <link rel="stylesheet"
          href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/modal.css">
    <style type="text/css">
.tab-scroll {
	width: 90%;
	margin: auto;
}

.sec-table {
	margin: 32px auto;
	width: 90%;
}

.worrectitle {
	margin: auto;
	margin-top: 20px;
	width: 90%;
}

.workdate {
	margin-top: 20px;
	display: inline-block;
	width: 150px;
	height: 30px;
	border: solid 1px black;
}

.side {
	margin-top: 20px;
	margin-right: 40px;
	display: inline-block;
	float: right;
}

.side select {
	width: 150px;
	height: 30px;
	border: solid 1px black;
}

.workrec-table th {
	padding: 20px 20px;
	text-align: left;
}

.workmodal-table {
	padding: 20px 20px;
	width: 100%;
}

.workmodal-table tr {
	margin: 5px;
}

.workmodal-table tr td {
	padding: 7px;
	font-size: 15px;
}

.workadd {
	height: 30px;
	width: 150px;
	border: 1px solid black;
}

.twomodal {
	letter-spacing: 30px;
	padding: 0px;
}

.workmodal-table th {
	text-align: left;
}

.bottom-btn {
	margin-top: 10px;
}
</style>
</head>
<body>
<%@include file="/views/include/header_user.jsp" %>

    <h1 class="worrectitle">내 출퇴근기록</h1>
    <br>
    <div class="tab-scroll">
    <input type="text" class="dp" id="datepicker1" name="a"> - <input
        type="text" class="dp" id="datepicker2" name='b'>
    <div class="side">
        <!-- 출퇴근기록 생성 요청 -->
        <input type="checkbox" id="popup"><label class="labelBtn searchs" for="popup">+ 출퇴근기록 생성 요청</label>
        <div class="modal" style="display: hidden;">
            <div class="modal-content">
                <label for="popup">x</label>
                <h1>출퇴근기록 생성 요청</h1>
                <hr>
                <form method="get" action="/workrecordInsertAtt.do" id="frm">
                    <table class="workmodal-table">
                        <tr class="rank-tr1">
                            <th class="twomodal">날짜</th>
                            <td><input type="date" class="workadd" name="cmt_date"></td>
                        </tr>
                        <tr class="work-tr1">
                            <th>출근시간</th>
                            <td><input type="time" class="workadd" name="go_work"></td>
                            <th>퇴근시간</th>
                            <td><input type="time" class="workadd" name="leave_work"></td>
                            <td><input type="hidden" name="request_type" value="A"></td>
                        </tr>
                        <tr>
                            <td>
                        </tr>
                    </table>
                </form>
                <hr>
                <div class="bottom-btn">
                    <div class="right-btn">
                        <button class="custom-btn btn-10" form="frm">요청하기</button>
                        <button type="button" class="btn_close custom-btn btn-10" onclick="btnClose();">닫기</button>
                    </div>
                </div>
            </div>
            <label for="popup"></label>
        </div>
    </div>
</div>
<table class="sec-table table-hover table my-table" id="mainTable">
    <thead class="thead">
    <tr>

        <th>직원</th>
        <th>날짜</th>
        <th>출근시간</th>
        <th>퇴근시간</th>
        <th>휴게시간</th>
        <th>근무시간합계</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="rcd" items="${rcdlist}">
        <tr data-att-num="${rcd.att_num}"
            data-name="${rcd.emp_name}"
            data-date='<fmt:formatDate  value="${rcd.go_work}" pattern="yyyy-MM-dd"/>'
            data-go-time='<fmt:formatDate  value="${rcd.go_work}" pattern="HH:mm"/>'
            data-leave-time='<fmt:formatDate  value="${rcd.leave_work}" pattern="HH:mm"/>'
            data-break="${rcd.break_time}"
            data-total="${rcd.work_time}">

            <td>${rcd.emp_name}</td>
            <td><fmt:formatDate value="${rcd.go_work}" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${rcd.go_work}" pattern="HH:mm"/></td>
            <td><fmt:formatDate value="${rcd.leave_work}" pattern="HH:mm"/></td>
            <td>
                <!-- 근무시간 7시간 초과 시 휴게시간 1, 8시간 미만일 때 휴게시간 0 -->
                <c:choose>
                    <c:when test="${rcd.work_time >= 8 }">
                        ${rcd.break_time}
                    </c:when>
                    <c:otherwise>
                        ${rcd.break_time -1}
                    </c:otherwise>
                </c:choose>
            </td>

            <td><!-- 근무시간 7시간 초과 시 - 1 (휴게시간) -->
                <c:choose>
                    <c:when test="${rcd.work_time >= 8}">
                        ${rcd.work_time - 1}
                    </c:when>
                    <c:otherwise>
                        ${rcd.work_time}
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">
    <i class='bx bxs-chevron-left'></i>
    <ol id="pagingNumbers">
    </ol>
    <i class='bx bxs-chevron-right'></i>
</div>
<script type="text/javascript">
    $(function () {
        $('.dp').datepicker({
            onSelect: function () {
                let datepicker1 = document.querySelector('#datepicker1');
                let datepicker2 = document.querySelector('#datepicker2');
                $.ajax({
                    type: "post",
                    data: {
                        "datepicker1": datepicker1.value,
                        "datepicker2": datepicker2.value,
                    },
                    url: "/searchWorkRecByDate.do",
                    dataType: "json",
                    success: sucFuncJson,
                    error: errFunc
                });

                function sucFuncJson(data) {
                    console.log(data);
                    $('#mainTable tbody').html(htmlStr(data));
                    if (data) {
                        if (data.result == true) {
                            alert("검색 성공");
                        }
                    } else {
                        alert("검색 실패");
                    }
                }

                function errFunc(e) {
                    console.log(e)
                    alert("실패" + e.status)
                }

                function htmlStr(data) {
                    let html = '';
                    data.forEach(value => {
                        const goWork = moment(value.go_work, 'MMM DD, YYYY, h:mm:ss A').format('YYYY-MM-DD');
                        const goWorkTime = moment(value.go_work, 'MMM DD, YYYY, h:mm:ss A').format('HH:mm');
                        const leaveWork = moment(value.leave_work, 'MMM DD, YYYY, h:mm:ss A').format('HH:mm');

                        html += `
                        <tr>

                            <td>`+value.emp_name+`</td>
                            <td>`+goWork+`</td>
                            <td>`+goWorkTime+`</td>
                            <td>`+leaveWork+`</td>
                            <td>
                                <!-- 근무시간 7시간 초과 시 휴게시간 1, 8시간 미만일 때 휴게시간 0 -->
                                <c:choose>
                                    <c:when test="`+value.work_time >= 8+`">
                                        `+value.break_time+`
                                    </c:when>
                                    <c:otherwise>
                                        `+(value.break_time-1)+`
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td><!-- 근무시간 7시간 초과 시 - 1 (휴게시간) -->
                                <c:choose>
                                    <c:when test="`+value.work_time >= 8+`">
                                        `+(value.work_time-1)+`
                                    </c:when>
                                    <c:otherwise>
                                        `+value.work_time+`
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    `;
                    })
                    return html;
                }
            }
        });
    })

</script>
<script src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/modal.js"></script>
<script src="/assets/js/moment.js"></script>
<script>
    updateRowsPerPage(17);
</script>
</body>
</html>