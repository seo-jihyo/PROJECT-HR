/* 출퇴근 버튼 토글 및 ajax */


let storageAttState = localStorage.getItem('attendanceState');
if(storageAttState!=null && storageAttState == 1){
    document.getElementById("rounded").checked = true;
}

let attState = document.getElementById('rounded')
$('#rounded').click(function () {

    const state = this.checked ? 1 : 0;

    $.ajax({
        url: "/check-attendance.do",
        type: "post",
        data: {"attState": state},
        dataType: "json",
        success: sucFuncJson,
        error: errFunc
    });

    function sucFuncJson(data) {
        const status = data.status;
        if (status == "true") {
            localStorage.setItem('attendanceState', state);

        } else if (status == "false") {
            alert("에러발생: <br>" + data.error)
        }
    }

    function errFunc(e) {
        alert("실패" + e.status)
    }

})

const showMenu = (toggleId, navbarId, sectionId)=>{
  const toggle = document.getElementById(toggleId),
      navbar = document.getElementById(navbarId),
      sectionpadding=document.getElementById(sectionId)

  if(toggle && navbar){
    toggle.addEventListener('click', ()=>{
      navbar.classList.toggle('expander')

      sectionpadding.classList.toggle('body-pd')
    })
  }
}
showMenu('nav-toggle','navbar','body-pd')

const linkColor = document.querySelectorAll('.nav_link')
function colorLink(){
  linkColor.forEach(l=> l.classList.remove('active'))
  this.classList.add('active')
}
linkColor.forEach(l=> l.addEventListener('click', colorLink))

const linkCollapse = document.getElementsByClassName('collapse_link')
var i

for(i = 0 ; i<linkCollapse.length; i++){
  linkCollapse[i].addEventListener('click', function(){
    const collapseMenu = this.nextElementSibling
    collapseMenu.classList.toggle('showCollapse')

    const rotate = collapseMenu.previousElementSibling
    rotate.classList.toggle('rotate')
  })
}

// datepicker
$(function() {
    //모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
    });

    //input을 datepicker로 선언
    $("#datepicker1").datepicker();                    
    $("#datepicker2").datepicker();
    
    //From의 초기값을 오늘 날짜로 설정
    $('#datepicker1').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    //To의 초기값을 내일로 설정
    $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
});


// 페이징
let rowsPerPage = 0; // 전역 변수로 설정
function updateRowsPerPage(newRowsPerPage) {
    rowsPerPage = newRowsPerPage!=null?newRowsPerPage:18;
    initPagination();
}
function initPagination() {
    const rows = document.querySelectorAll('.my-table tbody tr');
    const rowsCount = rows.length;
    const pageCount = Math.ceil(rowsCount/rowsPerPage);

    const pagingNumbers = document.querySelector('#pagingNumbers');
// 변수 추가
    const prevPageBtn = document.querySelector('.pagination .bxs-chevron-left');
    const nextPageBtn = document.querySelector('.pagination .bxs-chevron-right');
    let pageActiveIdx = 0; // 현재 보고 있는 페이지그룹 번호
    let currentPageNum = 0; // 현재 보고 있는 페이지네이션 번호
    let maxPageNum = 5; // 페이지 그룹 최대 개수

    for(let i = 1;i <= pageCount; i++){
        /*    console.log(i); */
        pagingNumbers.innerHTML += '<li><a href="">'+i+'</a></li>';
    }

    const pagingBtn = pagingNumbers.querySelectorAll('a');
    console.log(pagingBtn);

// 페이지네이션 번호 감추기
    for(pb of pagingBtn){
        pb.style.display='none';
    }

// 클릭 이벤트 처리(active)
    pagingBtn.forEach((item,idx)=>{
        item.addEventListener('click',(e)=>{
            e.preventDefault();
            // 테이블 출력 함수
            displayRow(idx);
        });
    });
    function displayRow(idx){
        // 배열 만들기
        let start = idx*rowsPerPage;
        let end = start+rowsPerPage;
        let rowsArray = [...rows];

        for(ra of rowsArray){
            ra.style.display = 'none';
        }
        let newRows = rowsArray.slice(start,end);
        for(nr of newRows){
            nr.style.display= '';
        }
        for(pb of pagingBtn){
            pb.classList.remove('active');
        }
        pagingBtn[idx].classList.add('active');

    } // displayRow

    displayRow(0);
// 페이지네이션 그룹 표시 함수
    function displayPage(num){
        // 페이지네이션 번호 감추기
        for(pb of pagingBtn){
            pb.style.display='none';
        }
        let totalPageCount = Math.ceil(pageCount/maxPageNum);

        let pageArr = [...pagingBtn];
        let start = num*maxPageNum;
        let end = start+maxPageNum;
        let PageListArr = pageArr.slice(start, end);


        for(let item of PageListArr){
            item.style.display = 'block';
        }
        if(pageActiveIdx == 0){
            prevPageBtn.style.display = 'none';
        } else{
            prevPageBtn.style.display = 'block';
        }
        if(pageActiveIdx == totalPageCount - 1){
            nextPageBtn.style.display = 'none';
        } else{
            nextPageBtn.style.display = 'block';
        }
    }
    displayPage(0);

    nextPageBtn.addEventListener('click',()=>{
        let nextPageBtn = pageActiveIdx*maxPageNum+maxPageNum;
        displayRow(nextPageBtn);
        ++pageActiveIdx;
        displayPage(pageActiveIdx);
    });
    prevPageBtn.addEventListener('click',()=>{
        let nextPageBtn = pageActiveIdx*maxPageNum-maxPageNum;
        displayRow(nextPageBtn);
        --pageActiveIdx;
        displayPage(pageActiveIdx);
    });
}
