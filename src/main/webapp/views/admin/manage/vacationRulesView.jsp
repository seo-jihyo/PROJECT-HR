<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>

  <%--jquery--%>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<%--  <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="/assets/css/styles.css">
  <link rel="stylesheet" href="/assets/css/modal.css">
</head>
<body>
<%@include file="/views/include/header.jsp" %>
<section id="body-pd" class="body-pd">
  <div class="main_title">
    <h2>휴가 발생규칙</h2>
    <input type="checkbox" id="popup"> <label class="labelBtn" for="popup">+
    휴가 발생규칙 추가하기</label>
    <div class="modal">
      <div>
        <h3>휴가 발생규칙 추가하기</h3>
        <label for="popup">X</label>
        <hr>
          <div class="tabs">
            <a data-tab="tab-1">기본정보</a>
            <a data-tab="tab-2">월기준 발생</a>
            <a data-tab="tab-3">연 기준 발생</a>
          </div>
          <hr>
          <div class="modal_nav" id="tab-1" style="display: block;">
            <form action="" id="기본정보">
              <label for="휴가그룹">휴가 그룹</label>
              <select name="휴가그룹" id="휴가그룹" multiple required>
                <option value="인사팀" >인사팀</option>
                <option value="개발팀" >개발팀</option>
              </select> <br>
              <label for="규칙명">규칙명</label>
              <input type="text" id="규칙명"> <br>
              <label for="remarks">메모</label> <br>
              <textarea name="remarks" id="remarks" cols="30" rows="2"></textarea>
            </form>
          </div>

          <div class="modal_nav" id="tab-2" style="display: none;">
            <form action="" id="월기준발생">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th>근속월수</th>
                  <th>발생일수</th>
                  <th>유효 개월 수</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><input type="text" name="근속월수" placeholder="근속월수"></td>
                  <td><input type="text" name="발생일수" placeholder="발생 일수"></td>
                  <td><input type="text" name="유효개월수" placeholder="유효 개월 수"></td>
                  <td><button onclick="">삭제하기</button></td>
                </tr>
                <tr>
                  <th colspan="4"><button>추가하기</button></th>
                </tr>
                </tbody>
              </table>
            </form>
          </div>

          <div class="modal_nav"  id="tab-3" style="display: none;">
            <form action="" id="연기준발생" name="frm">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th>연수</th>
                  <th>발생일수</th>
                  <th>시작 월일</th>
                  <th>종료 월일</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><input type="text" name="연수" placeholder="연수"></td>
                  <td><input type="text" name="발생일수" placeholder="발생 일수"></td>
                  <td><input type="text" name="시작월일" placeholder="MM/DD"></td>
                  <td><input type="text" name="종료월일" placeholder="MM/DD"></td>
                  <td><button onclick="">삭제하기</button></td>
                </tr>
                <tr>
                  <th colspan="5"><button>추가하기</button></th>
                </tr>
                </tbody>
              </table>
            </form>
          </div>
          <hr>
          <button type="button" class="btn_close" onclick="btnClose();">닫기</button>
          <input type="button" onclick="testfn(this.form)" form="기본정보" value="추가하기">

      </div>
      <label for="popup"></label>
    </div>

  </div>

  <table class="table table-hover">
    <thead>
    <tr>
      <th>휴가 그룹</th>
      <th>규칙명</th>
      <th>월 기준 발생</th>
      <th>연 기준 발생</th>
      <th>메모</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>연차휴가</td>
      <td>(회계연도 기준)연차 휴가 발생 규칙</td>
      <td>1개</td>
      <td>5개</td>
      <td></td>
    </tr>
    <tr>
      <td>연차휴가</td>
      <td>(회계연도 기준)연차 휴가 발생 규칙</td>
      <td>1개</td>
      <td>5개</td>
      <td></td>
    </tr>
    </tbody>
  </table>
</section>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/modal.js"></script>
<script>
  // 버튼 눌렀을때 해당하는 form 의 ajax 통신
  function testfn(){

    // console.log()
  }
  // $('#휴가그룹').multiselect({
  //   includeSelectAllOption: true,
  //   selectAllText: "전체 선택",
  //   selectAllNumber: false,
  //   nonSelectedText: "선택 안됨",
  //   allSelectedText: "(모든 그룹)",
  //   numberDisplayed: 7,
  // });

  $('.tabs a').click(function(){
    let $tabId = $(this).data('tab')
    console.log($tabId)
    $('.modal_nav').hide()

    $('#'+$tabId).show()
    $('input[type="submit"]').attr('form',$('#'+$tabId).children('form').attr("id"))
  })
</script>
</body>
</html>