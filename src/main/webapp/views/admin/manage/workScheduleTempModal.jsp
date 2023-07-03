<%--
  Created by IntelliJ IDEA.
  User: thdrl
  Date: 2023-07-01
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PROJECT-HR</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
</head>
<body>
<div>
    <h3>템플릿 추가하기</h3>
</div>
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
        <input type="button" onclick="" value="닫기">
        <input type="submit" value="추가하기">
    </form>
</div>
<script>
    $('#근무일정유형').multiselect({
        includeSelectAllOption: true,
        selectAllText: "전체 선택",
        selectAllNumber: false,
        nonSelectedText: "조직을 선택해주세요",
        allSelectedText: "(모든 조직)",
        numberDisplayed: 7,
    });
    $('#조직').multiselect({
        includeSelectAllOption: true,
        selectAllText: "전체 선택",
        selectAllNumber: false,
        nonSelectedText: "조직을 선택해주세요",
        allSelectedText: "(모든 조직)",
        numberDisplayed: 7,
    });
    $('#직무').multiselect({
        includeSelectAllOption: true,
        selectAllText: "전체 선택",
        selectAllNumber: false,
        nonSelectedText: "직무를 선택해주세요",
        allSelectedText: "(모든 직무)",
        numberDisplayed: 7,
    });
</script>
</body>
</html>
