<%--
  Created by IntelliJ IDEA.
  User: thdrl
  Date: 2023-07-01
  Time: 오후 12:55
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
    <h3>근무일정 유형 추가하기</h3>
</div>
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
        <input type="button" onclick="" value="닫기">
        <input type="submit" value="추가하기">
    </form>


</div>
<script>
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
