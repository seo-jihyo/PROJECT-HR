<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="/assets/css/view_jy.css">
    
    <title>출퇴근 기록</title>
  </head>
  <body id="body-pd">
  
  
  <div class="main">

    <div class="main_title">
        <h5>내 출퇴근기록</h5>
      <button><a href="/views/user/workRecord/workRecordModal.jsp">출퇴근기록 생성 요청</a></button>
    </div>
    <div class="chekform">
        <input type="date"><br><br> ~ <input type="date"><hr>
        <input type="checkbox">정상적인 기록<br>
        <input type="checkbox">지각 기록<br> 
        <input type="checkbox">조퇴 기록<br> 
        <input type="checkbox">출근 누락 기록<br> 
        <input type="checkbox">퇴근 누락 기록<br>  
    </div>
    <div class="listform">
    <table class="table table-hover">
      <thead>
      <tr>
        <th></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
        <th><input type="text" placeholder="검색.."></th>
      </tr>
      <tr>
 <th style="width:30px"><input type='checkbox' id="chkAll" onclick="allCheckboxes('chk[]', this.checked)"></th>
        <th>날짜</th>
        <th>근무시간</th>
        <th>근무일정</th>
        <th>조직</th>
        <th>직무</th>
        <th>근무노트</th>
        <th>휴게시간</th>
        <th>총 시간</th>
      </tr>
      </thead>
      <tbody>
      <tr>
      <th><input type='checkbox' name = 'chk[]' onclick="isAllCheck(this.name, 'chkAll');"></th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
  
      </tr>
      <tr>
      <th><input type='checkbox' name = 'chk[]' onclick="isAllCheck(this.name, 'chkAll');"></th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
  
      </tr>
      </tbody>
    </table>
  </div>
</div>

  <script src="/assets/js/selectAll.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />
  </body>
</html>