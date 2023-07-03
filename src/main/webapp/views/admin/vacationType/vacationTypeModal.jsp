<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/modal_jy.css">
    <title>휴가유형관리 모달창</title>
</head>
<body>
    <h1>휴가 유형 추가하기</h1>
    <hr>

<table>
    <!-- <tr>
        <td>휴가 그룹</td>
        <td>  
            <select id="numbers">
                <option value="none">휴가 그룹 없음</option>
                <option value="none"></option>
            </select>
        </td>
    </tr> -->
    <tr>
        <td>이름</td>
        <td><input type="text"></td>
    </tr>

    <tr>
        <td>조직</td>
        <td>  
            <select id="a">
                <option value="none">(모든 조직)</option>
                <option value="none"></option>
            </select>
        </td>
    </tr>

    <tr>
        <td>직무</td>
        <td>  
            <select id="b">
                <option value="none">(모든 직무)</option>
                <option value="none"></option>
            </select>
        </td>
    </tr>

    <tr>
        <td>시간옵션</td>
        <td>  
            <input type="radio" name="time" value="1">시간 입력
            <input type="radio" name="time" class="time-in" value="2">하루 종일
        </td>
    </tr>

    <tr>
        <td>유급 시간(h)</td>
        <td><input type="text"></td>
    </tr>
    <tr>
        <td>차감 일수</td>
        <td><input type="text"></td>
    </tr>
</table>
<!-- <div class="time-input"> -->
    <p class="title-vac">시간 입력 방식</p>
    <p>시간 고정 여부</p>
        <input type="radio" name="fix" value="1">유급시간 기반 고정
        <input type="radio" name="fix" class="fix-no" value="2">고정 안함
        <div class="fix-time">
            <p>기본 시간(h) &nbsp;<input type="text"></p>
        </div>
<!-- </div> -->

<p class="title-vac">고급 설정</p>
<input type="checkbox">사유 표시<hr>
<p>메모</p>
<textarea class="vactext"></textarea><br><br>

<button onClick='#'>닫기</button>
<input type="submit" value="추가하기" />

</body>
</html>