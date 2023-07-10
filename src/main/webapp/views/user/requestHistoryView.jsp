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
</head>
<style>
	.title{
	margin: auto;
	margin-top: 20px;
	width: 90%;
	}
	
    .sec-table {
    border-collapse: collapse;
    width: 80%;
    height: 10px;
    text-align: center;
    margin-top: 75px;
    margin-left: 10%;
	}
</style>
<body>
<%@include file="/views/include/header_user.jsp" %>
    <div class="main_title">
    <h1 class="title">요청 내역</h1>
    </div>
    <table class="sec-table table-hover">
        <tr>
            <th>요청종류</th>
            <th>요청 보낸 사람</th>
            <th>요청사항</th>
            <th>요청사유</th>
            <th>상태</th>
            <th>승인권자 노트</th>
            <th>신청일자</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>휴가 생성</td>
            <td>송기석</td>
            <td>6월30일/병가(8h,0일)</td>
            <td>배가아파요</td>
            <td>거절됨<br>이재경(X)</td>
            <td>꾀병인듯</td>
            <td>06/30 14:12</td>
            <td></td>
        </tr>
        <tr>
            <td>휴가 생성</td>
            <td>송기석</td>
            <td>6월30일/병가(8h,0일)</td>
            <td>배가아파요</td>
            <td>대기<br>이재경()</td>
            <td></td>
            <td>06/30 14:12</td>
            <td>
                <button onclick="">취소</button>
            </td>
        </tr>
        <tr>
            <td>휴가 생성</td>
            <td>송기석</td>
            <td>6월30일/병가(8h,0일)</td>
            <td>배가아파요</td>
            <td>승인<br>이재경(O)</td>
            <td></td>
            <td>06/30 14:12</td>
            <td>
            </td>
        </tr>
        </tbody>
    </table>
<script src="/assets/js/main.js"></script>
</body>
</html>