<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="/assets/css/modal_jy.css">
    <title>출퇴근 기록 모달창</title>
</head>
<body>
    <h1>출퇴근기록 생성 요청</h1>
    
    <p>날짜</p>
    <input type="date">
    <p>근무일정</p>
    <select id="numbers">
        <option value="none">무일정근무</option>
        <option value="none"></option>
    </select>
    <p>조직</p>
    <select id="numbers">
        <option value="none">선택안됨</option>
        <option value="none"></option>
    </select>
    <p>직무</p>
    <select id="numbers">
        <option value="none">선택안됨</option>
        <option value="none"></option>d
    </select>
    <p>출근 시간</p>
    <input type="text" class="workrectime" value="09"> : <input type="text" class="workrectime" value="00">
    <p>퇴근시간</p>
    <input type="text" class="hometime" value="18"> : <input type="text" class="hometime"  value="00"><br>
<!--     <br><input type="checkbox" class="working"> 현재 근무중<br> -->
    
<!--             
	<p>승인권자</p>
        <select id="numbers">
            <option value="none">선택 가능한 옵션 없음</option>
            <option value="none"></option>
        </select>
        <p>참조자</p>
        <select id="numbers">
            <option value="none">선택 가능한 옵션 없음</option>
            <option value="none"></option>
        </select> -->
        <p>요청 사유</p>
        <textarea class="reviewtext" placeholder="요청 사유 입력"></textarea><br><br>
        <button onClick='#'>닫기</button>
	<input type="submit" value="추가하기" />

    
