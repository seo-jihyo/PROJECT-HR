<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="/assets/css/modal_jy.css">
    <title>Document</title>
</head>
<body>
    <h1>조직 추가하기</h1>
    <hr>
<table>
    <tr>
        <td>조직명</td>
        <td><input type="text"></td>
    </tr>
    <tr>
        <td>상위조직</td>
        <td>  
            <select id="numbers">
                <option value="none">조직없음</option>
                <option value="none">조직없음</option>
            </select>
        </td>
    </tr>
</table>
<p>메모</p>
<textarea></textarea>
<hr>
<button onClick='#'>닫기</button>
<input type="submit" value="추가하기" />
</body>
</html>