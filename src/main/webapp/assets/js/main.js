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

//체크박스 전체 선택/해제
function allCheckboxes(boxNames, chkMode){
  const el = document.getElementsByName(boxNames);
  for(let i = 0; i < el.length; i++){
    if(!el[i].disabled){
      el[i].checked = chkMode;
    }
  }
}

//전체 체크 여부
function isAllCheck(boxNames, allChkName){
  const el = document.getElementsByName(boxNames);
  let checkboxCnt = 0;
  let checkedCnt = 0;
  for(let i = 0; i < el.length; i++){
    if(!el[i].disabled){
      checkboxCnt += 1;
      if(el[i].checked){
        checkedCnt += 1;
      }
    }
  }

  let chkMode = false;
  //체크박스 개수와 체크 된 체크박스 개수와 일치할 경우
  if(checkboxCnt == checkedCnt){
    chkMode = true;
  } else {
    chkMode = false;
  }
  //일치할 경우 천제 체크 박스는 체크, 일치하지 않을 경우 해제
  document.getElementById(allChkName).checked = chkMode;
}
