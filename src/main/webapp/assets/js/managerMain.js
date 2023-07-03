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