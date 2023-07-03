<%--
  Created by IntelliJ IDEA.
  User: thdrl
  Date: 2023-07-01
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PROJECT-HR</title>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>

    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
</head>
<body>

<div>
    <h3>근로정보 추가하기</h2>
</div>
<hr>
<div class="modal_nav">
    <p>기본정보</p>
    <hr>
    <form action="">
        <label for="workName">근로정보명</label>
        <input type="text" id="workName" name="workName"> <br>
        <label for="pay">시급(&#8361;)</label>
        <input type="number" value="0" id="pay" name="workName"> <br>
        <label for="fixedWorkingDay">소정근로요일</label>
        <select name="fixedWorkingDay" id="fixedWorkingDay" multiple>
            <option value="mon" selected>월</option>
            <option value="tue" selected>화</option>
            <option value="wed" selected>수</option>
            <option value="thu" selected>목</option>
            <option value="fri" selected>금</option>
            <option value="sat">토</option>
            <option value="sun">일</option>
        </select> <br>
        <label for="weekly_holiday">주휴요일</label>
        <select name="weekly_holiday" id="weekly_holiday" multiple>
            <option value="mon">월</option>
            <option value="tue">화</option>
            <option value="wed">수</option>
            <option value="thu">목</option>
            <option value="fri">금</option>
            <option value="sat">토</option>
            <option value="sun" selected>일</option>
        </select> <br> <br>
        <label for="remarks">메모</label>
        <input type="text" id="remarks" name="remarks">
        <hr>
        <input type="button" onclick="" value="닫기">
        <input type="submit" value="추가하기">
    </form>


</div>

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
