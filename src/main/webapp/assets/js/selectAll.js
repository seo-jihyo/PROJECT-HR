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