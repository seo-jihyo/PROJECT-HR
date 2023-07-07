<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My Page</title>
   	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<style type="text/css">

body, div {
	margin: 0;
	padding: 0;
	
	align-content: center;
}
.main-table-1 {
	margin: auto;
	margin-top: 60px;
    margin-bottom: 60px;
	width: 80%;
	heignt: 20%;
 	align-content: center;
	border-style: solid;
	border-radius: 5px;
	padding: 30px;
	}
.main-table {
	margin: auto;
	margin-top: 60px;
    margin-bottom: 30px;
	width: 80%;
	heignt: 20%;
 	align-content: center;
	border-style: solid;
	border-radius: 5px;
	padding: 30px;
	}
.modal
th {
	text-align: right;
	width: 200px
}

td {
	text-align: left;
}
h1{
	margin:10px;
}
img{
	width: 200px;
}
.main-hr {
	background-color: #d3d3d3;
	width: 80%;
	margin: auto;
}
.title {
 	width: 80%;
    height: 50px;
    margin: auto;
    margin-top: 30px;
	}
.tabs {
    margin-left: auto;
    width: 90%;
	}
.tabs a{
	float: left;
	width: 90px;
	height: 32px;
	text-align: center;
	line-height: 32px; 
	cursor:pointer;
	margin: auto;
	}

.tabs a:hover{
	border-bottom: solid 2px;
}
.tabs a:active {
	border-bottom: solid 2px;
}
.tabs a:focus {
	color: red;
}
.info-table {
	padding: 20px 20px;
	width: 100%;
}
.info-table tr {
	margin: 5px;
}
.info-table tr td {
	padding: 7px;
	font-size: 15px;
}
.infoupdate{
	height: 25px;
	border: 1px solid black;
}
.info-area{
	height: 200px;
	border: 1px solid black;
}
dialog{
	width: 40%;
	height: 65%;
	top:20%;
	left: 33%	
}
#modal1{
	width: 40%;
	height: 40%;
	top:20%;
	left: 33%	
}
#modal4{
	width: 40%;
	height:60%;
	top:20%;
	left: 33%	
}
.updatebtn{
	float: right;
	margin-right: 10%;
}
.updatebtn{
	color: white;
	background-color:  rgb(4, 4, 80);
	width: 70px;
	height:	30px;
	border-radius: 8px;
	transition: all 0.4s;
	cursor: pointer;
	border: 1.5px solid rgb(4, 4, 80);
	font-size: 16px;
}

