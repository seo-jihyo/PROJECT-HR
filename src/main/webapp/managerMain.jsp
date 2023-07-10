<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
    <!-- Boxicons CSS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   
    <link rel="stylesheet" href="assets/css/managerMain.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

    <title>Document</title>
    
</head>
<body>
    
    <header>
        <h1 class="company">MAIN</h1>

        <nav class="top-nav">

            <div class="container">
            <input type="checkbox" class="toggle" id="rounded">
            <label for="rounded" data-checked="근 무 중" class="rounded" data-unchecked= "  퇴   근" />
            </div>
        
            <img class="reload" src="assets/images/reload.png" onClick="window.location.reload()"/>
            <button class="mode-btn">관리자 모드</button>
        </nav>
    </header>
    <div class="navbar_1" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav_brand">
                    <i class='nav_toggle nav_icon menu-outline bx bx-menu' id="nav-toggle"></i>
                    <a href="#" class="nav_logo">Menu</a>
                </div>

                <a class="nav_list">
                    <a href="#" class="nav_link active">
                        <i class='nav_icon bx bx-home'></i>
                        <span class="nav_name">메인</span>

                    </a>
                    </a>
                    <div href="#" class="nav_link collapse">
                        <i class='nav_icon bx bx-calendar'></i>
                        <span class="nav_name">근무일정</span>

                        <i class='collapse_link bx bxs-chevron-down arrow'></i>

                        <ul class="collapse_menu">
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                        </ul>
                    </div>
                    <div href="#" class="nav_link collapse">
                        <i class='nav_icon bx bx-time'></i>
                        <span class="nav_name">출퇴근 기록</span>

                        <i class='collapse_link bx bxs-chevron-down arrow'></i>

                        <ul class="collapse_menu">
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                        </ul>
                    </div>
                    <div href="#" class="nav_link collapse">
                        <i class='nav_icon bx bxs-plane-alt'></i></i>
                        <span class="nav_name">휴   가</span>

                        <i class='collapse_link bx bxs-chevron-down arrow'></i>

                        <ul class="collapse_menu">
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                        </ul>
                    </div>
                    <div href="#" class="nav_link collapse">
                        <i class='nav_icon bx bxs-paper-plane' ></i>
                        <span class="nav_name">요청내역</span>

                        <i class='collapse_link bx bxs-chevron-down arrow'></i>

                        <ul class="collapse_menu">
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                        </ul>
                    </div>
                    <div href="#" class="nav_link collapse">
                        <i class='nav_icon bx bx-money-withdraw' ></i>
                        <span class="nav_name">급여내역</span>

                        <i class='collapse_link bx bxs-chevron-down arrow'></i>

                        <ul class="collapse_menu">
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                        </ul>
                    </div>
                    <div href="#" class="nav_link collapse">
                        <i class='nav_icon bx bxs-report' ></i></i>
                        <span class="nav_name">관   리</span>

                        <i class='collapse_link bx bxs-chevron-down arrow'></i>

                        <ul class="collapse_menu">
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                            <a href="#" class="collapse_sublink">Deta</a>
                        </ul>
                    </div>

            </div>

                
                
           
            <a href="#" class="nav_link">
                <i class='nav_icon bx bx-log-out' id="log_out"></i>
                <span class="nav_name">Log Out</span>
            </a>
        </nav>
    </div>
</div>
    <section id="body-pd">
        <h1>dsklfjldjfl</h1>


    </section>

    <script src="assets/js/managerMain.js"></script>
</body>
</html>