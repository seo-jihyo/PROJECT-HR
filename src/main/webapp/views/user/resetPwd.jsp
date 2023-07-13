<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
</head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body{
  min-height: 100vh;
  width: 100%;
  background: #172b4d;
}
.container{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  max-width: 430px;
  width: 100%;
  background: #fff;
  border-radius: 7px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.3);
}
.container .registration{
  display: none;
}
#check:checked ~ .registration{
  display: block;
}
#check:checked ~ .login{
  display: none;
}
#check{
  display: none;
}
.container .form{
  padding: 2rem;
}
.form header{
  font-size: 2rem;
  font-weight: 500;
  text-align: center;
  margin-bottom: 1.5rem;
}
 .form input{
   height: 60px;
   width: 100%;
   padding: 0 15px;
   font-size: 17px;
   margin-bottom: 1.3rem;
   border: 1px solid #ddd;
   border-radius: 6px;
   outline: none;
 }
 .form input:focus{
   box-shadow: 0 1px 0 rgba(0,0,0,0.2);
 }
.form a{
  font-size: 16px;
  color: #172b4d;
  text-decoration: none;
}
.form a:hover{
  text-decoration: underline;
}
.form input.button{
  color: #fff;
  background:#172b4d;
  font-size: 1.2rem;
  font-weight: 500;
  letter-spacing: 1px;
  margin-top: 1.7rem;
  cursor: pointer;
  transition: 0.4s;
}
.form input.button:hover{
  color: black;
  background: #fff;
  border: 1px solid #172b4d;
}
.form .column {
  display: flex;
  column-gap: 15px;
}
.signup{
  font-size: 17px;
  text-align: center;
}
.signup label{
  color: #5e5e7c;
  cursor: pointer;
}
.signup label:hover{
  text-decoration: underline;
}
</style>
<body>
	<div class="container">

		<input type="text" id="check">

		<div class="login form">
			<header>비밀번호 재설정</header>

			<form method="post" action="/updatePwdok.do" name="frm">
				<input type="hidden" value="${param.email}" name="email">
				<input type="password" class="pwd" name="pwd" placeholder="비밀번호">
				<input type="password" class="pwd-again" name="pwd-again" placeholder="비밀번호 재입력">

				<input type="button" id="searchBtn" class="button" value="Verify" onclick="send(this.form)">
			</form>
		</div>

	</div>
<script type="text/javascript">
	function send(input) {
		var pwd = document.querySelector(".pwd");
		var pwdAgain = document.querySelector(".pwd-again");
		var pwdLength = pwd.length;
		
		if(pwdLength < 4 || pwdLength > 12) {
			alert("....");
			alert("비밀번호는 4~12자리 이내로 설정해주세요.");
			document.querySelector("input[name='pwd']").focus();
			return false;
		}
		if(pwd.value == pwdAgain.value) {
			alert("비밀번호가 재설정되었습니다.");
			input.submit();
		} else {
			alert("비밀번호가 일치하지 않습니다.");
			pwd.value = "";
			pwdAgain.value = "";
			pwd.focus();
		}
	}

</script>
</body>
</html>