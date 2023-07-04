<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<title>JoinForm</title>
  </head>
  <style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "나눔고딕", sans-serif;
}
body {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background:#172b4d;
}
.container {
  position: relative;
  max-width: 700px;
  width: 100%;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}
.container header {
  font-size: 1.5rem;
  color: #333;
  font-weight: 700;
  text-align: center;

}
.container .form {
  margin-top: 30px;
}
.form .input-box {
  width: 100%;
  margin-top: 20px;
}
.input-box label {
  color: #333;
}
.form :where(.input-box input ) {
  position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.input-box input:focus {
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.form .column {
  display: flex;
  column-gap: 15px;
}
.address :where(input) {
  margin-top: 15px;
}

.form .submit {
  height: 55px;
  width: 100%;
  color: #fff;
  font-size: 1rem;
  font-weight: 600;
  margin-top: 30px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  background: #172b4d;
  border-radius: 10px;
}
.form .submit:hover {
  background:rgb(128, 128, 128);
}

.form select {
  width: 50%;
  margin-top: 10px;
}


/*Responsive*/
@media screen and (max-width: 500px) {
  .form .column {
    flex-wrap: wrap;
  }
}
  </style>
  <body>
    <section class="container">
      <header>회원가입</header>
      <form action="#" class="form">
        
        <div class="input-box">
          <label>ID</label>
          <input type="ID" placeholder="ID 입력" required />
        </div>
        <div class="input-box">
          <label>Password</label>
          <input type="Password" placeholder="Password 입력" required />
          <input type="Password" placeholder="Password 재입력" required />
        </div>

        <div class="input-box">
          <label>Name</label>
          <input type="text" placeholder="이름 입력" required />
        </div>

        <div class="column">
          <div class="input-box">
            <label>Phone Number</label>
            <input type="tel" placeholder="연락처 입력" required />
          </div>
          <div class="input-box">
            <label>Birth Date</label>
            <input type="date"  required />
          </div>
        </div>

        <div class="input-box address">
          <label>Address</label>
          <div class="column">          
          	<input type="text" placeholder="우편번호" readonly />
         	<input type="button" value="우편번호 찾기">
          </div>

          <input type="text" placeholder="도로명 주소" required />
          <input type="text" placeholder="상세 주소" required />
        </div>
        
        <div class="input-box">
          <label>Check</label>
          <div class="column">      
          	<select name="Check">
          	 <option selected disabled hidden>질문을 선택하세요.</option>
          	 	<option value="1">좋아하는 노래는?</option>
                <option value="2">데드풀</option>
                <option value="3">스파이더맨</option>
          	</select>
          <input type="text" placeholder="입력" required />
          </div>
        </div>
        
        <input type="submit" value="회원가입" class="submit">
       
      </form>
    </section>
  </body>
</html>