.updatebtn:hover{
    background-color: white;
    color: black;
}
</style> 
<body>
  <%@include file="/views/include/header_user.jsp" %>

		<div>
			<h1 class="title">내 인사정보</h1><br>
			<hr class="main-hr">
			<table class="main-table-1">
				<tr>
					<td rowspan="5" width="300px"> <img src=#></td>
					<th>성함</th> 	<td> </td>
					<th>사원번호</th> 	<td> </td>
					<th>직통번호</th> 	<td> </td>
				</tr>
				<tr>
					<th>부서</th> 	<td></td>
					<th>직급</th> 	<td></td>
					<th>권한타입</th> 	<td></td>
				</tr>
				<tr>
					<th>연차수</th> 	<td></td>
					<th>입사일</th> 	<td></td>
					<th>퇴사일</th> 	<td></td>
				</tr>
			</table>
		</div>
		
		<!-- 탭 메뉴--><!-- 인사정보 개인정보 인사발령 경력·학력 포상·징계 인사평가 -->
		<hr  class="main-hr">
		<div class="tabs">
  			<a data-tab="tab-1">개인정보</a>
  			<a data-tab="tab-2">경력</a>
  			<a data-tab="tab-3">학력</a>
  			<a data-tab="tab-4">자격증</a>
		</div>
		<br>
		<!-- 내용 -->
		<div class="modal-nav" id="tab-1" style="display: block;">
			<table class="main-table"> 
				<tr>
					<td>성함</td> 		<td></td>
					<td>이메일</td> 		<td></td>
					<td>휴대전화</td> 		<td></td>
				</tr>
				<tr>
					<td>우편번호</td> 		<td></td>
					<td>주소</td> 		<td></td>
					<td>상세주소</td> 		<td></td>
				</tr>
			</table> 
			<button class="updatebtn" onclick='updateView("modal1")'>수정</button> 
	</div>
	<!--------------- modal ---------------->
	<dialog id="modal1">
		<h1>개인정보 수정</h1><hr>
		<form method="dialog">
		<table class="info-table table" >
			<tr class="info-tr1">
				<td>성함</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>이메일</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>휴대전화</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>우편번호</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>주소</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>상세주소</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>

		</table>

		<hr>
		<input type="submit" value="전송">
		<!-- <button class="dialogbtn" type="button" >삭제</button> -->
		<button  class="dialogbtn" type="button"  onclick="dialogClose();">닫기</button>
	
	</form>
	</dialog> 
	
		<!------ tab2 ------>
		<div class="modal-nav" id="tab-2" style="display: none;">
			<table class="main-table">
				<tr>
					<td>경력번호</td> 		<td></td>
					<td>회사명</td> 		<td></td>
					<td>부서명</td> 		<td></td>
				</tr>
				<tr>
					<td>직급</td> 		<td></td>
					<td>주요업무</td> 		<td></td>
					<td>입사년월</td> 		<td></td>
				</tr>
				<tr>
					<td>퇴사년월</td> 		<td></td>
					<td>비고</td> 		<td></td>
				</tr>
				<p>
			</table>
			<button class="updatebtn" onclick='updateView("modal2")'>수정</button>    
		</div>
		<!--------------- modal2 ---------------->
		<dialog id="modal2">
			<h1>경력 수정</h1><hr>
			<form method="dialog">
			<table class="info-table table" >
			<tr class="info-tr1">
				<td>경력번호</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>회사명</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>부서명</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>직급</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>주요업무</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>입사년월</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>퇴사년월</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr>
				<td>비고</td>
				<td><textarea name="remarks" class="info-area" cols="70" rows="4"></textarea></td>
			</tr>
		</table>

		<hr>
		<input type="submit" value="전송">
		<button class="dialogbtn" type="button" >삭제</button>
		<button  class="dialogbtn" type="button"  onclick="dialogClose();">닫기</button>
	</form>
	</dialog> 
	<!------ tab3 ------>	
		<div class="modal-nav" id="tab-3" style="display: none;">
			<table class="main-table">
				<tr>
					<td>학력번호</td> 		<td></td>
					<td>학교명</td> 		<td></td>
					<td>학과</td> 		<td></td>
				</tr>
				<tr>
					<td>입학년월</td> 		<td></td>
					<td>졸업년월</td> 		<td></td>
					<td>졸업상태</td> 		<td></td>
				</tr>
				<tr>
					<td>비고</td> 		<td></td>
				</tr>
			</table>   
			<button class="updatebtn" onclick='updateView("modal3")'>수정</button> 
		</div>
	<!--------------- modal3 ---------------->
	<dialog id="modal3">
	<h1>학력 수정</h1><hr>
	<form method="dialog">
		<table class="info-table table" >
			<tr class="info-tr1">
				<td>학력번호</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>학교명</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>학과</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>입학년월</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>졸업년월</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>졸업상태</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr>
				<td>비고</td>
				<td><textarea name="remarks" class="info-area" cols="70" rows="4"></textarea></td>
			</tr>
		</table>

		<hr>
		<input type="submit" value="전송">
		<button class="dialogbtn" type="button" >삭제</button>
		<button  class="dialogbtn" type="button"  onclick="dialogClose();">닫기</button>
	</form>
	</dialog> 
	<!--------------- modal4 ---------------->	
		<div class="modal-nav" id="tab-4" style="display: none;">
		<table class="main-table">
				<tr>
					<td>자격증번호</td> 	<td></td>
					<td>자격증명</td> 		<td></td>
					<td>발행처</td> 		<td></td>
				</tr>
				<tr>
					<td>취득년월</td> 		<td></td>
					<td>비고</td> 		<td></td>
				</tr>
			</table> 
			<button class="updatebtn" onclick='updateView("modal4")'>수정</button>  
		</div>
		<dialog id="modal4">
		<h1>자격증 수정</h1><hr>
	<form method="dialog">
		<table class="info-table table" >
			<tr class="info-tr1">
				<td>자격증번호</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>자격증명</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>발행처</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>취득년월</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<td>주소</td>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
			<tr>
				<td>비고</td>
				<td><textarea name="remarks" class="info-area" cols="70" rows="4"></textarea></td>
			</tr>
		</table>

		<hr>
		<!-- 
		<div class="dialog-btn">
			<button class="dialogbtn">수정</button>
			<button class="dialogbtn" onclick="window.dialog.close();">닫기</button>
		</div>
		-->
		<input type="submit" value="전송">
		<button class="dialogbtn" type="button" >삭제</button>
		<button  class="dialogbtn" type="button"  onclick="dialogClose();">닫기</button>
	</form>
	</dialog> 
		<!-- <div class="modal-nav" id="tab-5" style="display: none;"></div>
		<div class="modal-nav" id="tab-6" style="display: none;"></div>
 		-->

<script src="/assets/js/main.js"></script>	
<script>
 	$('.tabs a').click(function(){
	 	 let $tabId = $(this).data('tab')
	 	$('.modal-nav').hide()

	  	$('#'+$tabId).show()
	  	$('input[type="submit"]').attr('form',$('#'+$tabId).children('form').attr("id"))

	  	// 버튼 스타일 변경
	  	$('.tabs a').css('border-bottom', ''); // 모든 버튼의 스타일 초기화
	  	$(this).css('border-bottom', 'solid 2px'); // 눌러진 버튼의 스타일 변경
		})
   
		//dialog 띄우는 버튼
		$(document).on("click", ".modal-nav", function () {
		const dialog =$(this).attr("id");
		console.log(dialog);
	        $('#' + dialog).showModal();
	        console.log(this);
	    });

	    $(document).on("click",".modal-nav",function (){
	        $td = $(this).children('td')
	        let str = '';
	        $.each($td,(i,item)=>{
	            str +='값='+ item.innerText +'<br>'
	        })
	        console.log(str)
	    })
	    
   		function updateView(input){
        const dialog = document.querySelector('#'+input)
        dialog.showModal()
    	}
	    
	    //dialog 삭제
	    const dialog = document.querySelector("dialog");
	    $(document).on("click", ".table tbody tr", function () {
	    	dialog.showModal();
	    	console.log(this);
	    });
	    function dialogClose(){
	    	dialog.close();
	    }  
</script>
</body>	
</html>