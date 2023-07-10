//package com.kosa.hrsystem.controller;
//
//import com.kosa.hrsystem.action.Action;
//import com.kosa.hrsystem.action.ActionForward;
//import com.kosa.hrsystem.service.*;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet('/admin/*.do')
//public class AdminController {
//    public AdminController() {
//        super();
//    }
//
//    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        request.setCharacterEncoding("UTF-8");
//
//        String requestURI = request.getRequestURI();
//        String contextPath = request.getContextPath();
//        String urlcommand = requestURI.substring(contextPath.length());
//
//
//        Action action = null;
//        ActionForward forward = null;
//
//        if (urlcommand.equals("/emp.do")) {
//            action = new EmpService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/empok.do")) {
//            // 직원 추가하기
//            action = new EmpOkService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/empupdate.do")) {
//            action = new EmpUpdateService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/empdelete.do")) {
//            action = new EmpDeleteService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/rank.do")) {
//            action = new RankService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/rankok.do")) {
//            // 추가하는 서비스
//            action = new RankOkService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/dept.do")) {
//            action = new DeptService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/deptok.do")) {
//            // 추가하는 서비스
//            action = new DeptOkService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/deptupdate.do")){
//            action = new DeptUpdateService();
//            forward = action.execute(request,response);
//        } else if (urlcommand.equals("/deptdelete.do")){
//            action = new DeptDeleteService();
//            forward = action.execute(request,response);
//        } else if (urlcommand.equals("/rank.do")) {
//            action = new RankService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/rankok.do")) {
//            // 추가하는 서비스
//            action = new RankOkService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/rankupdate.do")){
//            action = new RankUpdateService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/rankdelete.do")){
//            action = new RankDeleteService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/work.do")) {
//            action = new WorkService();
//            forward = action.execute(request, response);
//        } else if (urlcommand.equals("/workok.do")){
//            action = new WorkOkService();
//            forward = action.execute(request,response);
//        } else if (urlcommand.equals("/vacationType.do")){
//            action = new VacationTypeService();
//            forward = action.execute(request, response);
//        }
//
//        if (forward != null) {
//            if (forward.isRedirect()) { //true 페이지 재 요청 (location.href="페이지"
//                response.sendRedirect(forward.getPath());
//            } else { //기본적으로 forward ....
//                //1. UI 전달된 경우
//                //2. UI + 로직
//                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
//                dis.forward(request, response);
//            }
//        }
//    }
//
//
//}
