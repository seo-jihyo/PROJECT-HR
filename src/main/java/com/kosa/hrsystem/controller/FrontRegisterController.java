package com.kosa.hrsystem.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.service.AttendanceService;
import com.kosa.hrsystem.service.AttendanceServiceImp;
import com.kosa.hrsystem.service.CodeTableService;
import com.kosa.hrsystem.service.DeptServiceImp;
import com.kosa.hrsystem.service.EmpService;
import com.kosa.hrsystem.service.EmpServiceImp;
import com.kosa.hrsystem.service.PersonalInfoOkService;
import com.kosa.hrsystem.service.RankServiceImp;
import com.kosa.hrsystem.service.RequestHistoryService;
import com.kosa.hrsystem.service.RequestHistoryServiceImp;
import com.kosa.hrsystem.service.VacationService;
import com.kosa.hrsystem.service.VacationServiceImp;
import com.kosa.hrsystem.service.WorkScheduleService;
import com.kosa.hrsystem.service.WorkScheduleServiceImp;
import com.kosa.hrsystem.service.WorkService;
import com.kosa.hrsystem.service.WorkServiceImp;
import com.kosa.hrsystem.service.loginOkService;

@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FrontRegisterController() {
        super();

    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String urlcommand = requestURI.substring(contextPath.length());


        Action action = null;
        CodeTableService deptService = new DeptServiceImp();
        CodeTableService rankService = new RankServiceImp();
        EmpService empService = new EmpServiceImp();
        VacationService vacationService = new VacationServiceImp();
        WorkService workService = new WorkServiceImp();
        WorkScheduleService workScheduleService = new WorkScheduleServiceImp();
        AttendanceService attendanceService = new AttendanceServiceImp();
        RequestHistoryService requestHistoryService = new RequestHistoryServiceImp();


        ActionForward forward = null;

        /* 공통 */
        if (urlcommand.equals("/login.do")) {
            //UI 제공 (서비스 객체가 필요없다)
            forward = new ActionForward(); // 서비스가 필요없으니 ActionForward객체를 직접 생성해서 사용
            forward.setRedirect(false);
            forward.setPath("/views/user/login.jsp");

        } else if (urlcommand.equals("/loginok.do")) {
            //UI 제공 + 서비스 필요
            action = new loginOkService(); // 서비스가 필요하니 서비스를 처리해주는 TestAction이라는 서비스 클래스를 생성해서 사용
            forward = action.execute(request, response); //request 클라이언트가 요청한 페이지당 1개씩 만들어지는 request객체
        } else if (urlcommand.equals("/logoutok.do")) {
            HttpSession session = request.getSession();
            session.invalidate();
            forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("/login.do");
        } else if (urlcommand.equals("/check-attendance.do")) {
            // 출퇴근 체크 요청
            attendanceService.insert(request, response);
        } 
        
        /* 직원 */
        else if (urlcommand.equals("/emp.do")) {
            forward = empService.selectAll(request, response);
        } else if (urlcommand.equals("/empok.do")) {
        	// 직원 추가하기
        	forward = empService.insert(request, response);
        } else if (urlcommand.equals("/empupdate.do")) {
            forward = empService.update(request, response);
        } else if (urlcommand.equals("/empdelete.do")) {
            forward = empService.delete(request, response);
        }


        /* 부서 */
        else if (urlcommand.equals("/dept.do")) {
            forward = deptService.selectAllByParent(request, response);
        } else if (urlcommand.equals("/deptok.do")) {
            // 추가하는 서비스
            forward = deptService.insert(request, response);
        } else if (urlcommand.equals("/deptupdate.do")){
            forward = deptService.update(request,response);
        } else if (urlcommand.equals("/deptdelete.do")){
            forward = deptService.delete(request,response);
        }
        /* 직급 */
        else if (urlcommand.equals("/rank.do")) {
            forward = rankService.selectAllByParent(request, response);
        } else if (urlcommand.equals("/rankok.do")) {
            // 추가하는 서비스
            forward = rankService.insert(request, response);
        } else if (urlcommand.equals("/rankupdate.do")){
            forward = rankService.update(request, response);
        } else if (urlcommand.equals("/rankdelete.do")){
            forward = rankService.delete(request, response);
        }
        /* 휴가 유형 */
        else if (urlcommand.equals("/vacationtype.do")) {
            forward = vacationService.selectAllType(request, response);
        } else if (urlcommand.equals("/vacationtypeok.do")) {
        	// 휴가 유형 추가하는 서비스
        	forward = vacationService.insertType(request, response);
        } else if (urlcommand.equals("/vacationTypeUpdate.do")) {
            // 휴가 유형 업데이트
            forward = vacationService.updateType(request, response);
        } else if (urlcommand.equals("/vacationTypeDelete.do")) {
            // 휴가 유형 삭제
            forward = vacationService.deleteType(request, response);
        }
        /* 근로정보 */
        else if (urlcommand.equals("/work.do")) {
            forward = workService.selectAll(request, response);
        }
        /* 근로유형 */
        else if (urlcommand.equals("/worktype.do")) {
        	forward = workScheduleService.selectAllType(request, response);
        } else if (urlcommand.equals("/worktypeok.do")) {
        	forward = workScheduleService.insertType(request, response);
        } else if (urlcommand.equals("/worktypeupdate.do")) {
        	forward = workScheduleService.insertType(request, response);
        } else if (urlcommand.equals("/worktypedelete.do")) {
        	forward = workScheduleService.insertType(request, response);
        }
        /* 직원 커스텀 필드 */
        else if (urlcommand.equals("/personalInfook.do")) {
	    	action = new PersonalInfoOkService();
	    	forward = action.execute(request, response);
	    }

        /* 관리자 요청 내역 */
        else if (urlcommand.equals("/requesthistory.do")) {
        	forward = requestHistoryService.selectAllRequest(request, response);
        }
        if (forward != null) {
            if (forward.isRedirect()) { //true 페이지 재 요청 (location.href="페이지"
                response.sendRedirect(forward.getPath());
            } else { //기본적으로 forward ....
                //1. UI 전달된 경우
                //2. UI + 로직
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

}
