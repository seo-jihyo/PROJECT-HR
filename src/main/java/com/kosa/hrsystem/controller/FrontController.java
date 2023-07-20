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
import com.kosa.hrsystem.service.*;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FrontController() {
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
        CommuteRecordService commuteRecordService = new CommuteRecordServiceImp();
        RequestHistoryService requestHistoryService = new RequestHistoryServiceImp();
        UserService userService = new UserServiceImp();
        UserScheduleService userScheduleService = new UserScheduleServiceImp();
        WorkRecordService workRecordService = new WorkRecordServiceImp();
        DashBoardService dashBoardService = new DashBoardServiceImp();
        SalaryService salaryService = new SalaryServiceImp();
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
            attendanceService.toggleAtt(request, response);
            // 출퇴근 체크 요청
            // 근태 상태로 db에 삽입할지 업데이트 할지 정해야함 가져올건? 근무 상태
//            boolean attStatus = attendanceService.checkedAtt(request, response);
//            if (attStatus) {// 출근시
//                System.out.println("출근" + attStatus);
//                attendanceService.update(request, response);
//            } else {
//                System.out.println("퇴근" + attStatus);
//                attendanceService.insert(request, response);
//            }
        } else if (urlcommand.equals("/searchId.do")) {
            forward = new ActionForward();
            forward.setPath("/views/user/searchId.jsp");
        } else if (urlcommand.equals("/searchIdok.do")) {
            forward = empService.searchId(request, response);
        } else if (urlcommand.equals("/searchPwd.do")) {
            forward = empService.searchPwd(request, response);
        } else if (urlcommand.equals("/resetPwd.do")) {
            forward = new ActionForward();
            forward.setPath("/views/user/resetPwd.jsp");
        } else if (urlcommand.equals("/updatePwdok.do")) {
            forward = empService.updatePwd(request, response);
        }

        /* 직원 */
        else if (urlcommand.equals("/emp.do")) {
            forward = empService.selectAll(request, response);
        } else if (urlcommand.equals("/searchEmp.do")) {
            empService.searchEmp(request, response);
        } else if (urlcommand.equals("/empok.do")) {
            // 직원 추가하기
            forward = empService.insert(request, response);
        } else if (urlcommand.equals("/empupdate.do")) {
            forward = empService.update(request, response);
        } else if (urlcommand.equals("/empdelete.do")) {
            forward = empService.delete(request, response);
        } else if (urlcommand.equals("/careerselectByManager.do")) {
            forward = empService.selectCareerByManager(request, response);
        } else if (urlcommand.equals("/careerInsertByManager.do")) {
            forward = empService.insertCareerByManager(request, response);
        } else if (urlcommand.equals("/careerDeleteByManager.do")) {
            forward = empService.deleteCareerByManager(request, response);
        } else if (urlcommand.equals("/certSelectByManager.do")) {
            forward = empService.selectCertByManager(request, response);
        } else if (urlcommand.equals("/certInsertByManager.do")) {
            forward = empService.insertCertByManager(request, response);
        } else if (urlcommand.equals("/certDeleteByManager.do")) {
            forward = empService.deleteCertByManager(request, response);
        }

        /* 부서 */
        else if (urlcommand.equals("/dept.do")) {
            forward = deptService.selectAllByParent(request, response);
        } else if (urlcommand.equals("/deptok.do")) {
            // 추가하는 서비스
            forward = deptService.insert(request, response);
        } else if (urlcommand.equals("/deptupdate.do")) {
            forward = deptService.update(request, response);
        } else if (urlcommand.equals("/deptdelete.do")) {
            forward = deptService.delete(request, response);
        }
        /* 직급 */
        else if (urlcommand.equals("/rank.do")) {
            forward = rankService.selectAllByParent(request, response);
        } else if (urlcommand.equals("/rankok.do")) {
            // 추가하는 서비스
            forward = rankService.insert(request, response);
        } else if (urlcommand.equals("/rankupdate.do")) {
            forward = rankService.update(request, response);
        } else if (urlcommand.equals("/rankdelete.do")) {
            forward = rankService.delete(request, response);
        }
        /* 휴가(관리자) */
        else if (urlcommand.equals("/vacation.do")) {
            forward = vacationService.selectAllVacation(request, response);
        }
        // 휴가(관리자) 추가
        else if (urlcommand.equals("/vacationok.do")) {
            forward = vacationService.insertVacation(request, response);
        }
        // 휴가(관리자) 업데이트
        else if (urlcommand.equals("/vacationUpdate.do")) {
            forward = vacationService.updateVacation(request, response);
        }
        // 휴가(관리자) 삭제
        else if (urlcommand.equals("/vacationDelete.do")) {
            forward = vacationService.deleteVacation(request, response);
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
        } else if (urlcommand.equals("/addwork.do")) {
            forward = workService.insert(request, response);
        } else if (urlcommand.equals("/workupdate.do")) {
            forward = workService.update(request, response);
        } else if (urlcommand.equals("/workdelete.do")) {
            forward = workService.delete(request, response);
        }
        /* 근무일정 / 유형 */
        else if (urlcommand.equals("/workschedule.do")) {
            forward = workScheduleService.selectAll(request, response);
        } else if (urlcommand.equals("/workscheduleok.do")) {
            forward = workScheduleService.insert(request, response);
        } else if (urlcommand.equals("/workscheduleupdate.do")) {
            forward = workScheduleService.update(request, response);
        } else if (urlcommand.equals("/workscheduledelete.do")) {
            forward = workScheduleService.delete(request, response);
        } else if (urlcommand.equals("/worktype.do")) {
            forward = workScheduleService.selectAllType(request, response);
        } else if (urlcommand.equals("/worktypeok.do")) {
            forward = workScheduleService.insertType(request, response);
        } else if (urlcommand.equals("/worktypeupdate.do")) {
            forward = workScheduleService.updateType(request, response);
        } else if (urlcommand.equals("/worktypedelete.do")) {
            forward = workScheduleService.deleteType(request, response);
        }
        /* 날짜 검색 */
        else if (urlcommand.equals("/searchByDate.do")) {
            workScheduleService.searchByDate(request, response);
        } else if (urlcommand.equals("/searchByDateAtt.do")) {
            commuteRecordService.searchByDateAtt(request, response);
        } else if (urlcommand.equals("/searchByDateRequestHistory.do")) {
            requestHistoryService.searchByDateRequestHistory(request, response);
        }else if (urlcommand.equals("/searchVacByDate.do")) {
            vacationService.searchVacByDate(request, response);
        }
        /* 통합 검색(근무일정) */
        else if (urlcommand.equals("/searchTotal.do")) {
            workScheduleService.searchTotal(request, response);
        } else if (urlcommand.equals("/searchTotalAtt.do")) {
            commuteRecordService.searchTotalAtt(request, response);
        } else if (urlcommand.equals("/searchTotalRequestHistory.do")) {
            requestHistoryService.searchTotalRequestHistory(request, response);
        }else if (urlcommand.equals("/searchVacTotal.do")) {
            vacationService.searchVacTotal(request, response);
        }
        /* 출퇴근기록 */
        else if (urlcommand.equals("/cmtrecord.do")) {
            forward = commuteRecordService.selectAll(request, response);
        } else if (urlcommand.equals("/cmtrecordok.do")) {
            // 출퇴근 기록 추가
            forward = commuteRecordService.insert(request, response);
        } else if (urlcommand.equals("/cmtrecordupdate.do")) {
            // 출퇴근 기록 수정
            forward = commuteRecordService.update(request, response);
        } else if (urlcommand.equals("/cmtrecorddelete.do")) {
            // 출퇴근 기록 삭제
            forward = commuteRecordService.delete(request, response);
        }
        /* 사용자 출퇴근기록 */
        else if (urlcommand.equals("/workrecord.do")) {
            forward = workRecordService.selectAllRcd(request, response);
        } else if (urlcommand.equals("/workrecordInsertAtt.do")) {
            forward = workRecordService.insertRcd(request, response);
        } else if (urlcommand.equals("/searchWorkRecByDate.do")) {
            workRecordService.searchWorkRecByDate(request, response);
        }

        /* 사용자 마이페이지 */
        else if (urlcommand.equals("/myPage.do")) {
            forward = userService.selectOneUser(request, response);
        } else if (urlcommand.equals("/myInfoUpdate.do")) {
            forward = userService.updateOneUser(request, response);
        } else if (urlcommand.equals("/certInsertok.do")) {
            forward = userService.insertCert(request, response);
        } else if (urlcommand.equals("/certUpdate.do")) {
            forward = userService.updateCert(request, response);
        } else if (urlcommand.equals("/certDelete.do")) {
            forward = userService.deleteCert(request, response);
        } else if (urlcommand.equals("/careerSelect.do")) {
            forward = userService.selectCareer(request, response);
        } else if (urlcommand.equals("/careerInsert.do")) {
            forward = userService.insertCareer(request, response);
        } else if (urlcommand.equals("/careerUpdate.do")) {
            forward = userService.updateCareer(request, response);
        } else if (urlcommand.equals("/careerDelete.do")) {
            forward = userService.deleteCareer(request, response);
        } else if (urlcommand.equals("/upload.do")) {
            forward = userService.uploadImage(request, response);
        }
        /* 대시보드 */
        else if (urlcommand.equals("/dashboard.do")) {
            forward = dashBoardService.selectAll(request, response);
        }
        /* 사용자 스케줄 */
        else if (urlcommand.equals("/userSchedule.do")) {
            forward = userScheduleService.selectUserSchedule(request, response);
        }
        /* 사용자 요청내역*/
        else if (urlcommand.equals("/userRequesthistory.do")) {
            forward = requestHistoryService.selectAllByEmp(request, response);
        } else if (urlcommand.equals("/userScheduleInsertVac.do")) {
            forward = userScheduleService.UserScheduleInsetVac(request, response);
        } else if (urlcommand.equals("/userScheduleInsertWork.do")) {
            forward = userScheduleService.UserScheduleInsetWork(request, response);
        }
        /* 관리자 요청 내역 */
        else if (urlcommand.equals("/requesthistory.do")) {
            forward = requestHistoryService.selectAllRequest(request, response);
        } else if (urlcommand.equals("/approvalok.do")) {
            requestHistoryService.approval(request, response);
        } else if (urlcommand.equals("/salary.do")) {
            forward = salaryService.selectAllSalary(request, response);
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