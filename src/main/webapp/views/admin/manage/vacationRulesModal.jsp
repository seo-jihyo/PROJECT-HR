<%--
  Created by IntelliJ IDEA.
  User: thdrl
  Date: 2023-07-01
  Time: 오후 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>PROJECT-HR</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">

</head>
<body>
<div>
  <h3>휴가 발생 규칙 추가하기</h3>
</div>

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
<input type="button" onclick="" value="닫기">
<input type="button" onclick="testfn(this.form)" form="기본정보" value="추가하기">
<script>
  // 버튼 눌렀을때 해당하는 form 의 ajax 통신
  function testfn(){

    // console.log()
  }

  $('#휴가그룹').multiselect({
    includeSelectAllOption: true,
    selectAllText: "전체 선택",
    selectAllNumber: false,
    nonSelectedText: "선택 안됨",
    allSelectedText: "(모든 그룹)",
    numberDisplayed: 7,
  });

  $('.tabs a').click(function(){
    let $tabId = $(this).data('tab')
    $('.modal_nav').hide()

    $('#'+$tabId).show()
    $('input[type="submit"]').attr('form',$('#'+$tabId).children('form').attr("id"))
  })


</script>
</body>
</html>
