<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>LoginForm</title>
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
      
      <form action="#">
      
        <input type="text" placeholder="아이디를 입력하세요. ">
        <input type="password" placeholder="비밀번호를 입력하세요.">
 		
        <input type="submit" class="button" value="Login">
      </form>
      
      <div class="signup"> 
 		  <div class="column">      
        	<input type="button" value="회원가입" class="signup" onClick="location.href='/views/user/registration.jsp'">
        	<input type="button" value="ID/비밀번호 찾기" class="searchpwd" onclick="">
          </div>
      </div>
    </div>

  </div>
</body>
</html>