<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>LoginForm</title>
  <%--jquery--%>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
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
			<header>Login</header>

			<form name="frm">

				<input type="email" name="email" placeholder="아이디를 입력하세요. ">
				<input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">

				<input type="button" class="button" value="Login"
					onclick="return loginCheck();">
			</form>

			<div class="signup">
				<div class="column">
					<input type="button" value="ID/비밀번호 찾기" class="searchpwd"
						onclick="location.href='/searchId.do'">
				</div>
			</div>
		</div>

	</div>

	<script>
		function loginCheck() {
			var email = document.querySelector("input[name='email']").value;
			var emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var pwd = document.querySelector("input[name='pwd']").value;
			var pwdLength = pwd.length;
			
			if (emailRegex.test(email) == false) {
				alert('아이디는 이메일 형식에 맞게 입력하세요.');
				document.querySelector("input[name='email']").focus();
				return false;
			}
			if(pwdLength < 4 || pwdLength > 12) {
				alert("비밀번호는 4~12자리 이내로 설정해주세요.");
				document.querySelector("input[name='pwd']").focus();
				return false;
			}
			
			const $frm = $('form[name="frm"]').serialize();
			console.log($frm)
			$.ajax({
				url : "/loginok.do",
				type : "post",
				data : $frm,
				dataType : "json",
				success : sucFuncJson,
				error : errFunc
			});
			function sucFuncJson(data) {
				if (data.email == null) {
					alert(data.errMsg);
				} else if (data.email != null) {
					window.location.href = "/index.jsp";
				}
			}

			function errFunc(e) {
				alert("실패" + e.status)
			}
		}
	</script>
</body>
</html>